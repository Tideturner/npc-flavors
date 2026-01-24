-- Combines templates from all type files

function onInit()
    -- Metadata
    StandardTypes = NPCFlavor_Templates_Metadata.Data.TemplateStandardTypes
    TypeAliases = NPCFlavor_Templates_Metadata.Data.TemplateTypeAliases

    -- Aggregate all templates - Access as ScriptName.Data
    Templates = {
        ["generic"] = NPCFlavor_Templates_Generic.Data,
        ["humanoid"] = NPCFlavor_Templates_Humanoid.Data,
        ["undead"] = NPCFlavor_Templates_Undead.Data,
        ["undead.incorporeal"] = NPCFlavor_Templates_Undead_Incorporeal.Data,
        ["undead.corporeal"] = NPCFlavor_Templates_Undead_Corporeal.Data,
        ["undead.intelligent"] = NPCFlavor_Templates_Undead_Intelligent.Data,
        ["beast"] = NPCFlavor_Templates_Beast.Data,
        ["aberration"] = NPCFlavor_Templates_Aberration.Data,
        ["monstrosity"] = NPCFlavor_Templates_Monstrosity.Data,
        ["dragon"] = NPCFlavor_Templates_Dragon.Data,
        ["construct"] = NPCFlavor_Templates_Construct.Data,
        ["elemental"] = NPCFlavor_Templates_Elemental.Data,
        ["celestial"] = NPCFlavor_Templates_Celestial.Data,
        ["fiend"] = NPCFlavor_Templates_Fiend.Data,
        ["fey"] = NPCFlavor_Templates_Fey.Data,
        ["giant"] = NPCFlavor_Templates_Giant.Data,
        ["plant"] = NPCFlavor_Templates_Plant.Data,
        ["ooze"] = NPCFlavor_Templates_Ooze.Data
    }

end
