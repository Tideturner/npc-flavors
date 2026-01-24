-- Elemental Templates (elementals, genies, mephits)

Data = {
    {
        pattern = "{name} ({appearance.textures.elemental} {anatomy.elemental})",
        weight = 10,
        description = "Elemental texture + anatomy"
    }, {
        pattern = "{name} ({behaviors.movements.elemental})",
        weight = 10,
        description = "Elemental movement"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.elemental})",
        weight = 10,
        description = "Colored elemental feature"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {appearance.textures.elemental} {name}",
        weight = 10,
        description = "Size + texture double prefix"
    }, {
        pattern = "{appearance.textures.elemental:capitalize}, {behaviors.movements.elemental} {name}",
        weight = 10,
        description = "Texture + movement double prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.elemental})",
        weight = 10,
        description = "Elemental sound"
    }, {
        pattern = "{environment.weather.planar:capitalize} {name}",
        weight = 10,
        description = "Planar environment prefix"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Elemental attitude (hostile, calm)"
    }
}
