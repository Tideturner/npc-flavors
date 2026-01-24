-- Combines word lists from all category files

function onInit()
    -- Aggregate all word categories - Access as ScriptName.Data
    Words = {
        physical = NPCFlavor_Words_Physical.Data,
        appearance = NPCFlavor_Words_Appearance.Data,
        items = NPCFlavor_Words_Item.Data,
        anatomy = NPCFlavor_Words_Anatomy.Data,
        behaviors = NPCFlavor_Words_Behavior.Data,
        social = NPCFlavor_Words_Social.Data,
        environment = NPCFlavor_Words_Environment.Data,
        emotions = NPCFlavor_Words_Emotion.Data
    }

end
