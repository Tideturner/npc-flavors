FlavorsByType = {}

function onInit()
    --[[
        Current possible flavors:
        - clothing (dapper baret)
        - bodyparts (tattooed shoulders)
        - hair (mangled pencil moustache)
        - build (noticably short)
        - behavior (bitter scream)
        - fur (unmanageable fuzz)
        - characteristic (broken nose)

        About how this data is used:
        - If an NPC has no type match, no flavor is used
        - If an NPC has a specific match, that data is used (humanoid.gnoll)
        - Otherwise any first match in the type chain is used (humanoid.human.shapechanger > humanoid.human > humanoid)
    ]]

    FlavorsByType = {
        -- Aboleth, Beholder, Blue Slaad, Chuul, Cloaker, Flumph, Gibbering Mouther, Grell, Intellect Devourer,
        -- Mind Flayer, Mind Flayer Arcanist, Nothic, Otyugh, Red Slaad, Slaad Tadpole, Spectator
        ["aberration"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        -- Death Slaad, Gray Slaad, Green Slaad
        ["aberration.shapechanger"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior,
            NPCFlavorData.Flavors.bodyparts,
        },

        -- Animated Armor, Clay Golem, Duodrone, Flesh Golem, Flying Sword, Helmed Horror, Homunculus, Iron
        -- Golem, Monodrone, Pentadrone, Quadrone, Rug of Smothering, Scarecrow, Shield Guardian, Stone Golem,
        -- Tridrone
        ["construct"] = {
            NPCFlavorData.Flavors.build
        },

        -- Adult Black Dragon, Adult Blue Dragon, Adult Brass Dragon, Adult Bronze Dragon, Adult Copper Dragon,
        -- Adult Gold Dragon, Adult Green Dragon, Adult Red Dragon, Adult Silver Dragon, Adult White Dragon,
        -- Ancient Black Dragon, Ancient Blue Dragon, Ancient Brass Dragon, Ancient Bronze Dragon, Ancient
        -- Copper Dragon, Ancient Gold Dragon, Ancient Green Dragon, Ancient Red Dragon, Ancient Silver Dragon,
        -- Ancient White Dragon, Black Dragon Wyrmling, Blue Dragon Wyrmling, Brass Dragon Wyrmling, Bronze
        -- Dragon Wyrmling, Copper Dragon Wyrmling, Dragon Turtle, Faerie Dragon, Gold Dragon Wyrmling, Green
        -- Dragon Wyrmling, Pseudodragon, Pseudodragon, Red Dragon Wyrmling, Silver Dragon Wyrmling, White
        -- Dragon Wyrmling, Wyvern, Young Black Dragon, Young Blue Dragon, Young Brass Dragon, Young Bronze
        -- Dragon, Young Copper Dragon, Young Gold Dragon, Young Green Dragon, Young Red Dragon, Young Red
        -- Shadow Dragon, Young Silver Dragon, Young White Dragon
        ["dragon"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        -- Air Elemental, Azer, Dao, Djinni, Dust Mephit, Earth Elemental, Efreeti, Fire Elemental, Fire Snake,
        -- Galeb Duhr, Gargoyle, Ice Mephit, Invisible Stalker, Magma Mephit, Magmin, Marid, Mud Mephit,
        -- Salamander, Smoke Mephit, Steam Mephit, Water Elemental, Water Weird, Xorn
        ["elemental"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        -- Blink Dog, Dryad, Green Hag, Pixie, Satyr, Sea Hag, Sprite, Sprite
        ["fey"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.fur,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior,
        },

        -- Balor, Barlgura, Chasme, Dretch, Glabrezu, Goristro, Hezrou, Manes, Marilith, Nalfeshnee, Shadow
        -- Demon, Vrock
        ["fiend.demon"] = {
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.fur,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior,
        },

        -- Quasit, Quasit, Yochlol
        ["demon.shapechanger"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        -- Gnoll Fang of Yeenoghu
        ["fiend.gnoll"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.fur,
            NPCFlavorData.Flavors.behavior
        },

        -- Incubus, Succubus
        ["fiend.shapechanger"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.behavior
        },

        -- Cloud Giant, Cyclops, Ettin, Fire Giant, Fomorian, Frost Giant, Half-Ogre, Hill Giant, Ogre, Oni,
        -- Stone Giant, Storm Giant, Troll
        ["giant"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        --
        ["humanoid"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
        -- Aarakocra
        ["humanoid.aarakocra"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
        -- Gnoll, Gnoll Pack Lord
        ["humanoid.gnoll"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.fur,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
        -- Werebear, Wereboar, Wererat, Weretiger, Werewolf
        ["human.shapechanger"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.fur,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        -- Abominable Yeti, Androsphinx, Ankheg, Basilisk, Behir, Bulette, Carrion Crawler, Centaur, Chimera,
        -- Cockatrice, Darkmantle, Death Dog, Displacer Beast, Drider, Ettercap, Gorgon, Grick, Grick Alpha,
        -- Griffon, Guardian Naga, Gynosphinx, Harpy, Hippogriff, Hook Horror, Hydra, Lamia, Manticore, Medusa,
        -- Merrow, Minotaur, Owlbear, Peryton, Phase Spider, Piercer, Purple Worm, Remorhaz, Roc, Roper, Rust
        -- Monster, Spirit Naga, Umber Hulk, Winter Wolf, Worg, Yeti, Young Remorhaz
        ["monstrosity"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },

        ["undead"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
        -- Vampire, Vampire Spellcaster, Vampire Warrior
        ["undead.shapechanger"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
        ["undead.zombie"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        }
    }
end