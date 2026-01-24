-- Dragon Templates (dragons, drakes, wyrms)

Data = {
    {
        pattern = "{name} ({appearance.textures.dragon} {anatomy.dragon})",
        weight = 10,
        description = "Dragon texture + anatomy"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{name} {social.titles.dragon}",
        weight = 10,
        description = "Dragon title"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.dragon})",
        weight = 10,
        description = "Colored dragon feature"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {appearance.qualities.general} {name}",
        weight = 10,
        description = "Size + quality double prefix"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Dragon attitude (proud, wrathful, cunning)"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Dragon sound (roaring, bellowing)"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Dragon emotional state"
    }, {
        pattern = "{physical.builds.general:capitalize} {name}",
        weight = 10,
        description = "Dragon build (massive, sleek)"
    }, {
        pattern = "{environment.weather.general:capitalize} {name}",
        weight = 10,
        description = "Weather-affected dragon"
    }
}
