local npcFirstOfItsKind = {};
local currentRuleset;
local debugFlavors = false;

function onInit()
    currentRuleset = User.getRulesetName();

	if Session.IsHost then
        OptionsManager.registerOption2("NPCF_ENABLED", true, "npcf_option_group", "npcf_option_enabled", "option_entry_cycler",
            { labels = "option_val_off", values = "off", baselabel = "option_val_on", baseval = "on", default = "on" });

        if isSupportedRuleset( ruleset ) then
            OptionsManager.registerOption2("NPCF_BY_TYPES", true, "npcf_option_group", "npcf_option_by_types", "option_entry_cycler",
                { labels = "option_val_off", values = "off", baselabel = "option_val_on", baseval = "on", default = "on" });
        end

        OptionsManager.registerOption2("NPCF_FCHANCE", true, "npcf_option_group", "npcf_option_fchance", "option_entry_cycler",
            { labels = "npcf_option_fchance_20|npcf_option_fchance_30|npcf_option_fchance_40|npcf_option_fchance_50|npcf_option_fchance_60|npcf_option_fchance_70|npcf_option_fchance_80|npcf_option_fchance_90|npcf_option_fchance_100",
                values = "20%|30%|40%|50%|60%|70%|80%|90%|100%", baselabel = "npcf_option_fchance_10", baseval = "10%", default = "40%" });

        OptionsManager.registerOption2("NPCF_NONID", true, "npcf_option_group", "npcf_option_nonid_name", "option_entry_cycler",
            { labels = "npcf_option_unknown|npcf_option_unknown_type|npcf_option_type|npcf_option_arrrgh_monster",
                values = "unknown|uident_type|type|monster", baselabel = "npcf_option_fg", baseval = "unchanged", default = "unchanged" });

        if debugFlavors then
            OptionsManager.registerOption2("NPCF_DEBUG", true, "npcf_option_group", "npcf_option_debug", "option_entry_cycler",
                { labels = "option_val_off", values = "off", baselabel = "option_val_on", baseval = "on", default = "on" });
        end
    end
end

function isSupportedRuleset()
    return getCurrentRuleset() ~= "UNKNOWN"
end

function getCurrentRuleset()
    if currentRuleset == "PFRPG" or currentRuleset == "5E" or currentRuleset == "2E" then
        return currentRuleset
    end

    return "UNKNOWN"
end

function getNPCFlavorChance()
    local rawOption =OptionsManager.getOption("NPCF_FCHANCE")
    local numberOption = tonumber( string.match(rawOption,'%d+') )
    chatDebugOutput("Flavor chance raw: " .. rawOption )
    chatDebugOutput("Flavor chance number: " .. numberOption )
    return numberOption
end

function hasExt( sName )
    for _, sExt in pairs(Extension.getExtensions()) do
        local t = Extension.getExtensionInfo(sExt)
        if t.name == sName then
            --chatDebugOutput( 'EXT ' .. sName .. " [OK]" );
            return true
        end
    end

    --chatDebugOutput( 'EXT ' .. sName .. " [OK]" );
    return false
end

function has5eCombatEnhancer()
    return hasExt("5e Combat Enhancer")
end

function isEnabled()
    chatDebugOutput( 'isEnabled: '..OptionsManager.getOption("NPCF_ENABLED") );
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

function getTypeByOption( npcType, npcSubtype1, npcSubtype2, originalNpcName )
    if OptionsManager.getOption("NPCF_BY_TYPES") == "on" then
        return  npcType, npcSubtype1, npcSubtype2, originalNpcName;
    end

    return "humanoid", nil, nil, originalNpcName;
end

function isTypePathInRulesetTable( npcTypeWithFlavor )
    chatDebugOutput(getCurrentRuleset(),npcTypeWithFlavor)

    local ruleset = getCurrentRuleset();

    local result = NPCFlavorDataNpcTypes.FlavorsByType[ruleset][npcTypeWithFlavor]

    return result and #result > 0
end

