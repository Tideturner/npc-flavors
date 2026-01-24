-- Celestial templates (angels, archons, devas)

Data = {
    {
        pattern = "{name} ({appearance.qualities.celestial} {anatomy.general})",
        weight = 10,
        description = "Celestial quality + anatomy"
    }, {
        pattern = "{name} ({appearance.colors.celestial} {anatomy.general})",
        weight = 10,
        description = "Celestial color + anatomy"
    }, {
        pattern = "{name} ({behaviors.attitudes.celestial})",
        weight = 10,
        description = "Celestial attitude"
    }, {
        pattern = "{appearance.qualities.celestial:capitalize} {name}",
        weight = 10,
        description = "Celestial quality prefix"
    }, {
        pattern = "{name} ({appearance.colors.celestial} {items.clothing.general})",
        weight = 10,
        description = "Celestial colored clothing"
    }, {
        pattern = "{appearance.qualities.celestial:capitalize}, {appearance.colors.celestial} {name}",
        weight = 10,
        description = "Celestial quality + color double prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.celestial})",
        weight = 10,
        description = "Celestial sound"
    }, {
        pattern = "{name} ({emotions.states.celestial})",
        weight = 10,
        description = "Celestial emotional state"
    }, {
        pattern = "{name} wielding {appearance.colors.celestial} {items.weapons.general}",
        weight = 10,
        description = "Celestial with colored weapon (broader compatibility)"
    }, {
        pattern = "{name} ({appearance.qualities.celestial} {items.accessories.general})",
        weight = 10,
        description = "Celestial accessory (halo, holy symbols)"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix (celestials vary greatly)"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Angelic rank/hierarchy"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Celestial title"
    }
}
