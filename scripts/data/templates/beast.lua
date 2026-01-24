-- Beast templates (natural animals)

Data = {
    {
        pattern = "{name} ({appearance.colors.general} {anatomy.beast})",
        weight = 10,
        description = "Beast feature with optional color"
    }, {
        pattern = "{name} ({behaviors.sounds.beast})",
        weight = 10,
        description = "Beast sound"
    }, {
        pattern = "{physical.conditions.general:capitalize} {name}",
        weight = 10,
        description = "Condition prefix"
    }, {
        pattern = "{name} ({behaviors.movements.beast})",
        weight = 10,
        description = "Beast movement"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name} ({appearance.textures.general} {anatomy.beast})",
        weight = 10,
        description = "Size with textured beast feature"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name} ({appearance.textures.general} {anatomy.beast})",
        weight = 10,
        description = "Attitude prefix with textured feature"
    }, {
        pattern = "{name} ({behaviors.sounds.beast} and {behaviors.movements.beast})",
        weight = 10,
        description = "Sound + movement combo"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.conditions.general} {name}",
        weight = 10,
        description = "Size + condition double prefix"
    }, {
        pattern = "{physical.conditions.general:capitalize}, {behaviors.attitudes.general} {name}",
        weight = 10,
        description = "Condition + attitude double prefix"
    }, {
        pattern = "{name} ({appearance.hair_qualities.beast} {anatomy.beast})",
        weight = 10,
        description = "Fur quality with beast feature"
    }, {
        pattern = "{appearance.hair_qualities.beast:capitalize} {name}",
        weight = 10,
        description = "Fur quality prefix"
    }, {
        pattern = "{name} ({behaviors.expressions.general})",
        weight = 10,
        description = "Expression/manner"
    }, {
        pattern = "{physical.builds.general:capitalize} {name}",
        weight = 10,
        description = "Beast build (lanky, burly)"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected animal"
    }
}
