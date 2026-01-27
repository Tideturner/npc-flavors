-- Connects to combat tracker to add flavors when NPCs are added

local originalAddNPC = nil;
local originalAddBattle = nil;

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Sets up combat tracker hooks to trigger flavor generation
function onInit()
    -- Extension is host-only
    if not Session.IsHost then return; end

    -- Hook into combat tracker NPC add callbacks
    originalAddNPC = CombatRecordManager.getRecordTypePostAddCallback("npc");
    CombatRecordManager.setRecordTypePostAddCallback("npc", onAddNPC);

    originalAddBattle = CombatRecordManager.getRecordTypePostAddCallback("battle");
    CombatRecordManager.setRecordTypePostAddCallback("battle", onAddBattle);
end

-- ============================================================================
-- COMBAT TRACKER CALLBACKS
-- ============================================================================

function onAddBattle(nodeBattle)
    -- Call original callback
    if originalAddBattle then originalAddBattle(nodeBattle); end

    -- Reset tracking for new battle
    NPCFlavor_Generator.resetTracking();
end

function onAddNPC(tCustom)
    -- Call original callback
    if originalAddNPC then originalAddNPC(tCustom); end

    if tCustom and tCustom.nodeCT then
        local nodeCT = tCustom.nodeCT;

        -- Set flag for reflavor button to check visibility
        if NPCFlavor_Generator.isValidNPC(nodeCT) then
            DB.setValue(nodeCT, "npcf_show_button", "number", 1);
        end
        
        NPCFlavor_Generator.processNPCAdd(nodeCT);
    end
end
