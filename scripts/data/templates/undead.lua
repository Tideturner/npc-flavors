-- Undead Templates (general)

Data = {
    {
        pattern = "{physical.conditions.undead:capitalize} {name}",
        weight = 10,
        description = "Undead condition prefix"
    }, {
        pattern = "{name} ({appearance.textures.undead} {anatomy.undead})",
        weight = 10,
        description = "Undead texture + anatomy"
    }, {
        pattern = "{name} ({behaviors.movements.undead})",
        weight = 10,
        description = "Undead movement"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.undead})",
        weight = 10,
        description = "Colored undead anatomy"
    }, {
        pattern = "{physical.conditions.undead:capitalize} {name} ({appearance.textures.undead} {anatomy.general})",
        weight = 10,
        description = "Undead condition with textured anatomy"
    }, {
        pattern = "{physical.conditions.undead:capitalize}, {appearance.textures.undead} {name}",
        weight = 10,
        description = "Double undead condition + texture prefix"
    }, {
        pattern = "{name} ({appearance.hair_qualities.undead} {anatomy.undead})",
        weight = 10,
        description = "Undead hair/fur quality with anatomy"
    }, {
        pattern = "{appearance.hair_qualities.undead:capitalize} {name}",
        weight = 10,
        description = "Undead hair quality prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Undead sound (moaning, wailing)"
    }, {
        pattern = "{behaviors.attitudes.undead:capitalize} {name}",
        weight = 10,
        description = "Undead attitude (relentless, mindless)"
    }, {
        pattern = "{name} ({emotions.states.undead})",
        weight = 10,
        description = "Undead emotional state (tormented, vengeful)"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size variation"
    }
}
