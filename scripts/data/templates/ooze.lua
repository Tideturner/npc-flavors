-- Ooze Templates (oozes, slimes, gels)

Data = {
    {
        pattern = "{name} ({appearance.colors.general})",
        weight = 10,
        description = "Colored ooze"
    }, {
        pattern = "{name} ({appearance.textures.general})",
        weight = 10,
        description = "Textured ooze"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Ooze movement"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {appearance.textures.general} {name}",
        weight = 10,
        description = "Size + texture double prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Ooze sound (squelching, bubbling)"
    }, {
        pattern = "{appearance.qualities.general:capitalize} {name}",
        weight = 10,
        description = "Quality prefix (gleaming, dull)"
    }
}
