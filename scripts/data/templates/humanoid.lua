-- Humanoid Templates (humans, elves, dwarves, orcs)

Data = {
    {
        pattern = "{name} ({appearance.colors.general} {anatomy.humanoid})",
        weight = 10,
        description = "Humanoid feature with color"
    }, {
        pattern = "{social.ranks.humanoid:capitalize} {name} ({appearance.qualities.general} {items.clothing.general})",
        weight = 10,
        description = "Optional rank with quality clothing"
    }, {
        pattern = "{name} ({appearance.qualities.general} {items.weapons.general})",
        weight = 10,
        description = "Quality weapon"
    }, {
        pattern = "{physical.conditions.general:capitalize} {name} ({appearance.textures.general} {anatomy.humanoid})",
        weight = 10,
        description = "Condition with textured feature"
    }, {
        pattern = "{name} ({appearance.textures.general} {anatomy.humanoid})",
        weight = 10,
        description = "Textured feature"
    }, {
        pattern = "{name} ({behaviors.attitudes.general}, wielding {items.weapons.general})",
        weight = 10,
        description = "Attitude wielding weapon"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name} ({appearance.qualities.general} {items.weapons.general})",
        weight = 10,
        description = "Attitude prefix with quality weapon"
    }, {
        pattern = "{physical.builds.general:capitalize} {name} ({appearance.textures.general} {anatomy.humanoid})",
        weight = 10,
        description = "Build prefix with textured feature"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.builds.general} {name}",
        weight = 10,
        description = "Size + build double prefix"
    }, {
        pattern = "{physical.conditions.general:capitalize}, {appearance.textures.general} {name}",
        weight = 10,
        description = "Condition + texture double prefix"
    }, {
        pattern = "{name} ({items.accessories.general})",
        weight = 10,
        description = "Single accessory"
    }, {
        pattern = "{name} with {appearance.colors.general} {items.accessories.general}",
        weight = 10,
        description = "With colored accessory"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Making sound"
    }, {
        pattern = "{physical.conditions.general:capitalize} {name} ({items.clothing.general})",
        weight = 10,
        description = "Condition with clothing"
    }, {
        pattern = "{name} in {appearance.qualities.general} {items.clothing.general}",
        weight = 10,
        description = "In quality clothing"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Optional rank prefix only"
    }, {
        pattern = "{name} ({appearance.qualities.general} {items.accessories.general})",
        weight = 10,
        description = "Quality accessory"
    }, {
        pattern = "{physical.builds.general:capitalize} {name} with {items.weapons.general}",
        weight = 10,
        description = "Build with weapon"
    }, {
        pattern = "{name} ({behaviors.attitudes.general})",
        weight = 10,
        description = "Attitude only"
    }, {
        pattern = "{physical.conditions.general:capitalize}, {physical.builds.general} {name}",
        weight = 10,
        description = "Condition + build double prefix"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected prefix"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Emotional state"
    }, {
        pattern = "{emotions.states.general:capitalize} {name} ({items.weapons.general})",
        weight = 10,
        description = "Emotional with weapon"
    }, {
        pattern = "{name} ({appearance.hair_qualities.general} {anatomy.humanoid})",
        weight = 10,
        description = "Hair quality with feature"
    }, {
        pattern = "{appearance.hair_qualities.general:capitalize} {name}",
        weight = 10,
        description = "Hair quality prefix"
    }, {
        pattern = "{name} ({items.clothing_qualities.general} {items.clothing.general})",
        weight = 10,
        description = "Clothing quality descriptor"
    }, {
        pattern = "{name} ({appearance.hair_qualities.colors} {anatomy.humanoid})",
        weight = 10,
        description = "Hair color with feature"
    }, {
        pattern = "{name} ({emotions.personality.general} {behaviors.expressions.general})",
        weight = 10,
        description = "Personality with expression"
    }, {
        pattern = "{emotions.personality.general:capitalize} {name}",
        weight = 10,
        description = "Personality prefix"
    }, {
        pattern = "{name} ({behaviors.expressions.general})",
        weight = 10,
        description = "Expression/manner"
    }, {
        pattern = "{name} ({behaviors.attitudes.general} {behaviors.expressions.general})",
        weight = 10,
        description = "Attitude with expression"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Title suffix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Movement descriptor"
    }
    
}
