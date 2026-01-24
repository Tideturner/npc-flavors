-- Behavioral Traits Word Library
-- Contains movements, sounds, and attitudes

Data = {
    movements = {
        general = {
            "limping", "shuffling", "prowling", "slithering", "stalking",
            "striding", "marching", "creeping", "skulking", "pacing",
            "hobbling", "stumbling", "staggering", "swaying", "tottering",
            "lumbering", "plodding", "trudging", "slogging", "shambling",
            "scuttling", "scurrying", "darting", "dashing", "sprinting",
            "sneaking", "creeping", "tiptoeing", "slinking", "stealing",
            "circling", "flanking", "weaving", "zigzagging", "dodging",
            "charging", "rushing", "lunging", "leaping", "pouncing",
            "crawling", "wriggling", "squirming", "writhing", "slithering",
            "gliding", "sliding", "skating", "coasting", "drifting"
        },
        undead = {
            "lurching", "crawling", "staggering", "shambling", "dragging",
            "stumbling", "hobbling", "limping", "tottering", "swaying",
            "shuffling", "shambling", "plodding", "trudging", "lumbering",
            "creeping", "crawling", "slithering", "dragging limbs",
            "trailing entrails", "jerking", "twitching", "spasming",
            "convulsing", "shuddering", "rising", "emerging", "clawing up",
            "pulling itself forward", "dragging itself"
        },
        
        incorporeal = {
            "drifting", "floating", "gliding", "hovering", "phasing",
            "materializing", "fading", "flickering", "wavering", "manifesting",
            "vanishing", "appearing", "dissolving", "coalescing"
        },
        beast = {
            "loping", "bounding", "scampering", "galloping", "trotting",
            "prowling", "stalking", "hunting", "tracking", "pursuing",
            "pouncing", "leaping", "springing", "jumping", "vaulting",
            "charging", "stampeding", "thundering", "barreling", "rushing",
            "slinking", "skulking", "creeping", "sneaking", "padding",
            "scurrying", "scuttling", "darting", "dashing", "racing",
            "climbing", "scaling", "clambering", "scrambling", "ascending",
            "swimming", "wading", "splashing", "diving", "surfacing",
            "flying", "soaring", "gliding", "swooping", "diving", "digging",
            "burrowing", "tunneling", "excavating", "rooting"
        },
        elemental = {
            "floating", "swirling", "flowing", "drifting", "surging",
            "billowing", "roiling", "churning", "spiraling", "spinning",
            "cascading", "streaming", "pouring", "rushing", "flooding",
            "wafting", "drifting", "hovering", "levitating", "suspended",
            "blazing", "flaring", "flickering", "dancing", "leaping",
            "rippling", "undulating", "wavelike", "pulsing", "throbbing",
            "crackling", "sparking", "arcing", "flashing", "strobing",
            "shifting", "morphing", "transforming", "changing", "phasing"
        }
    },
    sounds = {
        general = {
            "growling", "hissing", "snarling", "muttering", "grunting",
            "wheezing", "chattering", "roaring", "bellowing", "moaning",
            "groaning", "wailing", "screaming", "shrieking", "crying",
            "sobbing", "whimpering", "whining", "keening", "laughing",
            "cackling", "giggling", "chuckling", "snickering", "shouting",
            "yelling", "hollering", "calling", "exclaiming", "rasping",
            "croaking", "rattling", "gasping", "panting", "snorting",
            "sniffing", "snuffling", "snuffing", "huffing", "spitting",
            "hocking", "coughing", "hacking", "retching", "slurping",
            "slobbering", "drooling", "salivating", "frothing"
        },
        beast = {
            "cackling", "howling", "yipping", "barking", "purring",
            "chirping", "roaring", "bellowing", "trumpeting", "bugling",
            "bleating", "braying", "neighing", "whinnying", "snorting",
            "nickering", "growling", "snarling", "snapping", "yapping",
            "yelping", "mewing", "meowing", "yowling", "caterwauling",
            "screeching", "hooting", "cooing", "warbling", "trilling",
            "singing", "squawking", "cawing", "croaking", "quacking",
            "honking", "hissing", "spitting", "rattling", "buzzing",
            "humming", "chattering", "chittering", "squeaking", "squealing",
            "piping", "grunting", "snuffling", "rooting", "chuffing",
            "woofing"
        },
        construct = {
            "grinding", "whirring", "clanking", "humming", "clicking",
            "buzzing", "clanging", "banging", "crashing", "smashing",
            "pounding", "ticking", "tocking", "chiming", "ringing",
            "tolling", "hissing", "steaming", "venting", "exhausting",
            "pressurizing", "squeaking", "squealing", "screeching",
            "shrieking", "screaming", "rattling", "clattering", "jangling",
            "tinkling", "chinking", "creaking", "groaning", "straining",
            "stressing", "warping", "scraping", "scratching", "grating",
            "rasping", "grinding", "booming", "rumbling", "thundering",
            "reverberating", "echoing", "sputtering", "coughing",
            "backfiring", "misfiring", "failing"
        },
        monstrous = {
            "screeching", "shrieking", "chittering", "gurgling", "bubbling",
            "wailing", "keening", "ululating", "howling", "screaming",
            "clicking", "clacking", "rattling", "chattering", "gnashing",
            "hissing", "spitting", "spraying", "spewing", "ejecting",
            "slurping", "sucking", "siphoning", "draining", "feeding",
            "squelching", "squishing", "plopping", "splatting", "splurting",
            "buzzing", "droning", "thrumming", "vibrating", "resonating",
            "croaking", "belching", "retching", "vomiting", "regurgitating",
            "grinding", "scraping", "rasping", "sawing", "cutting",
            "moaning", "groaning", "sighing", "breathing", "panting"
        },
        
        elemental = {
            "crackling", "rumbling", "whooshing", "roaring", "hissing",
            "sizzling", "bubbling", "boiling", "steaming", "whistling",
            "rushing", "surging", "crashing", "thundering", "echoing"
        },
        
        celestial = {
            "chanting", "hymning", "singing", "harmonizing", "intoning",
            "proclaiming", "declaring", "pronouncing", "resonating"
        },
        
        fiend = {
            "cackling", "laughing", "giggling", "snickering", "chuckling",
            "hissing", "snarling", "growling", "whispering", "murmuring",
            "taunting", "mocking", "jeering"
        }
    },
    attitudes = {
        general = {
            "aggressive", "cautious", "frenzied", "calculating", "feral",
            "menacing", "wary", "bold", "timid", "hostile", "defensive",
            "savage", "cunning", "brutal", "cowardly", "confident",
            "fearless", "brave", "courageous", "valiant", "heroic",
            "terrified", "frightened", "scared", "panicked", "alarmed",
            "angry", "enraged", "furious", "livid", "wrathful", "calm",
            "composed", "collected", "cool", "levelheaded", "nervous",
            "anxious", "worried", "concerned", "apprehensive", "determined",
            "resolute", "steadfast", "unwavering", "firm", "reckless",
            "careless", "heedless", "thoughtless", "impulsive", "patient",
            "methodical", "deliberate", "careful", "meticulous", "arrogant",
            "haughty", "proud", "conceited", "vain", "humble", "modest",
            "unassuming", "meek", "submissive", "playful", "mischievous",
            "impish", "prankish", "roguish", "serious", "stern", "grave",
            "solemn", "grim", "friendly", "amicable", "cordial", "affable",
            "genial", "suspicious", "distrustful", "skeptical", "doubtful",
            "wary"
        },
        celestial = {
            "serene", "righteous", "judgmental", "merciful", "vigilant",
            "benevolent", "compassionate", "kind", "gentle", "loving",
            "forgiving", "understanding", "patient", "tolerant",
            "accepting", "protective", "guardian", "watchful", "attentive",
            "caring", "just", "fair", "impartial", "equitable", "balanced",
            "peaceful", "tranquil", "calm", "placid", "harmonious", "noble",
            "virtuous", "honorable", "upright", "righteous", "inspiring",
            "uplifting", "encouraging", "motivating", "empowering",
            "radiant", "luminous", "brilliant", "glorious", "magnificent"
        },
        fiend = {
            "cruel", "sadistic", "treacherous", "malicious", "devious",
            "evil", "wicked", "vile", "sinister", "malevolent", "hateful",
            "spiteful", "vengeful", "vindictive", "resentful", "deceitful",
            "lying", "dishonest", "duplicitous", "false", "manipulative",
            "scheming", "plotting", "conniving", "calculating", "ruthless",
            "merciless", "pitiless", "heartless", "cold", "tormenting",
            "torturous", "agonizing", "punishing", "afflicting",
            "corrupting", "tainting", "defiling", "polluting", "poisoning",
            "dominating", "controlling", "oppressive", "tyrannical",
            "despotic", "mocking", "taunting", "jeering", "scornful",
            "contemptuous"
        },
        
        undead = {
            "mindless", "relentless", "tireless", "unceasing", "driven",
            "hunger-driven", "obsessed", "fixated", "vengeful", "hateful",
            "hollow", "empty", "vacant", "soulless", "detached"
        }
    },
    expressions = {
        general = {
            "chortle", "chuckle", "demeanor", "frown", "gait", "giggle",
            "grin", "guffaw", "howl", "jaunt", "laughter", "lisp",
            "saunter", "scream", "smile", "stride", "stroll",
            "titter", "voice", "walk", "footwork", "legwork"
        }
    }
}
