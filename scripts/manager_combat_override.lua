local rulesetName = nil;
local originalAddBattle = nil;
local originalAddNPC = nil;
local addingFromBattle = false;

function onInit()
    rulesetName = User.getRulesetName()
	if Session.IsHost then
        --Debug.console("Flavor combat - is host")
        --Debug.console("Ruleset", rulesetName)
        if ( rulesetName == "2E" ) then
            originalAddNPC = CombatManagerADND.addCTANPC;
            CombatManagerADND.addCTANPC = NPCFlavorAddNPC;
        else
            originalAddNPC = CombatRecordManager.addNPC;
            CombatRecordManager.addNPC = NPCFlavorAddNPC;
        end
        
        originalAddBattle = CombatManager.addBattle;
        CombatManager.addBattle = NPCFlavorAddBattle;
    end
end


function getCombatantNodes()
    return DB.getChildren("combattracker.list")
end

function addFlavors( caller )
    --Debug.console('Running from -- ' .. caller .. ' --')
    if ( not NPCFlavors.isEnabled() ) then 
        return; 
    end

    local aCurrentCombatants = getCombatantNodes();
    --Debug.console("Combatants",aCurrentCombatants)
    for _,nodeEntry in pairs(aCurrentCombatants) do
        local sActorType = ActorManager.getRecordType(nodeEntry)
        --Debug.console("getRecordType",ActorManager.getRecordType(nodeEntry))
        if sActorType == 'npc' and DB.getValue(nodeEntry, "has_npc_flavor", 0) == 0 then
            --Debug.console("Flavoring")
            NPCFlavors.renameNPC( nodeEntry );
            local sFlavorName = DB.getValue(nodeEntry, "name", "")
            DB.setValue(nodeEntry, "has_npc_flavor", "number", 1)
        end
    end
end

function NPCFlavorAddBattle( nodeBattle )
    --Debug.console("NPCFlavorAddBattle")
    addingFromBattle = true

    originalAddBattle( nodeBattle )

    NPCFlavors.prepareForBattle()
    addFlavors("addBattle")
    
    addingFromBattle = false
end

function NPCFlavorAddNPC( tCustom )
    originalAddNPC( tCustom )

    if (not addingFromBattle) then
        addFlavors('addNPC')
    else
        --Debug.console("addNPC - skipping, adding from battle")
    end
end
