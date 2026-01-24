-- Undead Corporeal Templates (zombies, skeletons, ghouls, etc.)

Data = {
    {
        pattern = "{physical.conditions.undead:capitalize} {name} ({appearance.textures.undead} {anatomy.undead})",
        weight = 20,
        description = "Condition + textured anatomy"
    }, {
        pattern = "{name} ({behaviors.movements.undead} and {appearance.textures.undead})",
        weight = 15,
        description = "Shambling/lurching with texture"
    }, {
        pattern = "{physical.conditions.undead:capitalize}, {appearance.textures.undead} {name}",
        weight = 15,
        description = "Double prefix (rotting, decayed)"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.undead})",
        weight = 15,
        description = "Colored physical features"
    }, {
        pattern = "{physical.conditions.undead:capitalize} {name}",
        weight = 10,
        description = "Simple condition prefix"
    }, {
        pattern = "{name} ({appearance.textures.undead} {items.clothing.general})",
        weight = 10,
        description = "Textured clothing/gear"
    }, {
        pattern = "{behaviors.movements.undead:capitalize} {name}",
        weight = 10,
        description = "Movement prefix"
    }, {
        pattern = "{name} ({behaviors.attitudes.undead})",
        weight = 10,
        description = "Undead attitude (relentless, mindless, etc.)"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size variation"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Corporeal undead sound (groaning, moaning)"
    }, {
        pattern = "{name} ({emotions.states.undead})",
        weight = 10,
        description = "Undead emotional state"
    }, {
        pattern = "{appearance.hair_qualities.undead:capitalize} {name}",
        weight = 10,
        description = "Undead hair/fur quality prefix"
    }
}
