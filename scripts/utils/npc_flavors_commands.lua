-- Extracts unique NPC types from campaign database and writes to file

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

function onInit()
    if not Session.IsHost then return; end

    Comm.registerSlashHandler("npcftypes", processExtractTypesCommand);
    
    NPCFlavor_Debug.logDebug("NPCFlavor_TypeExtractor: Initialized with /npcftypes command");
end

-- ============================================================================
-- COMMAND HANDLER
-- ============================================================================

-- Processes the /npcftypes slash command
-- @param sCommand: command string
-- @param sParams: command parameters (unused)
function processExtractTypesCommand(sCommand, sParams)
    ChatManager.SystemMessage("=== Extracting NPC Types ===");

    local tUniqueTypes = extractUniqueNPCTypes();
    local nCount = #tUniqueTypes;

    if nCount == 0 then
        ChatManager.SystemMessage("[NPC Flavors] No NPC types found in campaign.");
        return;
    end

    table.sort(tUniqueTypes);
    ChatManager.SystemMessage(string.format("[NPC Flavors] Extracted %d unique NPC types.", nCount));

    local bSuccess, sError = writeTypesToFile(tUniqueTypes);
    
    if not bSuccess then
        ChatManager.SystemMessage("[NPC Flavors] Error writing file: " .. (sError or "unknown error"));
        end
    end

-- ============================================================================
-- TYPE EXTRACTION
-- ============================================================================

-- Extracts all unique NPC types from the campaign database
-- @return: table array of unique type strings
function extractUniqueNPCTypes()
    local tTypes = {};
    local tUniqueSet = {};
    
    -- Scan NPC database paths from various rulesets
    local tNPCPaths = {
        "npc",                  -- All rulesets
        "reference.npcs",       -- CoreRPG, 4E, PFRPG, SavageWorlds, SWPF, Star Trek 2d20
        "reference.npcdata",    -- 5E, 3.5E, 2E, PFRPG2
        "reference.npc",        -- SFRPG, CosmereRPG, Fallout 2d20 (singular)
        -- "human",                -- SavageWorlds, SWPF
        -- "reference.humans",     -- SavageWorlds, SWPF
        -- "reference.trap",       -- SFRPG (traps as NPCs)
        -- "reference.vehicle"     -- SFRPG (vehicles as NPCs)
    };
    
    for _, sBasePath in ipairs(tNPCPaths) do
        NPCFlavor_Debug.logDebug("extractUniqueNPCTypes: Getting global children for '" .. sBasePath .. "'");

        local tChildren = DB.getChildrenGlobal(sBasePath);
        
        if tChildren and #tChildren > 0 then
            NPCFlavor_Debug.logDebug("extractUniqueNPCTypes: Found " .. #tChildren .. " children at '" .. sBasePath .. "'");
            for _, nodeNPC in pairs(tChildren) do
                local sType = DB.getValue(nodeNPC, "type", "");
        if sType and sType ~= "" then
                    sType = StringManager.trim(sType);
                    
                    if not tUniqueSet[sType] then
                        tUniqueSet[sType] = true;
                        NPCFlavor_Debug.logVerbose("Found type: " .. sType);
                    end
                end
            end
        else
            NPCFlavor_Debug.logDebug("extractUniqueNPCTypes: No children found at '" .. sBasePath .. "'");
        end
    end

    for sType, _ in pairs(tUniqueSet) do
        table.insert(tTypes, sType);
    end

    return tTypes;
    end

-- ============================================================================
-- FILE WRITING
-- ============================================================================

-- Writes types array to file in campaign folder
-- @param tTypes: array of type strings
-- @return: boolean success, string error message
function writeTypesToFile(tTypes)
    local sRuleset = User.getRulesetName() or "unknown";
    
    local sCampaignPath = File.getCampaignFolder();
    if not sCampaignPath or sCampaignPath == "" then
        return false, "Could not determine campaign folder path";
    end
    
    -- Remove trailing slash if present
    if string.sub(sCampaignPath, -1) == "/" or string.sub(sCampaignPath, -1) == "\\" then
        sCampaignPath = string.sub(sCampaignPath, 1, -2);
    end

    local sFileName = string.format("types_%s.txt", sRuleset);
    local sFilePath = sCampaignPath .. "/" .. sFileName;

    local tLines = {
        "Ruleset: " .. sRuleset,
        "=== Types ==="
    };
    
    for _, sType in ipairs(tTypes) do
        table.insert(tLines, sType);
    end
    
    local sContent = table.concat(tLines, "\n");
    
    local bSuccess = pcall(function()
        File.saveTextFile(sFilePath, sContent);
    end);
    
    if bSuccess then
        ChatManager.SystemMessage("[NPC Flavors] Wrote types to: " .. sFilePath);
        return true, nil;
    else
        return false, "File.saveTextFile failed";
    end
end
