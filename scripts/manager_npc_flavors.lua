local npcFirstOfItsKind = {};

function onInit()
    CombatManager.setCustomAddNPC(addNPC);

    OptionsManager.registerOption2("NPCF_ENABLED", true, "npcf_option_group", "npcf_option_enabled", "option_entry_cycler",
        { labels = "option_val_on|option_val_off", values = "on|off", baselabel = "option_val_on", baseval = "on", default = "on" });

    OptionsManager.registerOption2("NPCF_FCHANCE", true, "npcf_option_group", "npcf_option_fchance", "option_entry_cycler",
        { labels = "npcf_option_fchance_10|npcf_option_fchance_20|npcf_option_fchance_30|npcf_option_fchance_40|npcf_option_fchance_50|npcf_option_fchance_60|npcf_option_fchance_70|npcf_option_fchance_80|npcf_option_fchance_90|npcf_option_fchance_100",
            values = "10|20|30|40|50|60|70|80|90|100", baselabel = "npcf_option_fchance_40", baseval = "40", default = "40" });

    -- OptionsManager.registerOption2("NPCF_DEBUG", true, "npcf_option_group", "npcf_option_debug", "option_entry_cycler",
    --    { labels = "option_val_on|option_val_off", values = "on|off", baselabel = "option_val_on", baseval = "on", default = "on" });
end

function getFlavorCount( construct )
    local result = 0;
    for count, percent in pairs( construct ) do
        toChat( '    - pairs ' .. count .. ", " .. percent );
        if math.random( 1, 100 ) > percent then
            break
        end
        result = count;
    end

    return result;
end

function getSupportedNPCType( npcType, npcSubtype1, npcSubtype2 )
    local npcTypeWithFlavor;

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
    local flavorType = math.random( #NPCFlavorData.FlavorsByType[npcTypeWithFlavor] );
    local table = NPCFlavorData.FlavorsByType[npcTypeWithFlavor][flavorType];

    toChat( " Using " .. flavorType .. " flavor type for " .. npcTypeWithFlavor );

    for _, construct in pairs( table.construct ) do
        local constructKey, constructChances = firstTableEntry( construct );
        toChat( " --- constructKey: " .. constructKey );
        local c = getFlavorCount( constructChances );
        for i = 1, c , 1 do
            npcFlavor = npcFlavor .. table[constructKey][ math.random( #table[constructKey] ) ] .. " ";
        end
        toChat( " --- flavor: " .. npcFlavor );
    end;

    return StringManager.trim( StringManager.capitalize(npcFlavor) );
end

function toChat( s )
    if OptionsManager.getOption("NPCF_DEBUG") == "on" then
        Comm.addChatMessage( {text = s } );
    end
end

function addNPC(sClass, nodeNPC, sName)
    toChat( "---------------------" );
    -- 5E combat manager
    local nodeEntry = CombatManager2.addNPC(sClass, nodeNPC, sName);

    if OptionsManager.getOption("NPCF_ENABLED") ~= "on" then
        toChat("NPC Flavors is disabled: " .. OptionsManager.getOption("NPCF_ENABLED"))
        return nodeEntry
    end

    local nodeNpcType = StringManager.trim(DB.getValue(nodeNPC, "type", ""));
    local npcType, npcSubtype1, npcSubtype2 = npcGetType(StringManager.trim(DB.getValue(nodeNPC, "type", "")));
    local originalNpcName = StringManager.trim(DB.getValue(nodeNPC, "name", ""));
    local finalNpcName = "";
    local setNpcFlavor = false;
    local npcFlavorChance = tonumber( OptionsManager.getOption("NPCF_FCHANCE") );
    local npcFlavorPercent = math.random(1,100);
    local npcFlavorChanceSuccess = npcFlavorChance >= npcFlavorPercent;

    if not canConstructFlavor( npcType ) then
        toChat("Unsupported NPC type: " .. npcType )
        return nodeEntry
    end

    toChat( "Adding NPC: " .. originalNpcName );
    toChat( "Flavor chance: " .. npcFlavorChance .. " >= " .. npcFlavorPercent );
    if not npcHasFlavor(originalNpcName) then

        if combatTrackerHasOthersOfSameName(nodeEntry) then
            toChat( "NPC has company" )
            toChat( "Type: " .. npcType );
            if npcFlavorChanceSuccess then
                if npcSubtype1 then toChat( "Subtype 1: " .. npcSubtype1 ); end
                if npcSubtype2 then toChat( "Subtype 2: " .. npcSubtype2 ); end

                local npcFlavor = constructFlavor( npcType, npcSubtype1, npcSubtype2 );
                finalNpcName =  originalNpcName .. " (" .. npcFlavor .. ")";
                setNpcFlavor = true;
            else
                toChat( "NPC didn't make the cut. No flavor will be applied")
            end

            -- If a first of this NPC type exist, go back rename that too
            --  if the chance is a success
            if npcFirstOfItsKind[nodeNpcType] then
                toChat( "   /------------" );
                toChat( "    Checking first of its kind (" .. nodeNpcType .. ")" );
                if tonumber( OptionsManager.getOption("NPCF_FCHANCE") ) >= math.random(1,100) then
                    local npcFirstOfItsKindFlavor = originalNpcName .. " (" .. constructFlavor( npcType, npcSubtype1, npcSubtype2 ) .. ")";
                    DB.setValue( npcFirstOfItsKind[nodeNpcType], "name", "string", npcFirstOfItsKindFlavor )
                    toChat( "    Renamed (First of its kind) " .. npcFirstOfItsKindFlavor .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
                else
                    toChat( "    First of its kind didn't make the cut")
                end
                toChat( "   /------------" );
                -- Unset, not need to check again
                npcFirstOfItsKind[nodeNpcType] = nil;
            end

        else
            toChat( "NPC is all alone in the dark" )
        end

    else
        toChat( "NPC already has a flavor. Skipping" );
    end

    if setNpcFlavor then
        DB.setValue( nodeEntry, "name", "string", finalNpcName )
        toChat( "Renamed " .. finalNpcName .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
    end

    return nodeEntry;
end

function combatTrackerHasOthersOfSameName( nodeNPC )
    local sName = StringManager.trim(DB.getValue(nodeNPC, "name", ""));
    local nodeNpcType = StringManager.trim(DB.getValue(nodeNPC, "type", ""));
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
        npcFirstOfItsKind[nodeNpcType] = nodeNPC;
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
    if s:find("%(") then
        local type, subtype = s:match( "(.+) %((.+)%)");
        if subtype:find(", ") then
            return type, subtype:match( "(.+), (.+)");
        end
        return type, subtype;
    end

    return s;
end

function npcHasFlavor(s)
    toChat( "Checking for flavor" );
    local nStarts, _, sNumber = string.find(s, " ?(%([a-z -A-Z]+%)) ?%d?$");
    if nStarts then
        toChat( "NPC has flavor: " .. sNumber );
        return true
    end
    toChat( "NPC does not have flavor" );
    return false;
end
