local npcFirstOfItsKind = {};
local currentRuleset;
local debugFlavors = false;

function onInit()
    currentRuleset = User.getRulesetName();

    OptionsManager.registerOption2("NPCF_ENABLED", true, "npcf_option_group", "npcf_option_enabled", "option_entry_cycler",
        { labels = "option_val_on|option_val_off", values = "on|off", baselabel = "option_val_on", baseval = "on", default = "on" });

    if currentRuleset == "PFRPG" or currentRuleset == "5E" then
        OptionsManager.registerOption2("NPCF_BY_TYPES", true, "npcf_option_group", "npcf_option_by_types", "option_entry_cycler",
            { labels = "option_val_on|option_val_off", values = "on|off", baselabel = "option_val_on", baseval = "on", default = "on" });
    end

    OptionsManager.registerOption2("NPCF_FCHANCE", true, "npcf_option_group", "npcf_option_fchance", "option_entry_cycler",
        { labels = "npcf_option_fchance_10|npcf_option_fchance_20|npcf_option_fchance_30|npcf_option_fchance_40|npcf_option_fchance_50|npcf_option_fchance_60|npcf_option_fchance_70|npcf_option_fchance_80|npcf_option_fchance_90|npcf_option_fchance_100",
            values = "10|20|30|40|50|60|70|80|90|100", baselabel = "npcf_option_fchance_10", baseval = "10", default = "40" });

    if debugFlavors then
        OptionsManager.registerOption2("NPCF_DEBUG", true, "npcf_option_group", "npcf_option_debug", "option_entry_cycler",
            { labels = "option_val_on|option_val_off", values = "on|off", baselabel = "option_val_on", baseval = "on", default = "on" });
    end

end

function isEnabled()
    return OptionsManager.getOption("NPCF_ENABLED") == "on";
end

function getFlavorCount( construct )
    local result = 0;
    for count, percent in pairs( construct ) do
        local randPercent = math.random( 1, 100 );
        chatDebugOutput( '    - pairs ' .. count .. ", " .. percent .. " = " .. randPercent );
        if randPercent > percent then
            break
        end
        result = count;
    end

    return result;
end

function getTypeByOption( npcType, npcSubtype1, npcSubtype2 )
    if OptionsManager.getOption("NPCF_BY_TYPES") == "on" then
        return  npcType, npcSubtype1, npcSubtype2;
    end

    return "humanoid", nil, nil;
end

function getSupportedNPCType( npcType, npcSubtype1, npcSubtype2 )
    local npcTypeWithFlavor;
    npcType, npcSubtype1, npcSubtype2 = getTypeByOption( npcType, npcSubtype1, npcSubtype2 );

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1, npcSubtype2 );
    if NPCFlavorData.FlavorsByType[npcTypeWithFlavor] then return npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1 );
    if NPCFlavorData.FlavorsByType[npcTypeWithFlavor] then return npcTypeWithFlavor end;

    npcTypeWithFlavor = npcType;
    if NPCFlavorData.FlavorsByType[npcTypeWithFlavor] then return npcTypeWithFlavor end;

    return nul;
end;

function canConstructFlavor( npcType, npcSubtype1, npcSubtype2 )
    local npcTypeWithFlavor = getSupportedNPCType( npcType, npcSubtype1, npcSubtype2 );
    return npcTypeWithFlavor ~= nil;
end

function firstTableEntry( table )
    for k, v in pairs( table ) do
        return k, v;
    end
end

