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
local constructSOLO = {
    {solo = { 100 }}
};

local tColors = {
     "alabaster", "amber", "aqua", "azure", "baby blue", "beige", "black", "blue", "brown", "burgundy", "burnt sienna",
     "charcoal", "chartreuse", "cream", "crimson", "cyan", "ebony", "fuchsia", "gray", "green", "indigo", "khaki", "lavender",
     "lilac", "lime green", "magenta", "maroon", "mauve", "nude-colored", "olive drab", "orange", "pale blue", "pastel",
     "peach", "periwinkle", "pink", "purple", "red", "taupe", "turquoise", "violet", "white", "yellow"
};

local tFurAndHair = {
     "acrid", "ash-blond", "auburn", "bald", "balding", "beautiful", "black", "bleach blond", "bleached", "blond", "blonde",
     "blown dry", "bouncy", "bound", "braided", "brassy", "bristly", "brittle", "brown", "brunett", "brunette", "brushed",
     "brushed back", "bushy", "buzzed", "cascading", "chestnut-brown", "chopped", "choppy", "clean", "clipped", "close-cropped",
     "coarse", "coiffed", "coiled", "colored", "combed", "conditioned", "copper", "crew cut", "crimped", "cropped", "curled",
     "curly", "damaged", "damp", "dandruffy", "dangling", "dappled", "dark", "dazzling", "dirty", "dirty blond", "disheveled",
     "downy", "dramatic", "draping", "dreaded", "dried out", "drifting", "drooping", "dry", "dyed", "enormous", "fashionable",
     "feather", "feathered", "fetid", "filthy", "fine", "flat", "flaxen", "flea-infested", "flea bitten", "flea infested",
     "flowing", "fluffed", "fluffy", "fluttering", "flyaway", "fragrant", "freshly washed", "fresh smelling", "fried", "frizzy",
     "frosted", "glossy", "golden-blond", "gorgeous", "gray", "graying", "greasy", "groomed", "hairless", "hairy", "half-dried",
     "healthy looking", "highlighted", "honey-blond", "honey-colored", "jet-black", "kinked", "knotted", "lackluster",
     "layered", "lice ridden", "light-reflecting", "limp", "long", "long-haired", "loose", "lousy", "lovely", "luminous",
     "luscious", "lush", "lustrous", "luxurious", "malodorous", "mangled", "mangy", "matted", "medium-length", "messy",
     "meticulously trimmed", "miniscule", "missing", "multi-dimensional", "musty", "nappy", "natural", "neat", "nourished",
     "noxious", "oily", "over-processed", "overgrown", "painted", "parted", "permed", "peroxide blond", "pinned",
     "platinum blond", "pongy", "precise", "prismatic", "pulled back", "pungent", "punk", "rank", "ratted", "raven",
     "raven black", "receding", "red", "reflective", "relaxed", "rich", "ruffled", "salt-and-pepper", "satin-soft", "satiny",
     "scraggly", "sexy", "shaggy", "shaved", "shiny", "short", "shoulder-length", "silken", "silky", "silver", "sleek", "slick",
     "slicked down", "smelly", "smooth", "snagged", "snarled", "soaking wet", "soft", "soft-to-touch", "spiked", "spiky",
     "spiraled", "springy", "stiff", "stinky", "straight", "straightened", "strawberry-blond", "streaked", "stubbly", "stubby",
     "styled", "stylish", "sun-kissed", "sun-streaked", "supple", "swept", "swept-back", "tamed", "tangled", "teased",
     "temperamental", "thick", "thin", "thinning", "tidy", "tinted", "touchable", "tousled", "trailing", "treated", "trimmed",
     "twisted", "ugly", "unbound", "uncombed", "unkempt", "unmanageable", "unruly", "unstyled", "untidy", "velvety",
     "waist-length", "waved", "wavy", "waxy", "well-groomed", "wet", "whiffy", "white", "wind-blown", "windblown", "wispy",
     "withered", "wooly", "woven"
}

