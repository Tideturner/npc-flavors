-- Fey Templates (fey, dryads, pixies, satyrs)

Data = {
    {
        pattern = "{name} ({appearance.qualities.fey} {anatomy.general})",
        weight = 10,
        description = "Fey quality + anatomy"
    }, {
        pattern = "{name} ({appearance.colors.fey} {anatomy.general})",
        weight = 10,
        description = "Fey color + anatomy"
    }, {
        pattern = "{appearance.qualities.fey:capitalize} {name}",
        weight = 10,
        description = "Fey quality prefix"
    }, {
        pattern = "{name} ({appearance.colors.fey} {items.clothing.general})",
        weight = 10,
        description = "Fey colored clothing"
    }, {
        pattern = "{name} ({appearance.qualities.fey} {items.accessories.general})",
        weight = 10,
        description = "Fey quality accessory"
    }, {
        pattern = "{appearance.qualities.fey:capitalize}, {appearance.colors.fey} {name}",
        weight = 10,
        description = "Fey quality + color double prefix"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Attitude prefix (mischievous, playful)"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Fey sound (laughing, singing)"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Emotional state"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix (for pixies vs fey giants)"
    }, {
        pattern = "{name} with {items.weapons.general}",
        weight = 10,
        description = "Fey with weapon"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Fey court rank"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Fey title"
    }
}
