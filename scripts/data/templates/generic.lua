-- Generic Templates - apply to all NPC types unless overridden

Data = {
    {
        pattern = "{name} ({appearance.qualities.general} {items.clothing.general})",
        weight = 10,
        description = "Quality + clothing"
    }, {
        pattern = "{physical.conditions.general:capitalize} {name}",
        weight = 10,
        description = "Condition prefix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Movement descriptor"
    }, {
        pattern = "{name} ({appearance.colors.general} {items.clothing.general})",
        weight = 10,
        description = "Colored clothing"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{name} ({appearance.qualities.general} {items.weapons.general})",
        weight = 10,
        description = "Quality weapon descriptor"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Title suffix"
    }, {
        pattern = "{physical.builds.general:capitalize} {name}",
        weight = 10,
        description = "Build prefix"
    }, {
        pattern = "{name} ({items.accessories.general} and {items.clothing.general})",
        weight = 10,
        description = "Optional accessory + clothing"
    }, {
        pattern = "{name} with {items.weapons.general}",
        weight = 10,
        description = "With weapon"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Making sound"
    }, {
        pattern = "{name} ({behaviors.attitudes.general})",
        weight = 10,
        description = "Attitude descriptor"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Attitude prefix"
    }, {
        pattern = "{name} ({items.accessories.general})",
        weight = 10,
        description = "Single accessory"
    }, {
        pattern = "{name} in {appearance.colors.general} {items.clothing.general}",
        weight = 10,
        description = "In colored clothing"
    }, {
        pattern = "{physical.conditions.general:capitalize}, {physical.builds.general} {name}",
        weight = 10,
        description = "Condition + build prefix"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {behaviors.attitudes.general} {name}",
        weight = 10,
        description = "Size + attitude prefix"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Emotional state"
    }, {
        pattern = "{name} ({items.clothing_qualities.general} {items.clothing.general})",
        weight = 10,
        description = "Clothing quality descriptor"
    }, {
        pattern = "{emotions.personality.general:capitalize} {name}",
        weight = 10,
        description = "Personality trait prefix"
    }, {
        pattern = "{name} ({emotions.personality.general})",
        weight = 10,
        description = "Personality trait"
    }, {
        pattern = "{name} ({behaviors.expressions.general})",
        weight = 10,
        description = "Expression/manner"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Rank prefix"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.general})",
        weight = 10,
        description = "Colored anatomical feature"
    }
}
