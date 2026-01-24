-- Fiend Templates (fiends, devils, demons)

Data = {
    {
        pattern = "{name} ({appearance.qualities.fiend} {anatomy.general})",
        weight = 10,
        description = "Fiendish quality + anatomy"
    }, {
        pattern = "{name} ({appearance.colors.fiend} {anatomy.general})",
        weight = 10,
        description = "Fiendish color + anatomy"
    }, {
        pattern = "{name} ({behaviors.attitudes.fiend})",
        weight = 10,
        description = "Fiendish attitude"
    }, {
        pattern = "{appearance.qualities.fiend:capitalize} {name}",
        weight = 10,
        description = "Fiendish quality prefix"
    }, {
        pattern = "{name} ({appearance.colors.fiend} {items.weapons.general})",
        weight = 10,
        description = "Fiendish colored weapon"
    }, {
        pattern = "{appearance.qualities.fiend:capitalize}, {appearance.colors.fiend} {name}",
        weight = 10,
        description = "Fiendish quality + color double prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.fiend})",
        weight = 10,
        description = "Fiend sound"
    }, {
        pattern = "{name} ({emotions.states.fiend})",
        weight = 10,
        description = "Fiend emotional state"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix (imp to pit fiend)"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Infernal rank/hierarchy"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Fiend title"
    }, {
        pattern = "{name} ({items.accessories.general})",
        weight = 10,
        description = "Fiendish accessory (chains, collars)"
    }, {
        pattern = "{name} ({appearance.textures.general} {anatomy.general})",
        weight = 10,
        description = "Textured anatomy (scaly, leathery)"
    }
}
