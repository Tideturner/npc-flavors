-- Parses template patterns and applies text modifiers

-- ============================================================================
-- PATTERN PARSING
-- ============================================================================

-- Parses template pattern and returns array of tokens
-- @param sPattern: string like "{physical.conditions.undead:capitalize} {name}"
-- @return: table array of token objects (literals and variables)
function parsePattern(sPattern)
    if not sPattern or sPattern == "" then return {}; end

    local tTokens = {};
    local nPos = 1;

    while nPos <= #sPattern do
        -- Find next variable placeholder
        local nVarStart, nVarEnd, sVarContent =
            string.find(sPattern, "{([^}]+)}", nPos);

        if nVarStart then
            -- Add literal text before variable
            if nVarStart > nPos then
                table.insert(tTokens, {
                    type = "literal",
                    value = string.sub(sPattern, nPos, nVarStart - 1)
                });
            end

            -- Parse variable token
            local tToken = parseVariableToken(sVarContent);
            table.insert(tTokens, tToken);

            nPos = nVarEnd + 1;
        else
            -- No more variables, add remaining literal
            local sRemaining = string.sub(sPattern, nPos);
            if sRemaining ~= "" then
                table.insert(tTokens, {
                    type = "literal", 
                    value = sRemaining
                });
            end
            break
        end
    end

    return tTokens;
end

-- Parses variable token content
-- @param sContent: string like "appearance.colors.general:capitalize"
-- @return: token table with path and modifiers
function parseVariableToken(sContent)
    local tToken = {type = "variable"};

    -- Extract variable path and modifiers
    local tParts = StringManager.split(sContent, ":", true);

    tToken.path = tParts[1]; -- Full three-level path: "category.subcategory.archetype"
    tToken.modifiers = {};

    -- Parse modifiers (capitalize, upper, article, etc.)
    for i = 2, #tParts do
        table.insert(tToken.modifiers, tParts[i]);
    end

    return tToken;
end

-- ============================================================================
-- MODIFIER APPLICATION
-- ============================================================================

-- Applies text modifiers to a word
-- @param sWord: string to modify
-- @param tModifiers: array of modifier strings
-- @return: modified string
function applyModifiers(sWord, tModifiers)
    if not sWord or sWord == "" then return sWord; end

    if not tModifiers or #tModifiers == 0 then return sWord; end

    local sResult = sWord;

    for _, sModifier in ipairs(tModifiers) do
        if sModifier == "capitalize" then
            -- Capitalize first letter
            sResult = string.upper(string.sub(sResult, 1, 1)) ..
                          string.sub(sResult, 2);

        elseif sModifier == "upper" then
            -- ALL CAPS
            sResult = string.upper(sResult);

        elseif sModifier == "lower" then
            -- all lowercase
            sResult = string.lower(sResult);

        elseif sModifier == "article" then
            -- Prepend "a" or "an"
            local sFirstChar = string.lower(string.sub(sResult, 1, 1));
            if sFirstChar == "a" or sFirstChar == "e" or sFirstChar == "i" or
                sFirstChar == "o" or sFirstChar == "u" then
                sResult = "an " .. sResult;
            else
                sResult = "a " .. sResult;
            end
        end
    end

    return sResult;
end


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
-- Example: "undead.zombie" → ["undead.zombie", "undead", "generic"]
function getTypeHierarchy(sNpcType)
    if not sNpcType or sNpcType == "" then return {"generic"}; end

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
