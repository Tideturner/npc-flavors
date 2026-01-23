local rulesetName = nil;
local originalAddBattle = nil;
local originalAddNPC = nil;
local addingFromBattle = false;

function onInit()
    rulesetName = User.getRulesetName()
	if Session.IsHost then
        originalAddNPC = CombatRecordManager.getRecordTypePostAddCallback("npc");
        CombatRecordManager.setRecordTypePostAddCallback("npc", NPCFlavorAddNPC)


        addingFromBattle = CombatRecordManager.getRecordTypePostAddCallback("battle");
        CombatRecordManager.setRecordTypePostAddCallback("battle", NPCFlavorAddBattle)
    end
end


function getCombatantNodes()
    if rulesetName == "SavageWorlds" then
        -- Debug.console("getCombatantNodes",CombatManager.CT_COMBATANT_PATH)
        return CombatManager2.getCombatantNodes();
    end
    if rulesetName == "SWPF" then
        -- Debug.console("getCombatantNodes",CombatManager.CT_COMBATANT_PATH)
        return CombatManager2.getCombatantNodes();
    end
    
    return DB.getChildren(CombatManager.CT_LIST)
end

function addFlavors( caller )
    -- Debug.console('Running from -- ' .. caller .. ' --')
    if ( not NPCFlavors.isEnabled() ) then 
        return; 
    end

    local aCurrentCombatants = getCombatantNodes();
    -- Debug.console("Combatants",aCurrentCombatants)
    for _,nodeEntry in pairs(aCurrentCombatants) do
        local sActorType = ActorManager.getRecordType(nodeEntry)
        -- Debug.console("getRecordType",ActorManager.getRecordType(nodeEntry))
        if sActorType == 'npc' and DB.getValue(nodeEntry, "has_npc_flavor", 0) == 0 then
            -- Debug.console("Flavoring")
            NPCFlavors.renameNPC( nodeEntry );
            local sFlavorName = DB.getValue(nodeEntry, "name", "")
            DB.setValue(nodeEntry, "has_npc_flavor", "number", 1)
        end
    end
end

function NPCFlavorAddBattle( nodeBattle )
    -- Debug.console("NPCFlavorAddBattle")
    addingFromBattle = true

    if originalAddBattle then
        originalAddBattle( nodeBattle )
    end

    NPCFlavors.prepareForBattle()
    addFlavors("addBattle")
    
    addingFromBattle = false
end

function NPCFlavorAddNPC( tCustom ) 
    if originalAddNPC then
        originalAddNPC( tCustom )
    end

    if (not addingFromBattle) then
        addFlavors('addNPC')
    else
        -- Debug.console("addNPC - skipping, adding from battle")
    end
end