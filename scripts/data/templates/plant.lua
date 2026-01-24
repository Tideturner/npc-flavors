-- Plant Templates (plants, treants, shambling mounds)

Data = {
    {
        pattern = "{name} ({appearance.colors.general} {anatomy.general})",
        weight = 10,
        description = "Colored plant anatomy"
    }, {
        pattern = "{name} ({appearance.textures.general} {anatomy.general})",
        weight = 10,
        description = "Textured plant anatomy"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Plant movement"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {appearance.textures.general} {name}",
        weight = 10,
        description = "Size + texture double prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Plant sound (rustling, creaking)"
    }, {
        pattern = "{appearance.qualities.general:capitalize} {name}",
        weight = 10,
        description = "Quality prefix (withered, lush)"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected plant"
    }
}
