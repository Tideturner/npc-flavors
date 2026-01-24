-- Identifies NPC types from database strings

-- Cached list of known types (standard + aliases) - built once during init
local tCachedKnownTypes = nil;

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Sets up the type system and builds the known types cache
function onInit()
    -- Extension is host-only
    if not Session.IsHost then return; end

    -- Build cached list of known types (standard + aliases)
    buildKnownTypesCache();
end

-- ============================================================================
-- TYPE PARSING
-- ============================================================================

-- Builds the cached list of known types (standard + aliases)
-- This cache is used for efficient type matching during NPC processing
function buildKnownTypesCache()
    tCachedKnownTypes = {};

    -- Add standard types
    for _, sType in ipairs(NPCFlavor_Templates.StandardTypes or {}) do
        table.insert(tCachedKnownTypes, sType);
    end

    -- Add all aliases (including subtype aliases)
    for _, tAliases in pairs(NPCFlavor_Templates.TypeAliases or {}) do
        for _, sAlias in ipairs(tAliases) do
            table.insert(tCachedKnownTypes, sAlias);
        end
    end
end

-- Parses NPC type string and returns canonical type
-- @param sTypeString: raw type string from NPC record (e.g., "Medium undead, zombie")
-- @return: canonical type string (e.g., "undead.corporeal") or "generic" if not found
function parseNPCType(sTypeString)
    if not sTypeString or sTypeString == "" then return "generic"; end

    -- Convert to lowercase for easier matching
    local sLowerType = string.lower(sTypeString);

    -- Use cached known types list
    local tKnownTypes = tCachedKnownTypes or {};

    -- Find all occurrences of known types in the string
    -- e.g., "Medium undead, zombie" might match both "undead" and "zombie"
    local tMatches = {};
    
    for _, sType in ipairs(tKnownTypes) do
        local nPos = string.find(sLowerType, sType);
        if nPos then
            table.insert(tMatches, {type = sType, pos = nPos});
        end
    end
    
    if #tMatches == 0 then
        return "generic";
    end

    -- Sort matches by position (earliest first)
    -- This prioritizes types that appear first in the string
    table.sort(tMatches, function(a, b) return a.pos < b.pos; end);
    
    -- Check matches in order, prioritizing those that map to subtypes
    for _, match in ipairs(tMatches) do
        local sFoundType = match.type;
        
        -- Check if this is an alias and map it to the standard/subtype
        for sStandardType, tAliases in pairs(NPCFlavor_Templates.TypeAliases or {}) do
            for _, sAlias in ipairs(tAliases) do
                if sAlias == sFoundType then
                    -- Found an alias match - return the mapped type (could be subtype)
                    return sStandardType;
                end
            end
        end
    end
    
    -- No alias found, return the first matched type
    return tMatches[1].type;
end
