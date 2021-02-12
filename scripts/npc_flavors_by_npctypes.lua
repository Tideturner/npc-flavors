FlavorsByType = {
    ["5E"] = {},
    ["PFRPG"] = {},
    ["2E"] = {},
}

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

    FlavorsByType["5E"] = {
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

    FlavorsByType["PFRPG"] = {
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

    FlavorsByType["2E"] = {
        -- "Brownie, Quickling"
        [""] = {
        },
    
        -- "Bat, Azmyth", "Bat, Common", "Bat, Huge", "Bat, Large", "Bat, Night Hunter", "Bat, Sinister",
        -- "Bear, Black", "Bear, Brown", "Bear, Cave", "Bear, Polar", "Beetle Giant, Stag", "Catoblepas", "Cave
        -- Fisher", "Crocodile, Giant", "Crocodile, Normal", "Crustacean Giant, Giant Crab", "Crustacean Giant,
        -- Giant Crayfish", "Dinosaur I, Triceratops", "Dog, Blink Dog", "Dog, Death Dog", "Dog, Moon", "Dog,
        -- War Dog", "Dog, Wild Dog", "Elephant, Elephant African", "Elephant, Mammoth", "Elephant, Mastodon",
        -- "Elephant, Oliphant", "Fish, Shark, Giant (10HD)", "Frog, Giant (HD 02)", "Frog, Giant (HD 03)",
        -- "Frog, Giant", "Frog, Killer", "Frog, Poisonous", "Gith, Pirate of", "Horse, Draft", "Horse, Mule",
        -- "Horse, Pony", "Horse, Riding", "Horse, War, Heavy", "Horse, War, Light", "Horse, War, Medium",
        -- "Horse, Wild", "Human, Merchant Sailor/Fisherman", "Human, Pirate/Buccaneer", "Insect, Ant Lion,
        -- Giant", "Insect, Aratha", "Insect, Aspis, Cow", "Insect, Fly, Horsefly", "Leech, Giant (HD 02)",
        -- "Leech, Giant", "Leech, Swarm", "Leech, Throat", "Locathah", "Mammal Herd I, Antelope", "Mammal Herd
        -- I, Buffalo", "Mammal Herd I, Camel", "Mammal Herd I, Cattle", "Mammal Herd I, Sheep", "Mammal, Ape,
        -- Carnivorous", "Mammal, Baboon, Wild", "Mammal, Badger", "Mammal, Banderlog", "Mammal, Bhaergala",
        -- "Mammal, Boar, Wild", "Mammal, Chattur", "Mammal, Cooshee", "Mammal, Dakon", "Mammal, Debbi",
        -- "Mammal, Goat", "Mammal, Gorilla", "Mammal, Hsing-Sing", "Mammal, Hyena", "Mammal, Jackal", "Mammal,
        -- Losel", "Mammal, Monkey Spider", "Mammal, Porcupine, Black", "Mammal, Porcupine, Brown", "Mammal,
        -- Rothe", "Mammal, Skunk", "Mammal, Sleek", "Mammal, Small, Beaver", "Mammal, Small, Chipmunk",
        -- "Mammal, Small, Ermine", "Mammal, Small, Ferret", "Mammal, Small, Fox", "Mammal, Small, Gopher",
        -- "Mammal, Small, Hedgehog", "Mammal, Small, Mink", "Mammal, Small, Mole", "Mammal, Small, Monkey",
        -- "Mammal, Small, Mouse", "Mammal, Small, Muskrat", "Mammal, Small, Opposum", "Mammal, Small, Otter",
        -- "Mammal, Small, Otter, Giant", "Mammal, Small, Otter, Sea", "Mammal, Small, Pig, Domestic", "Mammal,
        -- Small, Pig, Wild", "Mammal, Small, Rabbit", "Mammal, Small, Racoon", "Mammal, Small, Squirrel",
        -- "Mammal, Small, Squirrel, Flying", "Mammal, Small, Squirrel, Giant Black", "Mammal, Small,
        -- Woodchuck", "Mammal, Stag, Wild", "Mammal, Stench Kow", "Mammal, Taer", "Mammal, Tyrg", "Mammal,
        -- Warthog", "Mammal, Weasel", "Mammal, Wolverine", "Octopus, Giant", "Owlbear", "Rat, Giant", "Rat,
        -- Osquip", "Sea Lion", "Slug, Giant", "Squid Giant, Giant Squid", "Squid Giant, Kraken", "Swanmay,
        -- Bird Maiden", "Toad Giant, Fire Toad", "Toad Giant, Giant Toad", "Toad Giant, Ice Toad", "Toad
        -- Giant, Poisonous Toad", "Whale, Common", "Whale, Giant", "Whale, Killer", "Whale, Leviathan",
        -- "Whale, Narwhal", "Wolf", "Wolf, Dire", "Wolf, Winter", "Wolf, Worg", "Wolfwere", "Zaratan"
        ["animal"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Bird, Blood Hawk", "Bird, Boobrie", "Bird, Condor", "Bird, Eblis", "Bird, Falcon", "Bird,
        -- Flightless", "Bird, Giant Eagle", "Bird, Giant Owl", "Bird, Giant Raven", "Bird, Giant Vulture",
        -- "Bird, Huge Raven", "Bird, Large Hawk", "Bird, Owl", "Bird, Raven", "Bird, Swan", "Bird, Talking
        -- Owl", "Bird, Vulture", "Bird, Wild Eagle"
        ["animal.avian"] = {
        },
    
        -- "Cat Great, Cheetah", "Cat Great, Common Lion", "Cat Great, Giant Lynx", "Cat Great, Jaguar", "Cat
        -- Great, Leopard", "Cat Great, Mountain Lion", "Cat Great, Smilodon", "Cat Great, Spotted Lion", "Cat
        -- Great, Wild Tiger", "Cat Small, Domestic", "Cat Small, Elven", "Cat Small, Wild"
        ["animal.feline"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior,
            NPCFlavorData.Flavors.fur
        },
    
        -- 
        ["animal.reptile"] = {
        },
    
        -- "Lizard, Fire", "Lizard, Giant", "Lizard, Minotaur", "Lizard, Subterranean"
        ["reptile.lizard"] = {
        },
    
        -- 
        ["demon"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Imp, Quasit", "Slaad, Blue", "Slaad, Death", "Slaad, Gray", "Slaad, Green", "Slaad, Red",
        -- "Tanar'ri, True, Balor", "Tanar'ri, True, Marilith"
        ["demon.tanar'ri"] = {
        },
    
        -- 
        ["devil"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Baatezu Lesser Abishai, Black", "Baatezu Lesser Abishai, Green", "Baatezu Lesser Abishai, Red",
        -- "Baatezu, Greater, Pit Fiend", "Imp"
        ["devil.baatezu"] = {
        },
    
        -- "Dinosaur I, Ankylosaurus", "Dinosaur I, Deinonychus", "Dinosaur I, Diplodocus", "Dinosaur I,
        -- Elasmosaurus", "Dinosaur I, Lambeosaurus", "Dinosaur I, Pteranodon", "Dinosaur I, Stegosaurus",
        -- "Dinosaur I, Tyrannosaurus"
        ["dinosaur"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Dracolich (Former Chromatic, Red, Old)", "Dragon ** GENERAL **", "Dragon, Brown (Juvenile)",
        -- "Dragon, Cloud (Juvenile)", "Dragon, Deep (Juvenile)", "Dragon, Gem, Amethyst (Juvenile)", "Dragon,
        -- Gem, Crystal (Juvenile)", "Dragon, Gem, Emerald (Juvenile)", "Dragon, Gem, Sapphire (Juvenile)",
        -- "Dragon, Gem, Topaz (Juvenile)", "Dragon, Mercury (Juvenile)", "Dragon, Mist (Juvenile)", "Dragon,
        -- Shadow (Juvenile)", "Dragon, Steel (Juvenile)", "Dragon, Yellow (Juvenile)", "Dragon,Turtle",
        -- "Dragonet, Faerie Dragon (Juvenile)", "Dragonet, Fire Drake", "Dragonet, Pseudodragon", "Dragonne",
        -- "Insect, Dragonfly, Giant", "Insect, Dragonfly, Larva"
        ["dragon"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Dragon, Chromatic, Black (Hatchling)", "Dragon, Chromatic, Black (Juvenile)", "Dragon, Chromatic,
        -- Black (Old)"
        ["dragon.black"] = {
        },
    
        -- "Dragon, Chromatic, Blue (Hatchling)", "Dragon, Chromatic, Blue (Juvenile)", "Dragon, Chromatic,
        -- Blue (Old)"
        ["dragon.blue"] = {
        },
    
        -- "Dragon, Metallic, Brass (Juvenile)"
        ["dragon.brass"] = {
        },
    
        -- "Dragon, Metallic, Bronze (Juvenile)"
        ["dragon.bronze"] = {
        },
    
        -- "Dragon, Metallic, Copper (Juvenile)"
        ["dragon.copper"] = {
        },
    
        -- "Dragon, Metallic, Gold (Juvenile)"
        ["dragon.gold"] = {
        },
    
        -- "Dragon, Chromatic, Green (Hatchling)", "Dragon, Chromatic, Green (Juvenile)", "Dragon, Chromatic,
        -- Green (Old)"
        ["dragon.green"] = {
        },
    
        -- "Dragon, Chromatic, Red (Hatchling)", "Dragon, Chromatic, Red (Juvenile)", "Dragon, Chromatic, Red
        -- (Old)"
        ["dragon.red"] = {
        },
    
        -- "Dragon, Metallic, Silver (Juvenile)"
        ["dragon.silver"] = {
        },
    
        -- "Dragon, Chromatic, White (Hatchling)", "Dragon, Chromatic, White (Juvenile)", "Dragon, Chromatic,
        -- White (Old)"
        ["dragon.white"] = {
        },
    
        -- "Elemental, Air (HD 08)", "Elemental, Air (HD 12)", "Elemental, Air (HD 16)", "Elemental, Air Kin,
        -- Aerial Servant", "Elemental, Air Kin, Sylph", "Elemental, Composite, Skriaxit (HD 16)", "Elemental,
        -- Composite, Skriaxit (HD 24)", "Elemental, Composite, Tempest", "Elemental, Earth (HD 08)",
        -- "Elemental, Earth (HD 12)", "Elemental, Earth (HD 16)", "Elemental, Earth Kin, Sandling",
        -- "Elemental, Fire (HD 08)", "Elemental, Fire (HD 12)", "Elemental, Fire (HD 16)", "Elemental, Fire
        -- Kin, Salamander", "Elemental, Water (HD 08)", "Elemental, Water (HD 12)", "Elemental, Water (HD
        -- 16)", "Elemental, Water Kin, Nereid", "Elemental, Water Kin, Water Weird", "Elemental,Earth Kin,
        -- Pech", "Elemental,Fire Kin, Fire Snake", "Imp, Mephit, Fire", "Imp, Mephit, Ice", "Imp, Mephit,
        -- Lava", "Imp, Mephit, Mist", "Imp, Mephit, Smoke", "Imp, Mephit, Steam"
        ["elemental"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Elemental, Air, Dust Devil"
        ["elemental.air"] = {
        },
    
        -- "Brownie", "Brownie, Killmoulis", "Centaur", "Dryad", "Feyr", "Feyr, Great Feyr", "Leprechaun",
        -- "Nymph", "Sprite", "Sprite, Atomie", "Sprite, Grig", "Sprite, Nixie", "Sprite, Pixie", "Sprite, Sea
        -- Sprite", "Treant"
        ["fey"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Fish, Barracuda (HD 02)", "Fish, Barracuda (HD 03)", "Fish, Barracuda", "Fish, Carp, Giant", "Fish,
        -- Catfish, Giant", "Fish, Dragonfish", "Fish, Eel, Electric", "Fish, Eel, Giant", "Fish, Eel, Marine
        -- (6 HD)", "Fish, Eel, Weed", "Fish, Giant Gar", "Fish, Lamprey", "Fish, Lamprey, Giant", "Fish,
        -- Lamprey, Land", "Fish, Manta Ray", "Fish, Pike, Giant", "Fish, Piranha", "Fish, Piranha, Giant",
        -- "Fish, Pungi Ray", "Fish, Quipper", "Fish, Seahorse, Giant (2HD)", "Fish, Shark (3HD)", "Fish, Shark
        -- (5HD)", "Fish, Shark (8HD)", "Fish, Stingray"
        ["fish"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- 
        ["fungus"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Fungus, Ascomoid", "Fungus, Gas spore", "Fungus, Phycomid", "Fungus, Shrieker", "Fungus, Violet",
        -- "Mold I, Brown", "Mold I, Russet", "Mold I, Yellow"
        ["fungus.mold"] = {
        },
    
        -- "Giant, Cloud", "Giant, Cyclops", "Giant, Cyclops, Cyclopskin", "Giant, Desert", "Giant, Ettin",
        -- "Giant, Firbolg", "Giant, Fire", "Giant, Fog", "Giant, Formorian", "Giant, Frost", "Giant, Hill",
        -- "Giant, Jungle", "Giant, Mountain", "Giant, Reef", "Giant, Stone", "Giant, Storm", "Giant, Verbeeg",
        -- "Giant, Wood", "Ogre Half , Half Ogre", "Ogre Half , Ogrillon", "Troll", "Troll, Desert", "Troll,
        -- Freshwater Scrag", "Troll, Giant", "Troll, Ice", "Troll, Saltwater Scrag", "Troll, Two headed",
        -- "Worm, Giant Bloodworm"
        ["giant"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Golem I Greater Golem , Iron", "Golem I Greater Golem , Stone", "Golem II Lesser Golem , Clay",
        -- "Golem II Lesser Golem , Flesh", "Golem III, Bone", "Golem III, Doll", "Golem IV, Gargoyle", "Golem
        -- IV, Glass", "Golem V, Necrophidius", "Golem V, Scarecrow", "Golem VI Stone Variants , Caryatid
        -- Column", "Golem VI Stone Variants , Juggernaut", "Golem VI Stone Variants , Stone Guardian"
        ["golem"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Dwarf, Derro", "Dwarf, Hill", "Dwarf, Mountain", "Gargantua, Humanoid", "Gnoll", "Gnoll, Flind",
        -- "Grimlock", "Human, Aborigine/Caveman", "Human, Adventurer", "Human, Bandit/Brigand", "Human,
        -- Barbarian", "Human, Berserker/Dervish", "Human, Farmer/Herder", "Human, Gentry", "Human, Knight",
        -- "Human, Mercenary", "Human, Merchant/Trader", "Human, Middle Class", "Human, Peasant/Serf", "Human,
        -- Pilgrim", "Human, Police/Constabulary", "Human, Priest", "Human, Sailor", "Human, Slaver", "Human,
        -- Soldier", "Human, Thief/Thug", "Human, Tradesman/Craftsman", "Human, Tribesman", "Human, Wizard",
        -- "Swanmay", "Yuan-ti (Pureblood)", "Yuan-ti, Histachii"
        ["humanoid"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Aarakocra", "Kenku"
        ["humanoid.avian"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Bugbear"
        ["humanoid.bugbear"] = {
        },
    
        -- "Dwarf, Duergar"
        ["humanoid.dwarf"] = {
        },
    
        -- "Elf", "Elf, Aquatic", "Elf, Drow", "Elf, Drow, Drider"
        ["humanoid.elf"] = {
        },
    
        -- "Merman", "Sahuagin"
        ["humanoid.fish"] = {
        },
    
        -- "Myconid"
        ["humanoid.fungus"] = {
        },
    
        -- "Moldman (Vegepygmy)"
        ["fungus.mold"] = {
        },
    
        -- "Gnome, Forest", "Gnome, Rock", "Gnome, Spriggan", "Gnome, Svirfneblin", "Gnome, Tinker"
        ["humanoid.gnome"] = {
        },
    
        -- "Goblin"
        ["humanoid.goblin"] = {
        },
    
        -- "Halfling, Hairfoot", "Halfling, Stout", "Halfling, Tallfellow"
        ["humanoid.halfling"] = {
        },
    
        -- "Hobgoblin"
        ["humanoid.hobgoblin"] = {
        },
    
        -- "Kobold", "Kobold, Urd"
        ["humanoid.kobold"] = {
        },
    
        -- "Orc", "Orc, Orog"
        ["humanoid.orc"] = {
        },
    
        -- "Kuo-Toa", "Lizard Man", "Lizard Man, Lizard King", "Troglodyte"
        ["humanoid.reptile"] = {
        },
    
        -- "Bullywug"
        ["reptile.bullywug"] = {
        },
    
        -- "Rust Monster"
        ["insect"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Ankheg (HD 03)", "Ankheg (HD 05)", "Ankheg (HD 07)", "Beetle Giant, Bombardier", "Beetle Giant,
        -- Boring", "Beetle Giant, Fire", "Beetle Giant, Rhinoceros", "Beetle Giant, Water", "Beholder and
        -- Beholder kin II, Hive Mother", "Centipede, Giant", "Centipede, Huge", "Centipede, Megalo",
        -- "Centipede, Tunnel Worm", "Gargantua, Insectoid", "Insect, Ant, Giant", "Insect, Aspis, Drone",
        -- "Insect, Aspis, Larva", "Insect, Assassin Bug", "Insect, Bee, Soldier", "Insect, Bee, Worker",
        -- "Insect, Bumblebee", "Insect, Cave Cricket", "Insect, Ear Seeker", "Insect, Firefriend", "Insect,
        -- Fly, Bluebottle", "Insect, Fyrefly", "Insect, Horax", "Insect, Hornet, Giant", "Insect, Pernicon",
        -- "Insect, Praying Mantis", "Insect, Swarm, Grasshopper and Locust", "Insect, Swarm, Velvet Ant",
        -- "Insect, Termite, Giant Harvester, King", "Insect, Termite, Giant Harvester, Queen", "Insect,
        -- Termite, Giant Harvester, Soldier", "Insect, Termite, Giant Harvester, Worker", "Insect, Tick,
        -- Giant", "Insect, Wasp, Giant", "Intellect Devourer, Larva", "Manscorpion", "Scorpion, Giant",
        -- "Scorpion, Huge", "Scorpion, Large", "Spider, Gargantuan", "Spider, Giant", "Spider, Hairy",
        -- "Spider, Huge", "Spider, Large", "Spider, Phase", "Spider, Sword"
        ["insect.bug"] = {
        },
    
        -- "Jackalwere", "Lycanthrope Seawolf, Greater", "Lycanthrope Seawolf, Lesser", "Lycanthrope, Werebat",
        -- "Lycanthrope, Werebear", "Lycanthrope, Wereboar", "Lycanthrope, Werefox", "Lycanthrope, Wererat",
        -- "Lycanthrope, Wereraven", "Lycanthrope, Weretiger", "Lycanthrope, Werewolf"
        ["lycanthrope"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- 
        ["ogre"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Ogre", "Ogre, Merrow", "Ogre, Ogre Mage"
        ["ogre.giant"] = {
        },
    
        -- "Aboleth", "Arcane", "Argos", "Aurumvorax", "Behir", "Beholder and Beholder kin I, Death Kiss",
        -- "Beholder and Beholder kin I, Eye of the Deep", "Beholder and Beholder kin I, Gauth", "Beholder and
        -- Beholder kin II, Director", "Beholder and Beholder kin II, Examiner", "Beholder and Beholder kin II,
        -- Lensman", "Beholder and Beholder kin II, Overseer", "Beholder and Beholder kin II, Watcher",
        -- "Beholder", "Brain Mole", "Broken One, Common", "Broken One, Greater", "Bulette", "Carrion Crawler",
        -- "Chimera", "Chimera, Gorgimera", "Cloaker", "Cockatrice", "Cockatrice, Pyrolisk", "Couatl",
        -- "Crabman", "Crawling Claw", "Deepspawn", "Displacer Beast", "Dolphin", "Doppelganger", "Ettercap",
        -- "Eyewing", "Galeb Duhr (8HD)", "Gargantua, Reptilian", "Gargoyle I, Margoyle", "Gargoyle", "Genie,
        -- Dao", "Genie, Djinni", "Genie, Efreeti", "Genie, Jann", "Genie, Marid", "Gibberling", "Giff",
        -- "Gith", "Githyanki", "Githzerai", "Gloomwing, Moth", "Gloomwing, Tenebrous Worm", "Gorgon", "Grell
        -- Colonial, Patriarch", "Grell Colonial, Philosopher", "Grell Colonial, Worker", "Gremlin", "Gremlin,
        -- Fremlin", "Gremlin, Galltrit", "Gremlin, Jermlaine", "Gremlin, Mite", "Gremlin, Snyad", "Griffon",
        -- "Grippli", "Hag, Annis", "Hag, Green", "Hag, Sea", "Harpy", "Hatori, Greater", "Hatori, Lesser",
        -- "Hell Hound", "Hippocampus", "Hippogriff", "Homunculus", "Hook Horror", "Hydra (Heads 05)", "Hydra
        -- (Heads 07)", "Hydra (Heads 08)", "Hydra (Heads 10)", "Hydra (Heads 12)", "Hydra, Cryohydra (Heads
        -- 05)", "Hydra, Lernaean (Heads 05)", "Hydra, Lernaean (Heads 08)", "Hydra, Pyrohydra (Heads 07)",
        -- "Hydra, Pyrohydra (Heads 08)", "Intellect Devourer, Adult", "Invisible Stalker", "Ixitxachitl",
        -- "Ki-rin", "Kirre", "Lamia", "Lamia, Lamia Noble", "Lammasu, Greater", "Lammasu, Lesser",
        -- "Leucrotta", "Living Wall", "Lurker", "Lurker, Trapper Forest", "Lurker, Trapper", "Manticore",
        -- "Medusa Maedar, Glyptar", "Medusa", "Medusa, Greater Medusa", "Mimic, Common", "Mimic, Killer",
        -- "Mind Flayer", "Minotaur", "Mist, Crimson Death", "Mist, Vampiric", "Mongrelman (HD 01)",
        -- "Mongrelman (HD 02)", "Morkoth", "Muckdweller", "Mudman", "Naga, Dark", "Naga, Guardian", "Naga,
        -- Water", "Neogi", "Neogi, Great Old Master", "Nightmare", "Otyugh", "Otyugh, Neo Otyugh", "Pegasus",
        -- "Peryton", "Phantom", "Phoenix", "Piercer (HD 01)", "Quaggoth", "Rakshasa", "Rakshasa, Greater
        -- Rakshasa", "Remorhaz", "Revenant", "Roc", "Roper", "Satyr", "Satyr, Korred", "Selkie", "Shedu,
        -- Greater", "Shedu, Lesser", "Sirine", "Sphinx, Androsphinx", "Sphinx, Criosphinx", "Sphinx,
        -- Gynosphinx", "Sphinx, Hieracosphinx", "Stirge", "Storoper", "Su-Monster", "Tabaxi", "Tabaxi, Tabaxi
        -- Lord", "Tako, Female Tako", "Tako, Male Tako", "Tarrasque", "Tasloi", "Thought Eater", "Thri-kreen",
        -- "Titan", "Triton", "Umber Hulk", "Umber Hulk, Vodyanoi", "Unicorn", "Urchin, Black", "Urchin,
        -- Green", "Urchin, Land", "Urchin, Red", "Urchin, Silver", "Urchin, Yellow", "Wemic", "Will O'Wisp",
        -- "Worm, Bookworm", "Worm, Purple Worm", "Worm, Rot Grub", "Wraith", "Wyvern", "Xorn", "Xorn, Xaren",
        -- "Yeti", "Yugoloth Guardian, Greater", "Yugoloth Guardian, Least", "Yugoloth Guardian, Lesser"
        ["other"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Plant Dangerous I, Choke Creeper", "Plant Dangerous I, Mantrap", "Plant Dangerous I, Retch Plant",
        -- "Plant Dangerous I, Snappersaw", "Plant Dangerous I, Thornslinger", "Plant Dangerous I, Tri flower
        -- Frond", "Plant Dangerous I, Yellow Musk Creeper", "Plant Dangerous I, Yellow Musk Zombie", "Plant
        -- Intelligent, Hangman Tree", "Plant Intelligent, Kelpie", "Plant Intelligent, Obliviax", "Plant
        -- Intelligent, Quickwood", "Plant Intelligent, Shambling Mound", "Plant Intelligent, Strangleweed",
        -- "Plant Intelligent, Sundew Giant", "Plant Intelligent, Thorny"
        ["plant"] = {
            NPCFlavorData.Flavors.build
        },
    
        -- "Basilisk, Dracolisk", "Basilisk, Greater", "Basilisk, Lesser", "Snake, Amphisbaena", "Snake,
        -- Boalisk", "Snake, Constrictor Giant", "Snake, Constrictor Normal", "Snake, Heway", "Snake, Poison
        -- Giant", "Snake, Poison Normal", "Snake, Sea, Giant", "Snake, Spitting", "Snake, Winged"
        ["reptile"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- 
        ["slime"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- 
        ["slime.ooze"] = {
        },
    
        -- 
        ["ooze.jelly"] = {
        },
    
        -- "Ooze Slime Jelly I, Jelly Stun", "Ooze Slime Jelly I, Mustard Jelly", "Ooze Slime Jelly I, Olive
        -- Slime", "Ooze Slime Jelly II, Crystal Ooze", "Ooze Slime Jelly II, Gelatinous Cube", "Ooze Slime
        -- Jelly II, Gray Ooze", "Ooze Slime Jelly II, Green Slime", "Ooze Slime Jelly II, Ochre Jelly",
        -- "Ooze/Slime/Jelly, Slithering Tracker", "Pudding Deadly, Black", "Pudding Deadly, Brown", "Pudding
        -- Deadly, Dun", "Pudding Deadly, White"
        ["jelly.pudding"] = {
        },
    
        -- 
        ["troll"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Troll, Spectral"
        ["troll.undead"] = {
        },
    
        -- "Banshee", "Beholder and Beholder kin I, Spectator", "Beholder and Beholder kin I, Undead", "Crypt
        -- Thing", "Death Knight", "Demi-Lich", "Dracolich ** GENERAL **", "Ghost", "Ghoul", "Ghoul, Ghast",
        -- "Ghoul, Lacedon", "Haunt", "Heucuva", "Lich (Mage 11)", "Mummy", "Mummy, Greater", "Naga, Spirit",
        -- "Poltergeist", "Shadow", "Skeleton", "Skeleton, Animal", "Skeleton, Giant", "Skeleton, Monster",
        -- "Skeleton, Warrior", "Spectre", "Wight", "Zombie, Common", "Zombie, Ju ju", "Zombie, Lord", "Zombie,
        -- Monster", "Zombie, Sea"
        ["undead"] = {
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
        -- "Vampire"
        ["undead.vampire"] = {
            NPCFlavorData.Flavors.clothing,
            NPCFlavorData.Flavors.bodyparts,
            NPCFlavorData.Flavors.hair,
            NPCFlavorData.Flavors.build,
            NPCFlavorData.Flavors.behavior
        },
    
    }
end