-- NPC Flavors v2 - Slash Commands
-- Handles /npcftypes and /npcfexport commands
-- ============================================================================
-- INITIALIZATION
-- ============================================================================
function onInit()
    -- Extension is host-only
    if not Session.IsHost then return; end

    -- Register slash command for extracting NPC types
    Comm.registerSlashHandler("npcftypes", extractNPCTypes);
end

-- ============================================================================
-- SLASH COMMANDS
-- ============================================================================

-- Extracts all unique NPC types from campaign data and outputs to chat
-- Usage: /npcftypes [raw]
-- Parameters:
--   raw - optional, shows raw type strings instead of parsed individual words
function extractNPCTypes(sCommand, sParams)
    local bShowRaw = sParams and string.lower(sParams):match("raw") ~= nil;

    -- Words to filter out (alignment qualifiers)
    local tFilterWords = {
        ["any"] = true,
        ["evil"] = true,
        ["neutral"] = true,
        ["good"] = true,
        ["lawful"] = true,
        ["chaotic"] = true
    };

    -- Regex pattern to parse individual words from type field
    -- Splits on spaces, commas, slashes, and parentheses
    local sTypeParseRegEx = "[^%s,/%(%)]+";

    -- Collect all unique types
    local tUniqueTypes = {};
    local nTotalNPCs = 0;

    -- Search through campaign NPCs
    for _, nodeNPC in pairs(DB.getChildrenGlobal("npc")) do
        local sType = DB.getValue(nodeNPC, "type", "");

        if sType and sType ~= "" then
            nTotalNPCs = nTotalNPCs + 1;

            if bShowRaw then
                -- Store raw type string
                tUniqueTypes[sType] = true;
            else
                -- Parse individual words from type field (including parentheses)
                for sWord in sType:gmatch(sTypeParseRegEx) do
                    local sLowerWord = sWord:lower();
                    -- Skip filtered words
                    if not tFilterWords[sLowerWord] then
                        tUniqueTypes[sLowerWord] = true;
                    end
                end
            end
        end
    end

    -- Also search through reference NPCs from modules
    for _, nodeNPC in pairs(DB.getChildrenGlobal("reference.npcs")) do
        local sType = DB.getValue(nodeNPC, "type", "");

        if sType and sType ~= "" then
            if bShowRaw then
                tUniqueTypes[sType] = true;
            else
                for sWord in sType:gmatch(sTypeParseRegEx) do
                    local sLowerWord = sWord:lower();
                    if not tFilterWords[sLowerWord] then
                        tUniqueTypes[sLowerWord] = true;
                    end
                end
            end
        end
    end

    -- Sort types alphabetically
    local tSortedTypes = {};
    for sType, _ in pairs(tUniqueTypes) do table.insert(tSortedTypes, sType); end
    table.sort(tSortedTypes);

    -- Build output message
    local sMessage = "";
    if bShowRaw then
        sMessage = "[NPC Flavors] Raw NPC Type Strings (Total NPCs: " ..
                       nTotalNPCs .. "):\n\n";
    else
        sMessage =
            "[NPC Flavors] Parsed Individual Type Words (Total NPCs: " .. nTotalNPCs ..
                "):\n\n";
    end

    for _, sType in ipairs(tSortedTypes) do
        sMessage = sMessage .. "  " .. sType .. "\n";
    end

    if #tSortedTypes == 0 then
        sMessage = sMessage .. "  No NPCs found in loaded modules.\n";
    else
        sMessage = sMessage .. "\nTotal unique types: " .. #tSortedTypes;
    end

    -- Output to chat
    ChatManager.SystemMessage(sMessage);

    -- Also save to file in campaign folder
    local sFileName = bShowRaw and "npc_flavors_types_raw.txt" or "npc_flavors_types_parsed.txt";
    local sFilePath = File.getCampaignFolder() .. sFileName;
    File.saveTextFile(sFilePath, sMessage);
    
    ChatManager.SystemMessage("[NPC Flavors] Output saved to: " .. sFileName);

    return true;
end