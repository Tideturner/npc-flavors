local constructPCS = {
    {prefix = { 100 }},
    {color = { 15 }},
    {suffix = { 100 }}
};
local constructPS = {
    {prefix = { 100, 30 }},
    {suffix = { 100 }}
};
local constructPS2 = {
    {prefix = { 30 }},
    {suffix = { 100 }}
};

local tColors = {
    "red", "orange", "yellow", "green", "blue", "indigo", "violet", "purple", "magenta",
    "cyan", "pink", "brown", "white", "gray", "black"
};

Flavors = {
    ["clothing"] = {
        -- TODO: Find out why color is applied befoe prefix!
        construct = constructPCS,
        prefix = {
            "ripped", "torn", "dirty", "bright", "new", "tattered", "elegant", "loud", "shiny", "broken",
            "ugly", "beautiful"
        },
        color = tColors,
        suffix = {
            "bandanna", "hat", "scarf", "shirt", "cape", "cravat", "robe", "cloak", "doublet", "jacket",
            "coat", "jerkin", "eye patch", "trousers", "sash", "turban", "beret", "cap", "helmet", "top hat",
            "oilskin", "greatcoat", "vest", "breeches"
        }
    },
    ["bodyparts"] = {
        construct = constructPCS,
        prefix = {
            "dirty", "filthy", "clean", "broken", "wounded", "mangled", "calloused",
            "big", "small", "long", "short", "stubby", "dazzling", "enormous", "miniscule",
            "tattooed", "painted", "pierced", "swollen", "shrunken", "ugly", "beautiful",
            "missing", "withered", "rotten", "scarred"
        },
        color = tColors,
        suffix = {
            "leg", "left leg", "right leg", "legs",
            "arm", "left arm", "right arm", "arms",
            "finger", "fingers", "middle finger", "thumb", "thumbs",
            "knee", "left knee", "right knee", "knees",
            "shoulder", "left shoulder", "right shoulder", "shoulders",
            "ear", "left ear", "right ear", "ears",
            "eye", "left eye", "right eye", "eyes",
            "tooth", "teeth",
            "torso", "head", "nose"
        }
    },
    ["hair"] = {
        construct = constructPCS,
        prefix = {
            "curly", "long", "short", "blonde", "dirty", "filthy", "clean",
            "stubby", "dazzling", "enormous", "miniscule", "ugly", "beautiful", "withered"
        },
        color = tColors,
        suffix = { "hair", "moustache", "beard" }
    },
    ["build"] = {
        construct = constructPS2,
        prefix = {
            "strangely", "unusually", "very", "obscenely", "noticably"
        },
        color = tColors,
        suffix = { "tall", "short", "fat", "thin", "bald", "hairy" }
    },
    ["behavior"] = {
        construct = constructPS,
        prefix = {
            "accepting", "accommodating", "accusatory", "aggressive", "agitated", "alarmed", "amazed", "amused",
            "antagonistic", "anxious", "apathetic", "apprehensive", "arrogant", "astonished", "astounded", "attentive",
            "aweful",
            "bitter", "blase", "bold", "bothered", "brave",
            "calm", "callous", "capable", "casual", "caustic", "charming", "cheerful", "cheery", "churlish", "choleric", "collected", "comfortable",
            "competitive", "composed", "compulsive", "concerned", "condescending", "confident", "conflicted", "conscientious", "conservative",
            "considerate", "conspicuous", "contemplative", "contemptible", "contemptuous", "conventional", "convivial", "cool", "courageous",
            "covetous", "creative", "critical", "curious", "cynical",
            "dazzling", "debilitating", "defensive", "dejected", "delighted", "demeaning", "depressed", "derisive", "destructive", "devious", "devoted",
            "dictatorial", "didactic", "diffident", "disdainful", "distracted", "distraught", "distressed", "downcast",
            "earnest", "edgy", "elated", "empathetic", "enthusiastic", "erudite", "euphoric", "exhausted", "expectant", "explosive", "exuberant",
            "fanciful", "ferocious", "fierce", "flabbergasted", "flexible", "focused", "forgiving", "forlorn", "forthright", "frightened", "furtive",
            "gloomy", "good", "grateful", "grouchy", "guilty",
            "happy", "harassing", "haughty", "heroic", "hesitant", "hopeful", "hostile", "humble", "humorous", "hysterical",
            "idealistic", "ignorant", "ill-tempered", "impartial", "impolite", "imprudent", "indifferent", "indignant", "infuriating", "insightful",
            "insulting", "intense", "intimate", "intimidating", "intolerant", "irascible",
            "jealous", "jolly", "jovial", "joyful", "jubilant", "judgmental", "jumpy",
            "kind",
            "languid", "liberal", "loving", "loyal", "lyrical",
            "magical", "magnificent", "malevolent", "malicious", "mocking", "morose", "mysterious",
            "needy", "negative", "neglected", "nerveous", "nervy",
            "objective", "opinionated", "optimistic", "obsequious",
            "panicky", "passionate", "patient", "patronizing", "perturbed", "pessimistic", "petrified", "petulant", "placid", "pleased", "powerful",
            "prejudicial", "prideful",
            "quarrelsome", "queasy", "quivering", "quizzical",
            "rancorous", "rational", "reasonable", "reckless", "reflective", "remorseful", "repugnant", "resilient", "resolute",
            "resourceful", "respectful", "responsible", "responsive", "restorative", "reverent", "ribald", "ridiculing", "rude", "ruthless",
            "sad", "safe", "sanguineous", "sarcastic", "sardonic", "satiric", "scared", "scornful", "seething", "selfish", "sensible",
            "sensitive", "serene", "shaky", "shivering", "shocked", "sickly", "simple", "sincere", "sober", "solemn", "somber", "sour",
            "speechless", "spooked", "stern", "successful", "sullen", "superior", "supportive", "surly", "suspicious", "sweet", "sympathetic",
            "tactful", "tenacious", "tense", "terrific", "testy", "thoughtful", "thoughtless", "timorous", "tolerant", "tranquil",
            "treacherous", "trembling", "truthful",
            "uncivil", "uncouth", "uneasy", "unethical", "unfair", "unique", "unmannerly", "unnerved", "unrefined", "unruffled",
            "unsavory", "unworthy", "uplifting", "upset", "uptight",
            "vicious", "vigilant", "vigorous", "vile", "villainous", "virtuous", "vivacious", "volatile", "vulnerable",
            "warm", "wary", "waspish", "weak", "welcoming", "wicked", "wild", "whimsical", "wise", "wishy-washy", "wistful", "witty",
            "woeful", "wonderful", "worrying", "worthy",
            "youthful",
            "zany", "zealous"
        },
        suffix = {
            "laughter", "smile", "frown", "grin", "attitude", "scream", "lisp",
            "gait", "jaunt", "saunter", "stride", "footwork", "legwork", "stroll", "walk"
        }
    },
    ["fur"] = {
        construct = { {prefix = { 100, 30 }}, {suffix = { 100 }} },
        prefix = {
            "dirty", "filthy", "clean", "mangled", "long", "short", "stubby", "dazzling", "enormous", "miniscule",
            "painted", "ugly", "beautiful", "missing", "withered",
            "smelly", "stinky", "malodorous", "pungent", "fetid", "acrid", "noxious", "rank", "musty", "pongy", "whiffy",
            "flea bitten", "flea infested", "lousy", "lice ridden", "mangy", "matted", "groomed", "tangled", "braided", "knotted"
        },
        color = tColors,
        suffix = {
            "fur", "hide", "mane", "mop", "shock", "bristles", "locks", "fuzz", "thatch", "wool", "pelt"
        }
    }
}

FlavorsByType = {
    ["humanoid"] = {
        Flavors.clothing,
        Flavors.bodyparts,
        Flavors.hair,
        Flavors.build,
        Flavors.behavior
    },
    ["humanoid.gnoll"] = {
        Flavors.bodyparts,
        Flavors.fur,
        Flavors.behavior
    },
    ["humanoid.human.shapechanger"] = {
        Flavors.clothing,
        Flavors.bodyparts,
        Flavors.fur,
        Flavors.behavior
    }
}