-- NPC Flavors v2 - Variable Resolution
-- Handles variable path resolution and word list lookups
-- ============================================================================
-- VARIABLE RESOLUTION
-- ============================================================================
-- Resolves {category.subcategory.archetype} three-level references to word lists
-- @param sVariablePath: string like "appearance.colors.general" or "physical.conditions.undead"
-- @return: table array of words, or empty table if path not found
function resolveVariable(sVariablePath)
    if not sVariablePath or sVariablePath == "" then return {}; end

    -- Split path into parts
    local tParts = StringManager.split(sVariablePath, ".", true);

    if #tParts < 2 then
        return {}; -- Invalid path (need at least category.subcategory)
    end

    -- Navigate to the word list
    local tCurrent = NPCFlavor_Data.Words;
    if not tCurrent then return {}; end

    for _, sPart in ipairs(tParts) do
        if tCurrent[sPart] then
            tCurrent = tCurrent[sPart];
        else
            -- Path not found
            return {};
        end
    end

    -- If we ended on an array, return a copy
    if type(tCurrent) == "table" and #tCurrent > 0 then
        return UtilityManager.copyDeep(tCurrent);
    end

    return {};
end

-- ============================================================================
-- TYPE HIERARCHY
-- ============================================================================

-- Extracts type hierarchy for template fallback
-- @param sNpcType: string like "undead.zombie", "beast", or "humanoid.orc"
-- @return: table array of types in fallback order
-- Example: "undead.zombie" → ["undead.zombie", "undead", "global"]
function getTypeHierarchy(sNpcType)
    if not sNpcType or sNpcType == "" then return {"global"}; end

    local tHierarchy = {sNpcType};

    -- Split on dots (third parameter true returns as table)
    local tParts = StringManager.split(sNpcType, ".", true);

    -- Walk up the hierarchy
    for i = #tParts - 1, 1, -1 do
        -- Build parent type by concatenating first i parts
        local tSubParts = {};
        for j = 1, i do table.insert(tSubParts, tParts[j]); end
        local sParentType = table.concat(tSubParts, ".");
        table.insert(tHierarchy, sParentType);
    end

    -- Always fall back to generic
    table.insert(tHierarchy, "generic");

    return tHierarchy;
end

-- ============================================================================
-- RANDOM SELECTION
-- ============================================================================

-- Randomly selects a word from array
-- @param tWords: array of word strings
-- @return: randomly selected word, or empty string if array is empty
function selectRandomWord(tWords)
    if not tWords or #tWords == 0 then return ""; end

    local nIndex = math.random(1, #tWords);
    return tWords[nIndex];
end
