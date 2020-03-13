local originalAddBattle = nil;
local originalAddNPC = nil;

function onInit()
    originalAddBattle = CombatManager.addBattle;
    CombatManager.addBattle = NPCFlavorAddBattle;

    originalAddNPC = CombatManager.addNPC;
    CombatManager.addNPC = NPCFlavorAddNPC;
end

function addFlavors( caller )
    -- Debug.chat('addFlavors: ' .. caller)
	local aCurrentCombatants = CombatManager.getCombatantNodes();
    for _,nodeEntry in pairs(aCurrentCombatants) do
        local sActorType, _ = ActorManager.getTypeAndNodeName(nodeEntry)
        if sActorType == 'ct' and DB.getValue(nodeEntry, "has_npc_flavor", 0) == 0 then
            -- Debug.chat(sActorType)
            NPCFlavors.renameNPC( nodeEntry );
            local sFlavorName = DB.getValue(nodeEntry, "name", "")
            DB.setValue(nodeEntry, "has_npc_flavor", "number", 1)
        end
    end
end

function NPCFlavorAddBattle( nodeBattle )
    originalAddBattle( nodeBattle )

    -- Debug.chat('addFlavors: addBattle')
    NPCFlavors.prepareForBattle()
end

function NPCFlavorAddNPC( sClass, nodeNPC, sName )
    local result = originalAddNPC( sClass, nodeNPC, sName )

    addFlavors('addNPC')

    return result
end