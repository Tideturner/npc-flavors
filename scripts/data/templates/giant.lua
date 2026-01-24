-- Giant Templates

Data = {
    {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix (thematic for giants)"
    }, {
        pattern = "{name} ({appearance.qualities.general} {items.clothing.general})",
        weight = 10,
        description = "Quality clothing"
    }, {
        pattern = "{physical.builds.general:capitalize} {name}",
        weight = 10,
        description = "Build prefix"
    }, {
        pattern = "{name} ({appearance.qualities.general} {items.weapons.general})",
        weight = 10,
        description = "Quality weapon descriptor"
    }, {
        pattern = "{name} {social.titles.general}",
        weight = 10,
        description = "Title suffix"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.builds.general} {name}",
        weight = 10,
        description = "Size + build double prefix (perfect for giants)"
    }, {
        pattern = "{physical.conditions.general:capitalize}, {physical.builds.general} {name}",
        weight = 10,
        description = "Condition + build double prefix"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.humanoid})",
        weight = 10,
        description = "Colored humanoid anatomy"
    }, {
        pattern = "{appearance.textures.general:capitalize} {name}",
        weight = 10,
        description = "Texture prefix (weathered, scarred)"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Attitude prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Giant sound (bellowing, roaring)"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Movement (lumbering, striding)"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Emotional state"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected (frost, storm)"
    }, {
        pattern = "{name} ({items.accessories.general})",
        weight = 10,
        description = "Giant accessory (belt, jewelry)"
    }, {
        pattern = "{social.ranks.general:capitalize} {name}",
        weight = 10,
        description = "Giant rank (chieftain, jarl)"
    }
}
