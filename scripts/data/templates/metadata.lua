-- Template Metadata
-- Standard creature types and type aliases

-- Standard creature types
TemplateStandardTypes = {
    "aberration", "beast", "celestial", "construct", "dragon", "elemental",
    "fey", "fiend", "giant", "humanoid", "monstrosity", "ooze", "plant",
    "undead"
}

-- Type aliases - maps standard types to ruleset-specific aliases
-- Format: ["standard_type"] = {"alias1", "alias2", ...}
-- Supports subtypes: ["parent.subtype"] = {"alias1", "alias2", ...}
-- This allows different rulesets to use different type names but map to the same flavor data
TemplateTypeAliases = {
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

-- Export for FGU namespace access
Data = {
    TemplateStandardTypes = TemplateStandardTypes,
    TemplateTypeAliases = TemplateTypeAliases
}
