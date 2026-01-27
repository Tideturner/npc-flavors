-- Combines templates from all type files

function onInit()
    -- Metadata
    StandardTypes = {
        "aberration", "beast", "celestial", "construct", "dragon", "elemental",
        "fey", "fiend", "giant", "humanoid", "monstrosity", "ooze", "plant",
        "undead"
    }
    TypeAliases = {
        ["beast"] = {"animal", "aquatic", "insect", "dinosaur", "vermin"},
        ["aberration"] = {"outsider", "outsiders"},
        ["fiend"] = {"daemon", "demon", "devil"},
        ["celestial"] = {"angel", "archon"},
        ["construct"] = {"animated", "golem"},
        ["plant"] = {"fungus"},
        ["ooze"] = {"blob", "jelly", "pudding", "cube"},
        ["monstrosity"] = {"monstrous", "hybrid"},
        
        -- Undead subtypes for more specific flavor targeting
        ["undead.incorporeal"] = {"ghost", "spectre", "wraith", "banshee"},
        ["undead.corporeal"] = {"zombie", "skeleton", "mummy"},
        ["undead.intelligent"] = {"vampire", "lich", "revenant", "dullahan"},
        ["undead"] = {"ghoul", "ghast", "wight", "mohrg"}
    }

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
