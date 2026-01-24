-- Aberration templates (mind flayers, beholders, aboleths)

Data = {
    {
        pattern = "{physical.conditions.monstrous:capitalize} {name}",
        weight = 10,
        description = "Aberrant condition prefix"
    }, {
        pattern = "{name} ({appearance.textures.monstrous} {anatomy.monstrous}, {behaviors.sounds.monstrous})",
        weight = 10,
        description = "Aberrant texture + anatomy with sound"
    }, {
        pattern = "{name} ({anatomy.monstrous}, {behaviors.sounds.monstrous})",
        weight = 10,
        description = "Aberrant anatomy with sound"
    }, {
        pattern = "{name} ({appearance.textures.monstrous} {anatomy.monstrous})",
        weight = 10,
        description = "Aberrant texture + anatomy"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.monstrous})",
        weight = 10,
        description = "Colored aberrant anatomy"
    }, {
        pattern = "{physical.conditions.monstrous:capitalize} {name} ({behaviors.sounds.monstrous})",
        weight = 10,
        description = "Aberrant condition with sound"
    }, {
        pattern = "{physical.conditions.monstrous:capitalize}, {appearance.textures.monstrous} {name}",
        weight = 10,
        description = "Double monstrous condition + texture prefix"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.conditions.monstrous} {name}",
        weight = 10,
        description = "Size + monstrous condition prefix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Aberrant movement"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Aberration attitude (calculating, hostile)"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Alien emotional state"
    }, {
        pattern = "{environment.weather.planar:capitalize} {name}",
        weight = 10,
        description = "Planar environment effect"
    }
}
