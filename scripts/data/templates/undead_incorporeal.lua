-- Undead Incorporeal Templates (ghosts, spectres, wraiths, banshees, etc.)

Data = {
    {
        pattern = "{name} ({appearance.textures.incorporeal} {anatomy.incorporeal})",
        weight = 20,
        description = "Ethereal/translucent form with incorporeal features"
    }, {
        pattern = "{appearance.qualities.general:capitalize} {name}",
        weight = 15,
        description = "Quality prefix (gleaming, dull, etc.)"
    }, {
        pattern = "{name} ({behaviors.movements.incorporeal} and {appearance.textures.incorporeal})",
        weight = 15,
        description = "Floating/drifting with ethereal texture"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.incorporeal})",
        weight = 15,
        description = "Colored ethereal features"
    }, {
        pattern = "{behaviors.movements.incorporeal:capitalize} {name}",
        weight = 15,
        description = "Movement prefix (drifting, floating, etc.)"
    }, {
        pattern = "{name} ({emotions.states.undead})",
        weight = 10,
        description = "Emotional state (tormented, vengeful, etc.)"
    }, {
        pattern = "{appearance.textures.incorporeal:capitalize} {name}",
        weight = 10,
        description = "Ethereal texture prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.general})",
        weight = 10,
        description = "Incorporeal sound (wailing, moaning)"
    }, {
        pattern = "{behaviors.attitudes.undead:capitalize} {name}",
        weight = 10,
        description = "Undead attitude (vengeful, mournful)"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size variation (even ghosts vary)"
    }, {
        pattern = "{name} in {appearance.textures.general} {items.clothing.general}",
        weight = 10,
        description = "Ghost in clothing (avoids redundant textures)"
    }
}
