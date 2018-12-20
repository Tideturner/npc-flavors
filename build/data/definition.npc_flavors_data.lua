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
    -- [[table.colors]]
};

local tFurAndHair = {
    -- [[table.furAndHair]]
}

Flavors = {
    ["clothing"] = {
        -- TODO: Find out why color is applied befoe prefix!
        construct = constructPCS,
        prefix = {
            -- [[flavors.clothing.prefix]]
        },
        color = tColors,
        suffix = {
            -- [[flavors.clothing.suffix]]
        }
    },
    ["bodyparts"] = {
        construct = constructPCS,
        prefix = {
            -- [[flavors.bodyparts.prefix]]
        },
        color = tColors,
        suffix = {
            -- [[flavors.bodyparts.suffix]]
        }
    },
    ["hair"] = {
        construct = constructPCS,
        prefix = tFurAndHair,
        color = tColors,
        suffix = {
            -- [[flavors.hair.suffix]]
        }
    },
    ["build"] = {
        construct = constructPS2,
        prefix = {
            -- [[flavors.build.prefix]]
        },
        color = tColors,
        suffix = {
            -- [[flavors.build.suffix]]
        }
    },
    ["behavior"] = {
        construct = constructPS,
        prefix = {
            -- [[flavors.behavior.prefix]]
        },
        suffix = {
            -- [[flavors.behavior.suffix]]
        }
    },
    ["fur"] = {
        construct = constructPS,
        prefix = tFurAndHair,
        color = tColors,
        suffix = {
            -- [[flavors.fur.suffix]]
        }
    },
    ["characteristic"] = {
        construct = constructSOLO,
        solo = {
            -- [[flavor.characteristic.solo]]
        }
    }
}