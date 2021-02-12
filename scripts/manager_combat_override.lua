local rulesetName = nil;
local originalAddBattle = nil;
local originalAddNPC = nil;
local addingFromBattle = false;

function onInit()
    rulesetName = User.getRulesetName()
	if Session.IsHost then
        if ( rulesetName == "2E" ) then
            originalAddNPC = CombatManagerADND.addCTANPC;
            CombatManagerADND.addCTANPC = NPCFlavorAddNPC;
        else
            originalAddNPC = CombatManager.addNPC;
            CombatManager.addNPC = NPCFlavorAddNPC;
        end
        
        originalAddBattle = CombatManager.addBattle;
        CombatManager.addBattle = NPCFlavorAddBattle;
    end
end


function getCombatantNodes()
    if (rulesetName == "2E") then
        return DB.getChildren("combattracker.list")
    end
    return CombatManager.getCombatantNodes()
end

function addFlavors( caller )
    Debug.console('Running from -- ' .. caller .. ' --')
    if ( not NPCFlavors.isEnabled() ) then 
        return; 
    end

    local aCurrentCombatants = getCombatantNodes();
    for _,nodeEntry in pairs(aCurrentCombatants) do
        local sActorType, _ = ActorManager.getTypeAndNodeName(nodeEntry)
        if sActorType == 'npc' and DB.getValue(nodeEntry, "has_npc_flavor", 0) == 0 then
            NPCFlavors.renameNPC( nodeEntry );
            local sFlavorName = DB.getValue(nodeEntry, "name", "")
            DB.setValue(nodeEntry, "has_npc_flavor", "number", 1)
        end
    end
end

function NPCFlavorAddBattle( nodeBattle )
    Debug.console("NPCFlavorAddBattle")
    addingFromBattle = true

    originalAddBattle( nodeBattle )

    NPCFlavors.prepareForBattle()
    addFlavors("addBattle")
    
    addingFromBattle = false
end

function NPCFlavorAddNPC( sClass, nodeNPC, sName )
    Debug.console("NPCFlavorAddNPC",addingFromBattle)
    local result = originalAddNPC( sClass, nodeNPC, sName )

    if (not addingFromBattle) then
        addFlavors('addNPC')
    else
        Debug.console("addNPC - skipping, adding from battle")
    end

    return result
end