function getSupportedNPCType( npcType, npcSubtype1, npcSubtype2, originalNpcName )
    local npcTypeWithFlavor;
    originalNpcName = originalNpcName:lower();
    npcType, npcSubtype1, npcSubtype2, originalNpcName = getTypeByOption( npcType, npcSubtype1, npcSubtype2, originalNpcName );

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1, npcSubtype2, originalNpcName );
    chatDebugOutput( 'Testing type 1: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1, npcSubtype2 );
    chatDebugOutput( 'Testing type 2: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1, originalNpcName );
    chatDebugOutput( 'Testing type 3: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType, npcSubtype1 );
    chatDebugOutput( 'Testing type 4: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType, originalNpcName );
    chatDebugOutput( 'Testing type 5: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = StringManager.combine( ".", npcType );
    chatDebugOutput( 'Testing type 6: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    npcTypeWithFlavor = originalNpcName;
    chatDebugOutput( 'Testing type 7: '..npcTypeWithFlavor);
    if isTypePathInRulesetTable( npcTypeWithFlavor ) then return npcTypeWithFlavor, npcTypeWithFlavor end;

    return nil;
end;

function canConstructFlavor( npcType, npcSubtype1, npcSubtype2, originalNpcName )
    local npcTypeWithFlavor = getSupportedNPCType( npcType, npcSubtype1, npcSubtype2, originalNpcName );
    return npcTypeWithFlavor ~= nil;
end

function firstTableEntry( table )
    for k, v in pairs( table ) do
        return k, v;
    end
end

function constructFlavor( npcType, npcSubtype1, npcSubtype2, originalNpcName )
    local npcTypeWithFlavor, npcTypeWithFlavorName = getSupportedNPCType( npcType, npcSubtype1, npcSubtype2, originalNpcName );
    if not npcTypeWithFlavor then return "" end;

    local npcFlavor = "";
    local npcFlavorDebug = "";
    -- Debug.console( getCurrentRuleset(),npcTypeWithFlavor,NPCFlavorDataNpcTypes.FlavorsByType[getCurrentRuleset()][npcTypeWithFlavor])
    local flavorType = math.random( #NPCFlavorDataNpcTypes.FlavorsByType[getCurrentRuleset()][npcTypeWithFlavor] );
    local table = NPCFlavorDataNpcTypes.FlavorsByType[getCurrentRuleset()][npcTypeWithFlavor][flavorType];

    chatDebugOutput( " Using flavor type " .. flavorType .. " (".. npcTypeWithFlavorName ..") " .. " for " .. npcTypeWithFlavor );

    for _, construct in pairs( table.construct ) do
        local constructKey, constructChances = firstTableEntry( construct );
        chatDebugOutput( " --- constructKey: " .. constructKey );
        local c = getFlavorCount( constructChances );
        for i = 1, c , 1 do
            local randFlavor = math.random( #table[constructKey] )
            npcFlavor = npcFlavor .. table[constructKey][ randFlavor ] .. " ";
            npcFlavorDebug = npcFlavorDebug .. "[" .. table[constructKey][ randFlavor ] .. "] ("..randFlavor..") ";
        end
        chatDebugOutput( " --- flavor: " .. npcFlavorDebug );
    end;

    return StringManager.trim( StringManager.capitalize(npcFlavor) );
end

function chatDebugOutput( s )
    if OptionsManager.getOption("NPCF_DEBUG") == "on" then
        --Debug.console(s)
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
    local originalNpcNameNonId = stripNpcFlavorAndNumber( StringManager.trim(DB.getValue(nodeEntry, "nonid_name", "")) );

    local originalNpcNameNonId, originalNpcNumberNonId = npcGetNonIdName( nodeEntry );
    local renamedNonIdName = originalNpcNameNonId;
    if originalNpcNumberNonId then
        renamedNonIdName = renamedNonIdName .. " " .. originalNpcNumberNonId
    end
    chatDebugOutput( "Flavored original non id: " .. renamedNonIdName );
    DB.setValue( nodeEntry, "nonid_name", "string", renamedNonIdName )

    local finalNpcName = "";
    local finalNpcNameNonId = "";
    local setNpcFlavor = false;
    local npcFlavorChance = getNPCFlavorChance();
    local npcFlavorPercent = math.random(1,100);
    local npcFlavorChanceSuccess = npcFlavorChance >= npcFlavorPercent;

    chatDebugOutput( "Adding NPC: " .. originalNpcName );

    if not canConstructFlavor( npcType, npcSubtype1, npcSubtype2, originalNpcName ) then
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

                local npcFlavor = constructFlavor( npcType, npcSubtype1, npcSubtype2, originalNpcName );
                finalNpcName =  originalNpcName .. " (" .. npcFlavor .. ")";
                finalNpcNameNonId =  originalNpcNameNonId .. " (" .. npcFlavor .. ")";
                setNpcFlavor = true;
            else
                chatDebugOutput( "NPC didn't make the cut. No flavor will be applied")
            end

            -- If a first of this NPC type exist, go back rename that too
            --  if the chance is a success
            if npcFirstOfItsKind[originalNpcName] then
                chatDebugOutput( "   /------------" );
                chatDebugOutput( "    Checking first of its kind (" .. originalNpcName .. ")" );
                if getNPCFlavorChance() >= math.random(1,100) then
                    local npcFlavorfirstOfItsKind = constructFlavor( npcType, npcSubtype1, npcSubtype2, originalNpcName );
                    -- Regular name
                    local npcFirstOfItsKindFlavor = originalNpcName .. " (" .. npcFlavorfirstOfItsKind .. ")";
                    DB.setValue( npcFirstOfItsKind[originalNpcName], "name", "string", npcFirstOfItsKindFlavor )
                    chatDebugOutput( "    Renamed (First of its kind) " .. npcFirstOfItsKindFlavor .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
                    -- Non id'd name
                    local npcFirstOfItsKindFlavorNonId = originalNpcNameNonId .. " (" .. npcFlavorfirstOfItsKind .. ")";
                    DB.setValue( npcFirstOfItsKind[originalNpcName], "nonid_name", "string", npcFirstOfItsKindFlavorNonId )
                    chatDebugOutput( "    [UNIDENTIFIED] Renamed (First of its kind) " .. npcFirstOfItsKindFlavor .. " (was " .. originalNpcNameNonId .. ") of type '" .. npcType .. "' to the combat tracker" );
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
        -- Regular name
        DB.setValue( nodeEntry, "name", "string", finalNpcName )
        chatDebugOutput( "Renamed " .. finalNpcName .. " (was " .. originalNpcName .. ") of type '" .. npcType .. "' to the combat tracker" );
        -- Non id'd name
        DB.setValue( nodeEntry, "nonid_name", "string", finalNpcNameNonId )
        chatDebugOutput( "[UNIDENTIFIED] Renamed " .. finalNpcNameNonId .. " (was " .. originalNpcNameNonId .. ") of type '" .. npcType .. "' to the combat tracker" );
    end

    return nodeEntry;
end

function combatTrackerHasOthersOfSameName( sName, nodeEntry )
    sName = stripNpcFlavorAndNumber(sName);
    local foundCount = 0;

    for _,v in pairs(CombatManagerOverride.getCombatantNodes()) do
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

function npcGetNonIdName( nodeEntry )
    local nonIdName, n = stripNpcFlavorAndNumber(DB.getValue(nodeEntry, "nonid_name", ""));

    -- A custom Non ID name has been set, use that
    if nonIdName ~= Interface.getString("library_recordtype_empty_nonid_npc") then
        chatDebugOutput( "npcGetNonIdName: Using custom resource: " .. nonIdName )
        return nonIdName, n
    end

    -- unknown|uident_type|type|monster
    if OptionsManager.getOption("NPCF_NONID") == 'unknown'  then
        return 'Unknown', n;
    end

    if OptionsManager.getOption("NPCF_NONID") == 'uident_type'  then
        local npcType, npcSubtype1, npcSubtype2 = npcGetType(StringManager.trim(DB.getValue(nodeEntry, "type", "")));
        return 'Unknown ' .. StringManager.capitalize(npcType), n;
    end

    if OptionsManager.getOption("NPCF_NONID") == 'type'  then
        local npcType, npcSubtype1, npcSubtype2 = npcGetType(StringManager.trim(DB.getValue(nodeEntry, "type", "")));
        return StringManager.capitalize(npcType), n;
    end

    if OptionsManager.getOption("NPCF_NONID") == 'monster'  then
        return 'Arrrrgh Monster', n;
    end

    return stripNpcFlavorAndNumber(DB.getValue(nodeEntry, "nonid_name", ""))
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
    s = s:lower()

    if getCurrentRuleset() == "PFRPG" then
        if s:find("%(") then
            local size, _, type, subtype = s:match( "(.+) (.+) (.+) %((.+)%)");
            if (not size) then
                size, type, subtype = s:match( "(.+) (.+) %((.+)%)");
            end

            if not subtype then
                chatDebugOutput(' --- WEIRD ---- ' .. s);
            end

            if subtype and subtype:find(", ") then
                return type, subtype:match( "(%a+),%s(%a+)");
            end

            return type or "", subtype or "";
        else
            local _, _, type = s:match( "(.+) (.+) (.+)");
            return type or "";
        end
    end

    if getCurrentRuleset() == "5E" then
        if s:find("%(") then
            local type, subtype = s:match( "(.+) %((.+)%)");
            if subtype:find(", ") then
                return type, subtype:match( "(.+), (.+)");
            end
            return type, subtype;
        end
    end

    if getCurrentRuleset() == "2E" then
        s = LibraryData5E.sanitizevNodeText(s)
        local types, _ = StringManager.split(s, ",", true);
        if #types == 1 then 
            return types[1]
        elseif #types == 2 then
             return types[1], types[2]
        elseif #types == 3 then
            return types[1], types[2], types[3]
        end
    end

    chatDebugOutput(' --- RAW ---- ' .. s);
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