function constructFlavor( npcType, npcSubtype1, npcSubtype2 )
    local npcTypeWithFlavor = getSupportedNPCType( npcType, npcSubtype1, npcSubtype2 );
    if not npcTypeWithFlavor then return "" end;

    local npcFlavor = "";
    local npcFlavorDebug = "";
    local flavorType = math.random( #NPCFlavorData.FlavorsByType[npcTypeWithFlavor] );
    local table = NPCFlavorData.FlavorsByType[npcTypeWithFlavor][flavorType];

    chatDebugOutput( " Using flavor type " .. flavorType .. " for " .. npcTypeWithFlavor );

    for _, construct in pairs( table.construct ) do
        local constructKey, constructChances = firstTableEntry( construct );
        chatDebugOutput( " --- constructKey: " .. constructKey );
        local c = getFlavorCount( constructChances );
        for i = 1, c , 1 do
            local randFlavor = math.random( #table[constructKey] )
            npcFlavor = npcFlavor .. table[constructKey][ randFlavor ] .. " ";
            npcFlavorDebug = npcFlavorDebug .. table[constructKey][ randFlavor ] .. "("..randFlavor..") ";
        end
        chatDebugOutput( " --- flavor: " .. npcFlavorDebug );
    end;

    return StringManager.trim( StringManager.capitalize(npcFlavor) );
end

function chatDebugOutput( s )
    if OptionsManager.getOption("NPCF_DEBUG") == "on" then
        Comm.addChatMessage( {text = s } );
    end
end

function prepareForBattle()
    npcFirstOfItsKind = {}
end

function renameNPC( nodeEntry )
    chatDebugOutput( "---------------------" );
    -- 5E combat manager

    if OptionsManager.getOption("NPCF_ENABLED") ~= "on" then
        chatDebugOutput("NPC Flavors is disabled: " .. OptionsManager.getOption("NPCF_ENABLED"))
        return nodeEntry
    end

    local npcType, npcSubtype1, npcSubtype2 = npcGetType(StringManager.trim(DB.getValue(nodeEntry, "type", "")));
    local originalNpcName = stripNpcFlavorAndNumber( StringManager.trim(DB.getValue(nodeEntry, "name", "")) );
    local finalNpcName = "";
    local setNpcFlavor = false;
    local npcFlavorChance = tonumber( OptionsManager.getOption("NPCF_FCHANCE") );
    local npcFlavorPercent = math.random(1,100);
    local npcFlavorChanceSuccess = npcFlavorChance >= npcFlavorPercent;

    chatDebugOutput( "Adding NPC: " .. originalNpcName );

    if not canConstructFlavor( npcType ) then
        chatDebugOutput("Unsupported NPC type: " .. npcType );
        chatDebugOutput(" - full NPC type: " .. StringManager.combine( ".", npcType, npcSubtype1, npcSubtype2 ) );
        return nodeEntry
    end

    chatDebugOutput(" - full NPC type: " .. StringManager.combine( ".", npcType, npcSubtype1, npcSubtype2 ) );
    chatDebugOutput( "Flavor chance: " .. npcFlavorChance .. " >= " .. npcFlavorPercent );
    if not npcHasFlavor(originalNpcName) then

        if combatTrackerHasOthersOfSameName(originalNpcName, nodeEntry) then
            chatDebugOutput( "NPC has company" )
            chatDebugOutput( "Type: " .. npcType );
            if npcFlavorChanceSuccess then
                if npcSubtype1 then chatDebugOutput( "Subtype 1: " .. npcSubtype1 ); end
                if npcSubtype2 then chatDebugOutput( "Subtype 2: " .. npcSubtype2 ); end

                local npcFlavor = constructFlavor( npcType, npcSubtype1, npcSubtype2 );
                finalNpcName =  originalNpcName .. " (" .. npcFlavor .. ")";
                setNpcFlavor = true;
            else
                chatDebugOutput( "NPC didn't make the cut. No flavor will be applied")
            end

            -- If a first of this NPC type exist, go back rename that too
            --  if the chance is a success
            if npcFirstOfItsKind[originalNpcName] then
                chatDebugOutput( "   /------------" );
                chatDebugOutput( "    Checking first of its kind (" .. originalNpcName .. ")" );
                if tonumber( OptionsManager.getOption("NPCF_FCHANCE") ) >= math.random(1,100) then
                    local npcFirstOfItsKindFlavor = originalNpcName .. " (" .. constructFlavor( npcType, npcSubtype1, npcSubtype2 ) .. ")";
                    DB.setValue( npcFirstOfItsKind[originalNpcName], "name", "string", npcFirstOfItsKindFlavor )
                    chatDebugOutput( "    Renamed (First of its kind) " .. npcFirstOfItsKindFlavor .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
                else
                    chatDebugOutput( "    First of its kind didn't make the cut")
                end
                chatDebugOutput( "   /------------" );
                -- Unset, no need to check again
                npcFirstOfItsKind[originalNpcName] = nil;
            end

        else
            chatDebugOutput( "NPC is all alone in the dark" )
        end

    else
        chatDebugOutput( "NPC already has a flavor. Skipping" );
    end

    if setNpcFlavor then
        DB.setValue( nodeEntry, "name", "string", finalNpcName )
        chatDebugOutput( "Renamed " .. finalNpcName .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
    end

    return nodeEntry;
end

function combatTrackerHasOthersOfSameName( sName, nodeEntry )
    sName = stripNpcFlavorAndNumber(sName);
    local foundCount = 0;

    for _,v in pairs(DB.getChildren(CombatManager.CT_LIST)) do
        local sEntryName = DB.getValue(v, "name", "");
        local sOtherName, sNumber = stripNpcFlavorAndNumber(sEntryName);
        if sOtherName == sName then
            foundCount = foundCount + 1;
        end
    end

    if foundCount == 1 then
        chatDebugOutput(' --- Adding '.. sName ..' as first of its kind.')
        npcFirstOfItsKind[sName] = nodeEntry;
    end

    return foundCount > 1;
end

function stripNpcFlavorAndNumber( s )
    -- Search for flavor + (optional number)
    local nStarts, _, sNumber = string.find(s, "(%([a-z A-Z]+%)) ?%d?$");
    if nStarts then
        return StringManager.trim(string.sub(s, 1, nStarts - 1)), sNumber;
    end

    -- Search for just number
    local nStarts, _, sNumber = string.find(s, " ?(%d+)$");
    if nStarts then
        return StringManager.trim(string.sub(s, 1, nStarts - 1)), sNumber;
    end

    return s;
end

function npcGetType(s)
    if currentRuleset == "PFRPG" then
        if s:find("%(") then
            local _, _, type, subtype = s:match( "(.+) (.+) (.+) %((.+)%)");

            if subtype:find(", ") then
                return type, subtype:match( "(%a+),%s(%a+)");
            end

            return type, subtype;
        else
            local _, _, type = s:match( "(.+) (.+) (.+)");
            return type;
        end
    end

    if currentRuleset == "5E" then
        if s:find("%(") then
            local type, subtype = s:match( "(.+) %((.+)%)");
            if subtype:find(", ") then
                return type, subtype:match( "(.+), (.+)");
            end
            return type, subtype;
        end
    end

    return s;
end

function npcHasFlavor(s)
    chatDebugOutput( "Checking for flavor" );
    local nStarts, _, sNumber = string.find(s, " ?(%([a-z -A-Z]+%)) ?%d?$");
    if nStarts then
        chatDebugOutput( "NPC has flavor: " .. sNumber );
        return true
    end
    chatDebugOutput( "NPC does not have flavor" );
    return false;
end
