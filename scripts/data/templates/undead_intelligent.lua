-- Undead Intelligent Templates (vampires, liches, revenants, etc.)

Data = {
    {
        pattern = "{social.ranks.humanoid:capitalize} {name}",
        weight = 15,
        description = "Title/rank prefix (lord, commander, etc.)"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.undead})",
        weight = 15,
        description = "Colored features"
    }, {
        pattern = "{name} ({items.clothing.general} and {appearance.qualities.general} {anatomy.humanoid})",
        weight = 15,
        description = "Clothing + quality feature"
    }, {
        pattern = "{physical.conditions.undead:capitalize} {name}",
        weight = 15,
        description = "Undead condition"
    }, {
        pattern = "{name} ({appearance.textures.undead} {anatomy.humanoid})",
        weight = 10,
        description = "Textured humanoid features"
    }, {
        pattern = "{name} ({behaviors.attitudes.general})",
        weight = 10,
        description = "Behavioral attitude"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Title suffix"
    }, {
        pattern = "{name} ({emotions.states.undead})",
        weight = 10,
        description = "Undead emotional state"
    }, {
        pattern = "{name} with {items.weapons.general}",
        weight = 10,
        description = "Intelligent undead with weapon"
    }, {
        pattern = "{name} ({items.accessories.general})",
        weight = 10,
        description = "Undead accessory (jewelry, crown)"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size variation"
    }, {
        pattern = "{physical.builds.general:capitalize} {name}",
        weight = 10,
        description = "Build description"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Refined movement (not shambling)"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Speech, commands"
    }, {
        pattern = "{emotions.personality.general:capitalize} {name}",
        weight = 10,
        description = "Personality trait"
    }
}
