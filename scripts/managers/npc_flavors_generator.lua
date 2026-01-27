-- Generates flavored names for NPCs using templates and word lists
--
-- FLOW OVERVIEW:
-- ==============
-- 1. Combat adds NPC → processNPCAdd() [runs AFTER FG's numbering]
--    ├─ Check if enabled, already flavored, is NPC
--    ├─ storeOriginalNames() → capture FG's name (with number if added) & non-ID name for reset
--    ├─ setCustomNonIDBase() → set custom non-ID, preserving FG's number suffix
--    ├─ Track first occurrence by base name (only flavor duplicates)
--    └─ On duplicate → applyFlavorWithChance()
--
-- 2. applyFlavorWithChance()
--    ├─ Roll random chance (NPCF_FCHANCE option)
--    └─ On success → applyFlavorToNPC()
--
-- 3. applyFlavorToNPC()
--    ├─ Parse NPC type (NPCFlavor_Types.parseNPCType)
--    ├─ Get non-ID base name (getNonIDBaseName)
--    ├─ generateFlavor() → returns flavored names
--    └─ Update CT Node with new names
--
-- 4. generateFlavor()
--    ├─ selectTemplate() → weighted random by type hierarchy
--    ├─ Parse pattern tokens (NPCFlavor_Parser)
--    ├─ Resolve variables to words
--    ├─ Apply modifiers (capitalize, etc.)
--    └─ cleanupResult() → return flavored name
--
-- ENTRY POINTS:
--   - processNPCAdd(node)      - Called when NPC added to combat
--   - regenerateFlavor(node)   - Called from UI button (re-roll)
--   - resetFlavor(node)        - Called from UI button (restore original)
--   - resetTracking()          - Called on new battle start
--
-- ============================================================================

-- Track first occurrence of each base name (stores node and flavored status)
local tFirstOccurrence = {};

-- ============================================================================
-- HELPER FUNCTIONS (Internal)
-- ============================================================================

-- Checks if a combat tracker node is a valid NPC
-- @param nodeEntry: combat tracker node
-- @return: boolean true if valid NPC
function isValidNPC(nodeEntry)
    if not nodeEntry then return false; end
    local sActorType = ActorManager.getRecordType(nodeEntry);
    return sActorType == "npc";
end

-- ============================================================================
-- ENTRY POINTS
-- ============================================================================
-- These functions are called from npc_flavors_combat.lua or UI elements

-- Resets tracking for new battle
function resetTracking()
    tFirstOccurrence = {};
end


-- Called when NPC is added to combat tracker
-- @param nodeEntry: combat tracker node
function processNPCAdd(nodeEntry)
    if not NPCFlavor_Options.isEnabled() then
        NPCFlavor_Debug.logDebug("processNPCAdd: Extension disabled, skipping");
        return;
    end

    -- Check if already flavored
    local bHasFlavor = DB.getValue(nodeEntry, "has_npc_flavor", 0) == 1;
    if bHasFlavor then
        NPCFlavor_Debug.logDebug("processNPCAdd: Already flavored, skipping");
        return;
    end

    -- Check if it's an NPC
    if not isValidNPC(nodeEntry) then
        NPCFlavor_Debug.logDebug("processNPCAdd: Not an NPC, skipping");
        return;
    end

        -- Store original names (only happens once per NPC)
    storeOriginalNames(nodeEntry);


    -- Get name and extract base name
    local sName = DB.getValue(nodeEntry, "name", "");
    if sName == "" then
        NPCFlavor_Debug.logDebug("processNPCAdd: Empty name, skipping");
        return;
    end
    local sBaseName = getBaseName(sName);
    NPCFlavor_Debug.logDebug("processNPCAdd: Processing '" .. sName .. "' (base: '" .. sBaseName .. "')");

    -- Set custom non-ID base name (preserves FG's numbering)
    setCustomNonIDBase(nodeEntry, sName);

    -- Check if this is the first occurrence of this base name
    -- First occurrence is not flavored immediately - wait for duplicates
    if not tFirstOccurrence[sBaseName] then
        -- First occurrence - store the node reference
        NPCFlavor_Debug.logDebug("processNPCAdd: First occurrence of '" .. sBaseName .. "', waiting for duplicates");
        tFirstOccurrence[sBaseName] = {
            has_npc_flavor = false,
            node = nodeEntry
        };
        return;
    end

    -- Get flavor chance from options
    local nFlavorChance = NPCFlavor_Options.getFlavorChance();
    
    -- Process the first occurrence if it exists and hasn't been processed
    local nodeFirst = getFirstOccurrenceNode(sBaseName);
    if nodeFirst then
        applyFlavorWithChance(nodeFirst, nFlavorChance);
        tFirstOccurrence[sBaseName].has_npc_flavor = true;
    end

    -- Process the current NPC
    applyFlavorWithChance(nodeEntry, nFlavorChance);
end

-- Regenerates flavor for an existing combat tracker entry
-- Called when user clicks the regenerate button on a CT entry
-- @param nodeEntry: combat tracker node
function regenerateFlavor(nodeEntry)
    if not isValidNPC(nodeEntry) then return; end
    
    -- Mark as unprocessed and reapply flavor
    DB.setValue(nodeEntry, "has_npc_flavor", "number", 0);
    applyFlavorToNPC(nodeEntry);
    DB.setValue(nodeEntry, "has_npc_flavor", "number", 1);
    
    NPCFlavor_Debug.logSimple("Regenerated flavor for: " .. DB.getValue(nodeEntry, "name", ""));
end

-- Resets flavor to original names (Alt-click behavior)
-- Called when user Alt-clicks the regenerate button on a CT entry
-- @param nodeEntry: combat tracker node
function resetFlavor(nodeEntry)
    if not isValidNPC(nodeEntry) then return; end
    
    -- Get original names
    local sOriginalName = DB.getValue(nodeEntry, "npcf_original_name", "");
    local sOriginalNonID = DB.getValue(nodeEntry, "npcf_original_nonid", "");
    
    if sOriginalName ~= "" then
        DB.setValue(nodeEntry, "name", "string", sOriginalName);
        NPCFlavor_Debug.logSimple("Reset to original name: " .. sOriginalName);
    end
    
    if sOriginalNonID ~= "" then
        DB.setValue(nodeEntry, "nonid_name", "string", sOriginalNonID);
    end
    
    -- Mark as unprocessed so it can be reflavored later if desired
    DB.setValue(nodeEntry, "has_npc_flavor", "number", 0);
end


-- ============================================================================
-- CORE FLAVOR GENERATION
-- ============================================================================

-- Main algorithm for generating flavored names
-- @param sNpcName: NPC name string
-- @param sNpcType: NPC type string (e.g., "undead.zombie")
-- @param sNonIDName: Optional non-identified name string
-- @return: flavored name string, flavored non-ID name string (or nil)
function generateFlavor(sNpcName, sNpcType, sNonIDName)
    NPCFlavor_Debug.logDebug("generateFlavor: Starting for '" .. sNpcName .. "' (type: " .. sNpcType .. ")");

    -- 1. Select template
    local tTemplate = selectTemplate(sNpcType);

    if not tTemplate then
        NPCFlavor_Debug.logVerbose("No template selected, returning original name");
        return sNpcName, sNonIDName;
    end

    NPCFlavor_Debug.logVerbose("Selected template: " .. (tTemplate.description or tTemplate.pattern));
    NPCFlavor_Debug.logDebug("Template pattern: " .. tTemplate.pattern);

    -- 2. Parse pattern
    local tTokens = NPCFlavor_Parser.parsePattern(tTemplate.pattern);

    -- 3. Generate flavor string for identified name
    local sResult = "";
    local sResultNonID = (sNonIDName and sNonIDName ~= "") and "" or nil;

    for i, tToken in ipairs(tTokens) do
        if tToken.type == "literal" then
            -- Add literal text as-is
            sResult = sResult .. tToken.value;
            if sResultNonID then
                sResultNonID = sResultNonID .. tToken.value;
            end

        elseif tToken.type == "variable" then
            -- Handle special {name} variable
            if tToken.path == "name" then
                sResult = sResult .. sNpcName;
                if sResultNonID then
                    sResultNonID = sResultNonID .. sNonIDName;
                end

            else
                -- Resolve variable to word list
                local tWords =
                    NPCFlavor_Parser.resolveVariable(tToken.path);

                if #tWords > 0 then
                    -- Randomly select a word
                    local sWord = NPCFlavor_Parser.selectRandomWord(tWords);

                    -- Apply modifiers
                    if #tToken.modifiers > 0 then
                        sWord = NPCFlavor_Parser.applyModifiers(sWord,
                                                               tToken.modifiers);
                    end

                    sResult = sResult .. sWord;
                    if sResultNonID then
                        sResultNonID = sResultNonID .. sWord;
                    end
                end
            end
        end
    end

    -- 4. Clean up result
    sResult = cleanupResult(sResult);
    if sResultNonID then sResultNonID = cleanupResult(sResultNonID); end

    return sResult, sResultNonID;
end

-- Selects a template using weighted random selection with type hierarchy fallback
-- @param sNpcType: string like "undead.zombie", "beast", or "humanoid.orc"
-- @return: template table with pattern and weight, or nil
function selectTemplate(sNpcType)
    -- Get type hierarchy
    local tHierarchy = NPCFlavor_Parser.getTypeHierarchy(sNpcType);

    NPCFlavor_Debug.logDebug("selectTemplate: Type hierarchy for '" .. sNpcType .. "': " .. table.concat(tHierarchy, " -> "));

    -- Find first matching template set
    local tTemplates = nil;

    NPCFlavor_Debug.logDebug("selectTemplate: NPCFlavor_Templates.Templates type = " .. (NPCFlavor_Templates.Templates and type(NPCFlavor_Templates.Templates) or "nil"));

    for _, sType in ipairs(tHierarchy) do
        NPCFlavor_Debug.logDebug("selectTemplate: Checking for templates at NPCFlavor_Templates.Templates['" .. sType .. "']");
        if NPCFlavor_Templates.Templates and NPCFlavor_Templates.Templates[sType] then
            tTemplates = NPCFlavor_Templates.Templates[sType];
            NPCFlavor_Debug.logDebug("selectTemplate: Matched template type '" .. sType .. "' with " .. #tTemplates .. " templates");
            break
        else
            NPCFlavor_Debug.logDebug("selectTemplate: No match for '" .. sType .. "'");
        end
    end

    if not tTemplates or #tTemplates == 0 then
        NPCFlavor_Debug.logDebug("selectTemplate: No templates found for type '" .. sNpcType .. "'");
        return nil;
    end

    -- Calculate total weight
    local nTotalWeight = 0;
    for _, tTemplate in ipairs(tTemplates) do
        nTotalWeight = nTotalWeight + (tTemplate.weight or 1);
    end

    -- Weighted random selection
    local nRoll = math.random() * nTotalWeight;
    local nCumulative = 0;

    for i, tTemplate in ipairs(tTemplates) do
        local nWeight = tTemplate.weight or 1;
        nCumulative = nCumulative + nWeight;

        if nRoll <= nCumulative then
            return tTemplate;
        end
    end

    -- Fallback (should never reach here)
    return tTemplates[#tTemplates];
end

-- ============================================================================
-- FLAVOR APPLICATION
-- ============================================================================

-- Applies flavor with random chance check
-- @param nodeEntry: combat tracker node
-- @param nFlavorChance: percentage chance (1-100)
function applyFlavorWithChance(nodeEntry, nFlavorChance)
    -- Roll for flavor chance
    local nRoll = math.random(1, 100);
    if nRoll > nFlavorChance then
        -- Mark as processed even if we didn't flavor it
        DB.setValue(nodeEntry, "has_npc_flavor", "number", 1);
        return;
    end

    applyFlavorToNPC(nodeEntry);
    
    -- Mark as processed
    DB.setValue(nodeEntry, "has_npc_flavor", "number", 1);
end

-- Applies flavor to a single NPC node
-- @param nodeEntry: combat tracker node
function applyFlavorToNPC(nodeEntry)
    -- Get stored original name (should always exist, set in processNPCAdd)
    local sOriginalName = DB.getValue(nodeEntry, "npcf_original_name", "");
    local sOriginalNonID = DB.getValue(nodeEntry, "npcf_original_nonid", "");
    
    -- Use stored original name for base (strip number for flavoring)
    local sBaseName = getBaseName(sOriginalName);
    NPCFlavor_Debug.logDebug("applyFlavorToNPC: Using stored original name '" .. sOriginalName .. "' (base: '" .. sBaseName .. "')");
    
    local sType = DB.getValue(nodeEntry, "type", "");

    if sBaseName == "" then
        NPCFlavor_Debug.logDebug("applyFlavorToNPC: Empty name after extraction, aborting");
        return;
    end

    NPCFlavor_Debug.logVerbose("Applying flavor to: " .. sBaseName .. " (type: " .. (sType ~= "" and sType or "<empty>") .. ")");

    -- Parse type (format varies by ruleset)
    local sNpcType = NPCFlavor_Types.parseNPCType(sType);    

    -- Determine base name for non-identified based on NPCF_NONID option
    local sNonIDBase = getNonIDBaseName(nodeEntry, sBaseName);

    -- Generate flavor for both identified and non-identified names
    local sFlavoredName, sFlavoredNonID =
        generateFlavor(sBaseName, sNpcType, sNonIDBase);

    NPCFlavor_Debug.logVerbose("Generated flavor: '" .. sBaseName .. "' -> '" .. sFlavoredName .. "'");

    -- Update identified name in combat tracker
    if sFlavoredName ~= sBaseName then
        DB.setValue(nodeEntry, "name", "string", sFlavoredName);
        NPCFlavor_Debug.logSimple("Applied flavor: " .. sFlavoredName);
    else
        NPCFlavor_Debug.logVerbose("No flavor change (name unchanged)");
    end

    -- Update non-identified name if it exists
    if sFlavoredNonID then
        DB.setValue(nodeEntry, "nonid_name", "string", sFlavoredNonID);
    end
end

-- Gets the first occurrence node for a given base name
-- @param sBaseName: the base NPC name
-- @return: valid node if exists and unprocessed, nil otherwise
function getFirstOccurrenceNode(sBaseName)
    if not tFirstOccurrence[sBaseName] then
        return nil;
    end
    
    -- Already processed
    if tFirstOccurrence[sBaseName].has_npc_flavor then
        return nil;
    end
    
    local nodeFirst = tFirstOccurrence[sBaseName].node;
    if not nodeFirst then
        return nil;
    end
    
    -- Verify the node still exists (may have been deleted from combat)
    local bSuccess, sPath = pcall(DB.getPath, nodeFirst);
    if bSuccess and sPath then
        return nodeFirst;
    end
    
    -- Node no longer valid (deleted from combat), clean it up
    tFirstOccurrence[sBaseName] = nil;
    return nil;
end

-- ============================================================================
-- NAME PROCESSING & HELPERS
-- ============================================================================

-- Sets custom non-ID base name for an NPC based on user preferences
-- @param nodeEntry: combat tracker node
-- @param sFullName: the full NPC name (may include number like "Zombie 2")
function setCustomNonIDBase(nodeEntry, sFullName)
    -- Always set non-ID base name based on type (unless option is "unchanged")
    -- When "unchanged", let FG set its default and we'll use that for flavoring
    if NPCFlavor_Options.getNonIDMode() ~= "unchanged" then
        -- Extract base name and number suffix
        local sBaseName = getBaseName(sFullName);
        -- Extract number from end (e.g., "Zombie 2" -> "2")
        local sNumber = sFullName:match("%s+(%d+)$");
        
        local sNonIDBase = getNonIDBaseName(nodeEntry, sBaseName);
        if sNonIDBase then
            -- Append number if present (preserves FG's numbering)
            if sNumber then
                sNonIDBase = sNonIDBase .. " " .. sNumber;
            end
            
            local sCurrentNonID = DB.getValue(nodeEntry, "nonid_name", "");
            NPCFlavor_Debug.logDebug("setCustomNonIDBase: Setting custom non-ID base '" .. sNonIDBase .. "' (current: '" .. sCurrentNonID .. "')");
            -- Only update if different from current value (avoid unnecessary DB writes)
            if sCurrentNonID ~= sNonIDBase then
                DB.setValue(nodeEntry, "nonid_name", "string", sNonIDBase);
            end
        end
    else
        NPCFlavor_Debug.logDebug("setCustomNonIDBase: Leaving non-ID name unchanged (will use FG default for flavoring)");
    end
end

-- Stores original name and non-ID name for an NPC (only if not already stored)
-- @param nodeEntry: combat tracker node
function storeOriginalNames(nodeEntry)
    -- Store original name if not already stored
    local sStoredOriginalName = DB.getValue(nodeEntry, "npcf_original_name", "");
    if sStoredOriginalName == "" then
        local sName = DB.getValue(nodeEntry, "name", "");
        DB.setValue(nodeEntry, "npcf_original_name", "string", sName);
        NPCFlavor_Debug.logDebug("storeOriginalNames: Stored original name '" .. sName .. "'");
    end
    
    -- Store original non-ID name if not already stored
    local sStoredOriginalNonID = DB.getValue(nodeEntry, "npcf_original_nonid", "");
    if sStoredOriginalNonID == "" then
        -- Get the current non-ID name (either custom or FG default)
        local sNonIDName = DB.getValue(nodeEntry, "nonid_name", "");
        if sNonIDName ~= "" then
            DB.setValue(nodeEntry, "npcf_original_nonid", "string", sNonIDName);
            NPCFlavor_Debug.logDebug("storeOriginalNames: Stored original non-ID name '" .. sNonIDName .. "'");
        end
    end
end

-- Extracts base name from NPC name by removing trailing numbering
-- @param sName: NPC name like "Goblin 3" or "Orc"
-- @return: base name like "Goblin" or "Orc"
function getBaseName(sName)
    if not sName or sName == "" then return ""; end

    -- Remove trailing " #" pattern (e.g., "Goblin 3" -> "Goblin")
    local sBaseName = sName:match("^(.-)%s+%d+$") or sName;

    return sBaseName;
end

-- Gets the base name to use for non-identified NPCs based on NPCF_NONID option
-- @param nodeEntry: combat tracker node
-- @param sOriginalName: the NPC's current name
-- @return: base name to use for flavor generation, or nil if should use FG's default
function getNonIDBaseName(nodeEntry, sOriginalName)
    local sOption = NPCFlavor_Options.getNonIDMode();

    NPCFlavor_Debug.logDebug("getNonIDBaseName: Option = '" .. sOption .. "'");

    -- Check option first
    if sOption == "unchanged" then
        -- Use Fantasy Grounds' actual default non-ID name (read from DB)
        local sCurrentNonID = DB.getValue(nodeEntry, "nonid_name", "");
        NPCFlavor_Debug.logDebug("getNonIDBaseName: unchanged mode, current non-ID = '" .. sCurrentNonID .. "'");
        -- Strip numbering from non-ID name (e.g., "« Unidentified NPC » 2" -> "« Unidentified NPC »")
        local sBaseNonID = getBaseName(sCurrentNonID);
        NPCFlavor_Debug.logDebug("getNonIDBaseName: stripped to base = '" .. sBaseNonID .. "'");
        -- Return the actual FG default if it exists, otherwise nil
        return (sBaseNonID ~= "") and sBaseNonID or nil;
    elseif sOption == "unknown" then
        return "Unknown";
    elseif sOption == "uident_type" then
        local sRawType = DB.getValue(nodeEntry, "type", "");
        local sNpcType = NPCFlavor_Types.parseNPCType(sRawType);
        return getNonIDBaseNameFallback(sRawType, sNpcType, true);
    elseif sOption == "type" then
        local sRawType = DB.getValue(nodeEntry, "type", "");
        local sNpcType = NPCFlavor_Types.parseNPCType(sRawType);
        return getNonIDBaseNameFallback(sRawType, sNpcType, false)
    end

    -- Shouldn't reach here, but fallback to nil
    return nil;
end

-- Gets fallback name for unmatched or empty NPC types
-- @param sRawType: raw type string from NPC record
-- @param sParsedType: parsed type from NPCFlavorTypes.parseNPCType()
-- @param bIncludeUnknown: whether to prepend "Unknown" to the result
-- @return: fallback name string
function getNonIDBaseNameFallback(sRawType, sParsedType, bIncludeUnknown)
    if sRawType == "" then
        -- No type at all - try ruleset's default non-ID string first
        if bIncludeUnknown then
            local sRulesetDefault = Interface.getString("library_recordtype_empty_nonid_npc");
            if sRulesetDefault and sRulesetDefault ~= "" then
                return sRulesetDefault;
            end
            return "Unknown";
        else
            return "Creature";
        end
    elseif sParsedType == "generic" then
        -- Unmatched type - use the full raw type, cleaned up
        local sCleanedType = cleanupTypeName(sRawType);
        if bIncludeUnknown then
            return "Unknown " .. sCleanedType;
        else
            return sCleanedType;
        end
    else
        -- Matched type - convert dot notation to display name
        local sDisplayType = getTypeDisplayName(sParsedType);
        local sPrefix = bIncludeUnknown and "Unknown " or "";
        return sPrefix .. sDisplayType;
    end
end

-- Converts parsed type (with dot notation) to display name
-- @param sParsedType: parsed type like "undead.intelligent" or "beast"
-- @return: display name like "Intelligent Undead" or "Beast"
function getTypeDisplayName(sParsedType)
    if not sParsedType or sParsedType == "" then return "Creature"; end
    
    -- Check if it has a subtype (dot notation)
    if string.find(sParsedType, "%.") then
        local tParts = StringManager.split(sParsedType, ".", true);
        if #tParts == 2 then
            -- Convert "undead.intelligent" to "Intelligent Undead"
            local sParent = StringManager.capitalize(tParts[1]);
            local sSubtype = StringManager.capitalize(tParts[2]);
            return sSubtype .. " " .. sParent;
        end
    end
    
    -- No subtype, just capitalize
    return StringManager.capitalize(sParsedType);
end

-- Cleans up raw NPC type string for display
-- @param sRawType: raw type string (e.g., "Medium undead, zombie")
-- @return: cleaned type string (e.g., "Undead, Zombie")
function cleanupTypeName(sRawType)
    if not sRawType or sRawType == "" then return ""; end
    
    -- Remove common size prefixes
    local sClean = sRawType:gsub("^%s*[Tt]iny%s+", "");
    sClean = sClean:gsub("^%s*[Ss]mall%s+", "");
    sClean = sClean:gsub("^%s*[Mm]edium%s+", "");
    sClean = sClean:gsub("^%s*[Ll]arge%s+", "");
    sClean = sClean:gsub("^%s*[Hh]uge%s+", "");
    sClean = sClean:gsub("^%s*[Gg]argantuan%s+", "");
    
    -- Trim whitespace
    sClean = sClean:match("^%s*(.-)%s*$") or sClean;
    
    -- Capitalize first letter
    return StringManager.capitalize(sClean);
end

-- ============================================================================
-- UTILITY FUNCTIONS
-- ============================================================================

-- Cleans up generated result (trim extra spaces, fix formatting)
-- @param sResult: generated string
-- @return: cleaned string
function cleanupResult(sResult)
    if not sResult or sResult == "" then return ""; end

    -- Trim leading/trailing whitespace
    sResult = StringManager.trim(sResult);

    -- Replace multiple spaces with single space
    sResult = sResult:gsub("%s+", " ");

    -- Fix spacing around parentheses
    sResult = sResult:gsub("%s+%(", " (");
    sResult = sResult:gsub("%(+%s+", "(");
    sResult = sResult:gsub("%s+%)", ")");
    
    -- Remove empty parentheses
    sResult = sResult:gsub("%(%s*%)", "");
    
    -- Final trim
    sResult = StringManager.trim(sResult);

    return sResult;
end

-- Export module
return NPCFlavor_Generator;