Flavors = {
    ["clothing"] = {
        -- TODO: Find out why color is applied befoe prefix!
        construct = constructPCS,
        prefix = {
             "Flamboyant", "abrassive", "adjustable", "adorable", "affordable", "anatomic", "anatomically designed",
             "asymmetrical", "atrocious", "avant garde", "baggy", "banded", "beaded", "beautiful", "bold", "bright", "broken",
             "busty", "button-down", "buttoned", "canvas", "casual", "cheap", "cheery", "chic", "clashing", "classic",
             "collared", "colored", "colorful", "comfortable", "comfortble-looking", "comfy", "conservative", "contemporary",
             "cool", "cotton", "couture", "crisp", "cross-stitched", "crude", "cushioned", "custom", "cute", "cutting-edge",
             "dainty", "damaged", "dapper", "decorative", "delicate", "demi", "dependable", "designer", "detailed", "dirty",
             "dramatic", "drapey", "durable", "dynamite", "edgy", "efficient", "elegant", "embellished", "embroidered",
             "ergonomic", "everyday", "exceptional", "exciting", "exotic", "exquisite", "extra large", "fabric-lined",
             "fabulous", "fancy", "fashionable", "faux", "feminine", "figure-friendly", "filthy", "finely detailed", "fitted",
             "flannel", "flattering", "flax", "flexible", "flirty", "floaty", "flouncy", "form-fitting", "formal",
             "full-grain leather", "fully lined", "funky", "gathered", "geometric", "glamorous", "graceful", "gypsy",
             "hand-sewn", "hand-washed", "handsome", "heavy", "high-performance", "high-waisted", "hot", "ill-fitting",
             "ill-made", "imported", "inadequate", "individualist", "innovative", "intricate", "irregular", "itch-free",
             "itchy", "jagged", "kids", "knee length", "knit", "knockout", "lace", "lacy", "lapel", "large", "layered",
             "leather", "lightweight", "line-free", "lined", "loose", "loose-fitting", "loud", "mangled", "marred", "masculine",
             "mediocre", "medium", "metallic", "mini", "minimalist", "misproportioned", "misshapen", "modern", "modest",
             "mohair", "moist", "moldy", "moleskin", "must-have", "nasty", "new", "odor-absorbing", "odor-resistant",
             "old-fashioned", "opaque", "open-backed", "organic", "outdated", "oversized", "patchwork", "pathetic", "patterned",
             "peasant", "petite", "pieced", "pleated", "plunging", "plush", "plus size", "polished", "poor fitting",
             "poor quality", "practical", "pragmatic", "premium", "preppy", "pressed", "pretty", "professional", "protective",
             "puckering", "pull-on", "pushup", "quilted", "racerback", "racy", "raggedy", "refined", "reflective", "reinforced",
             "relaxed", "reliable", "remodeled", "retro", "revealing", "reworked", "ribbed", "rigid", "ripped", "ripstop",
             "romantic", "ruched", "rugged", "run-of-the-mill", "sassy", "satin", "savvy", "scratching", "scruffy",
             "second-rate", "see-through", "semi-formal", "sensational", "sexy", "shabby", "shaping", "sheer", "shiny",
             "shoddy", "short", "show-stopping", "silk", "silky", "silky soft", "simple", "skanky", "skimpy", "skinny",
             "skinny-fit", "sleek", "slimming", "slinky", "slip-on", "slouched", "slouchy", "small", "smelly", "smooth", "snug",
             "soft", "solid", "sophisticated", "spiritual", "sporty", "standard", "standard-fit", "state-of-the-art",
             "stitched", "straight", "strapless", "strappy", "stretchy", "stunning", "stylish", "substandard", "suede",
             "superior", "supersoft", "supple", "supportive", "symmetrical", "tailored", "tasteful", "tattered", "tearing",
             "textured", "thin fabriced", "tight", "timeless", "too narrow", "too wide", "top-grain leather", "top-of-the-line",
             "torn", "translucent", "trendsetting", "trendy", "true-to-size", "tunic length", "tweed", "ugly", "uncomfortable",
             "unfashionable", "unflattering", "unique", "unravelling", "upstyle", "velour", "velvet", "versatile", "vintage",
             "voloptuous", "voluminous", "waist-slimming", "water-resistant", "waterproof", "wear-anywhere", "whimsical",
             "worn", "worthless", "wrinkled", "yarn-dyed", "zip-up", "zippered"
        },
        color = tColors,
        suffix = {
             "bandanna", "beret", "blazer", "blouse", "bra", "breeches", "cap", "cape", "cardigan", "chaps", "cloak", "coat",
             "codpiece", "corset", "cravat", "doublet", "dress", "dress shirt", "eye patch", "gloves", "gown", "greatcoat",
             "hat", "helmet", "jacket", "jerkin", "jockstrap", "leggings", "leotard", "oilskin", "outerwear", "overcoat",
             "pajamas", "panties", "pants", "robe", "sash", "scarf", "shirt", "shoes", "shorts", "skirt", "slacks", "socks",
             "stockings", "suit", "suspenders", "sweater", "tie", "tights", "top", "top hat", "trousers", "tunic", "turban",
             "undershirt", "underwear", "undies", "v-neck", "vest"
        }
    },
    ["bodyparts"] = {
        construct = constructPCS,
        prefix = {
             "beautiful", "big", "broken", "calloused", "clean", "dazzling", "dirty", "enormous", "filthy", "infected", "long",
             "mangled", "miniscule", "missing", "painted", "pierced", "rotten", "scarred", "short", "shrunken", "small",
             "smelly", "stubby", "swollen", "tattooed", "ugly", "withered", "wounded"
        },
        color = tColors,
        suffix = {
             "arm", "arms", "ear", "ears", "eye", "eyes", "finger", "fingers", "head", "knee", "knees", "left arm", "left ear",
             "left eye", "left knee", "left leg", "left shoulder", "leg", "legs", "middle finger", "nose", "right arm",
             "right ear", "right eye", "right knee", "right leg", "right shoulder", "shoulder", "shoulders", "teeth", "thumb",
             "thumbs", "tooth", "torso"
        }
    },
    ["hair"] = {
        construct = constructPCS,
        prefix = tFurAndHair,
        color = tColors,
        suffix = {
             "anchor beard", "beard", "bristles", "burnsides", "chin curtain", "chinstrap beard", "chin whiskers", "chops",
             "crumb catcher", "eyebrows", "facial hair", "full beard", "goatee", "hair", "handlebar mustache",
             "horseshoe moustache", "jawline beard", "lip hair", "locks", "moustache", "moustache ends", "moustache points",
             "muttonchops", "nose bristles", "pencil moustache", "side burns", "soul patch", "spade beard", "tuff scruff",
             "tuft", "walrus moustache", "whiskers"
        }
    },
    ["build"] = {
        construct = constructPS2,
        prefix = {
             "attractively", "noticably", "obscenely", "oddly", "pleasently", "shockingly", "strangely", "unusually", "very"
        },
        color = tColors,
        suffix = {
             "bald", "fat", "hairy", "short", "tall", "thin"
        }
    },
    ["behavior"] = {
        construct = constructPS,
        prefix = {
             "abominable", "abusive", "accepting", "accommodating", "accusatory", "adulterous", "aggressive", "agitated",
             "agonizing", "alarmed", "alcoholic", "amazed", "amused", "angry", "annoying", "antagonistic", "anxious",
             "apathetic", "apologetic", "apprehensive", "argumentative", "arrogant", "ashamed", "astonished", "astounded",
             "at fault", "atrocious", "attentive", "aweful", "awful", "backstabbing", "bad", "bat-shit crazy", "begging",
             "beyond reproach", "bitchy", "bitter", "blameworthy", "blase", "bold", "boring", "bothered", "brainless", "brave",
             "brokenhearted", "calculating", "callous", "calm", "capable", "careless", "casual", "caught", "caught-in-the-act",
             "caught red-handed", "caustic", "charming", "chauvinistic", "cheap", "cheating", "cheerful", "cheery", "childish",
             "choleric", "churlish", "cold", "cold-hearted", "collected", "comfortable", "common", "competitive", "complicated",
             "composed", "compulsive", "concerned", "condescending", "confident", "conflicted", "confrontational", "conniving",
             "conscientious", "conservative", "considerate", "conspicuous", "contemplative", "contemptible", "contemptuous",
             "controlling", "conventional", "convivial", "cool", "corrupt", "courageous", "covetous", "cowardly", "crappy",
             "crazed", "crazy", "creative", "creepy", "crestfallen", "criminal", "critical", "cruel", "cruel-hearted", "crummy",
             "crushed", "crushing", "curious", "cursed", "cynical", "dazzling", "debilitating", "deceitful", "deceiving",
             "dedicated", "defensive", "dejected", "delighted", "demeaning", "deplorable", "depressed", "depressing",
             "derisive", "despairing", "destructive", "devious", "devoted", "dickish", "dictatorial", "didactic", "diffident",
             "dimwitted", "dirty", "disappointing", "disdainful", "disgraced", "disgraceful", "disgusting", "dishonest",
             "distracted", "distraught", "distressed", "disturbed", "disturbing", "double-crossing", "downcast", "drunk",
             "dull", "dumb", "earnest", "eccentric", "edgy", "egotistical", "elated", "embarrassed", "embarrassing",
             "embittered", "emotional", "empathetic", "empty", "enthusiastic", "erudite", "euphoric", "evil", "exhausted",
             "expectant", "exploiting", "explosive", "exuberant", "f'ed up", "fake", "false", "fanciful", "fat", "ferocious",
             "fierce", "flabbergasted", "flawed", "flexible", "focused", "foolish", "forgetful", "forgiving", "forlorn",
             "forthright", "freak", "freeloading", "friendless", "frightened", "fugly", "full of rage", "furious", "furtive",
             "gloomy", "gold-digging", "good", "gossipy", "grateful", "greedy", "gross", "grouchy", "guilt-ridden", "guilty",
             "halfwitted", "happy", "harassing", "harmful", "hateful", "haughty", "heartbreaking", "heartbroken", "heartsick",
             "heartsore", "heavyhearted", "heinous", "hellish", "heroic", "hesitant", "hideous", "hopeful", "horrible",
             "hostile", "humble", "humbled", "humiliated", "humiliating", "humorous", "hurtful", "hurting", "hysterical",
             "idealistic", "idiotic", "ignorant", "ill-tempered", "immature", "immoral", "impartial", "impatient", "impolite",
             "imprudent", "impulsive", "inadequate", "inappropriate", "in denial", "indifferent", "indignant", "inexcusable",
             "infuriated", "infuriating", "insane", "insecure", "insensitive", "insightful", "insincere", "insulting",
             "intense", "in the wrong", "intimate", "intimidating", "intolerant", "irascible", "irate", "irrational",
             "irresponsible", "irritating", "jealous", "jolly", "jovial", "joyful", "jubilant", "judgmental", "jumpy", "kind",
             "lame", "languid", "lazy", "liberal", "livid", "loose", "lost", "lousy", "loving", "low", "lowlife", "loyal",
             "lying", "lyrical", "mad", "magical", "magnificent", "malevolent", "malicious", "maniacal", "manipulating",
             "manipulative", "mean", "mental", "miserable", "misguided", "mistaken", "mocking", "moody", "moronic", "morose",
             "mournful", "mysterious", "narrow-minded", "nasty", "naughty", "nauseated", "nauseating", "needy", "negative",
             "neglected", "nerveous", "nervy", "no-good", "not perfect", "objective", "obnoxious", "obsequious", "offensive",
             "opinionated", "optimistic", "out-of-control", "out-of-line", "outraged", "painful", "panicky", "passionate",
             "pathetic", "patient", "patronizing", "pea-brained", "perturbed", "pessimistic", "petrified", "petulant", "pissed",
             "pissed off", "placid", "pleased", "pointless", "powerful", "prejudicial", "prideful", "promiscuous", "psycho",
             "pushy", "quarrelsome", "queasy", "quivering", "quizzical", "rabid", "racist", "rancorous", "rational",
             "reasonable", "reckless", "reflective", "regretful", "remorseful", "reprehensible", "repugnant", "repulsive",
             "resentful", "resilient", "resolute", "resourceful", "respectful", "responsible", "responsive", "restorative",
             "reverent", "ribald", "ridiculing", "ridiculous", "rotten", "rude", "ruthless", "sad", "saddened", "sadistic",
             "safe", "sanguineous", "sarcastic", "sardonic", "satiric", "scared", "scornful", "screwed-up", "seething",
             "self-absorbed", "self-centered", "self-consumed", "self-entitled", "self-inflated", "self-loathing", "selfish",
             "sensible", "sensitive", "serene", "shady", "shaky", "shallow", "shameful", "shameless", "shitty", "shivering",
             "shocked", "sick", "sickened", "sickly", "silly", "simple", "sincere", "sleazy", "sleepless", "slutty", "smelly",
             "smutty", "sneaky", "sober", "solemn", "somber", "sorrowful", "sorry", "sour", "speechless", "spiteful", "spoiled",
             "spooked", "stealing", "stern", "stinky", "stupid", "successful", "sullen", "superficial", "superior",
             "supportive", "surly", "suspicious", "sweet", "swindling", "sympathetic", "tactful", "tasteless", "tearful",
             "tenacious", "tense", "terrible", "terrific", "territorial", "testy", "thick", "thieving", "thoughtful",
             "thoughtless", "ticked off", "timorous", "tiny-dick", "tolerant", "tranquil", "trashy", "treacherous", "trembling",
             "troubled", "truthful", "twisted", "two-dimensional", "two-faced", "ugly", "unacceptable", "unapologetic",
             "uncivil", "uncouth", "undependable", "underhanded", "uneasy", "unethical", "unfair", "unfaithful", "unforgiving",
             "ungrateful", "unhappy", "unique", "unjustifiable", "unlovable", "unmannerly", "unnerved", "unrefined",
             "unreliable", "unruffled", "unsavory", "unthoughtful", "untrue", "untruthful", "unworthy", "uplifting", "upset",
             "uptight", "useless", "vacuous", "vengeful", "verbally abusive", "vicious", "vigilant", "vigorous", "vile",
             "villainous", "vindictive", "violent", "virtuous", "vivacious", "volatile", "vulnerable", "warm", "wary",
             "waspish", "weak", "weird", "welcoming", "whimsical", "whiny", "white trash", "wicked", "wild", "wise",
             "wishy-washy", "wistful", "witless", "witty", "woeful", "wonderful", "worrying", "worthless", "worthy",
             "wrapped up in yourself", "wretched", "wrong", "youthful", "zany", "zealous"
        },
        suffix = {
             "attitude", "chort", "chuckle", "demeanor", "footwork", "frown", "gait", "giggle", "grin", "guffaw", "howl",
             "jaunt", "laughter", "legwork", "lisp", "saunter", "scream", "smile", "snigger", "stride", "stroll", "titter",
             "voice", "walk"
        }
    },
    ["fur"] = {
        construct = constructPS,
        prefix = tFurAndHair,
        color = tColors,
        suffix = {
             "bristles", "fur", "fuzz", "hide", "locks", "mane", "mop", "pelt", "shock", "thatch", "wool"
        }
    },
    ["characteristic"] = {
        construct = constructSOLO,
        solo = {
             "big ears", "big nose", "bloodshot eyes", "broken nose", "bushy eyebrows", "crazed eyes", "cross eyed",
             "flat nose", "glazed eyes", "hairy ears", "pierced nose", "pierces ears", "piercing eyes", "pointy ears",
             "scarred arms", "scarred cheek", "scarred chin", "scarred face", "scarred hands", "scarred neck", "torn ear",
             "wild eyes"
        }
    }
}
