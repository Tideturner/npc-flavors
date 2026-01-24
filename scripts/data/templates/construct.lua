-- Construct Templates (constructs, golems, animated objects)

Data = {
    {
        pattern = "{physical.conditions.construct:capitalize} {name}",
        weight = 10,
        description = "Construct condition prefix"
    }, {
        pattern = "{name} ({appearance.textures.construct} {anatomy.construct})",
        weight = 10,
        description = "Construct texture + anatomy"
    }, {
        pattern = "{name} ({behaviors.sounds.construct})",
        weight = 10,
        description = "Construct sound"
    }, {
        pattern = "{name} ({appearance.colors.general} {anatomy.construct})",
        weight = 10,
        description = "Colored construct anatomy"
    }, {
        pattern = "{physical.sizes.general:capitalize} {name}",
        weight = 10,
        description = "Size prefix"
    }, {
        pattern = "{physical.conditions.construct:capitalize} {name} ({behaviors.sounds.construct})",
        weight = 10,
        description = "Construct condition + sound"
    }, {
        pattern = "{physical.conditions.construct:capitalize}, {appearance.textures.construct} {name}",
        weight = 10,
        description = "Condition + texture double prefix"
    }, {
        pattern = "{physical.sizes.general:capitalize}, {physical.conditions.construct} {name}",
        weight = 10,
        description = "Size + condition double prefix"
    }, {
        pattern = "{name} ({behaviors.movements.general})",
        weight = 10,
        description = "Construct movement (lumbering, grinding)"
    }, {
        pattern = "{name} with {items.weapons.general}",
        weight = 10,
        description = "Construct with integrated weapon"
    }
}
