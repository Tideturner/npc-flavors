-- Monstrosity templates (manticores, chimeras, giant spiders)

Data = {
    {
        pattern = "{name} ({appearance.colors.general} {anatomy.monstrous})",
        weight = 10,
        description = "Colored monstrous anatomy"
    }, {
        pattern = "{physical.conditions.monstrous:capitalize} {name}",
        weight = 10,
        description = "Monstrous condition prefix"
    }, {
        pattern = "{name} ({behaviors.sounds.monstrous})",
        weight = 10,
        description = "Monstrous sound"
    }, {
        pattern = "{name} ({appearance.textures.monstrous} {anatomy.monstrous})",
        weight = 10,
        description = "Monstrous texture + anatomy"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name} ({appearance.textures.monstrous} {anatomy.monstrous})",
        weight = 10,
        description = "Size with textured monstrous feature"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.conditions.monstrous} {name}",
        weight = 10,
        description = "Size + monstrous condition double prefix"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.beast})",
        weight = 10,
        description = "Colored beast anatomy (for hybrid monstrosities)"
    }, {
        pattern = "{name} ({appearance.textures.monstrous} {anatomy.beast})",
        weight = 10,
        description = "Monstrous texture + beast anatomy (for hybrids)"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Monstrosity movement"
    }, {
        pattern = "{behaviors.attitudes.general:capitalize} {name}",
        weight = 10,
        description = "Monstrosity attitude"
    }, {
        pattern = "{name} ({emotions.states.general})",
        weight = 10,
        description = "Emotional state (for intelligent monstrosities)"
    }
}
