-- Centralizes all option registration and access

-- ============================================================================
-- INITIALIZATION
-- ============================================================================
-- Registers all extension options with Fantasy Grounds
function onInit()
    -- Extension is host-only
    if not Session.IsHost then return; end

    -- Register ENABLED option
    OptionsManager.registerOption2("NPCF_ENABLED", true, "npcf_option_group",
                                   "npcf_option_enabled", "option_entry_cycler", {
        labels = "option_val_off",
        values = "off",
        baselabel = "option_val_on",
        baseval = "on",
        default = "on"
    });

    -- Register FLAVOR CHANCE option
    OptionsManager.registerOption2("NPCF_FCHANCE", true, "npcf_option_group",
                                   "npcf_option_fchance", "option_entry_cycler", {
        labels = "npcf_option_fchance_20|npcf_option_fchance_30|npcf_option_fchance_40|npcf_option_fchance_50|npcf_option_fchance_60|npcf_option_fchance_70|npcf_option_fchance_80|npcf_option_fchance_90|npcf_option_fchance_100",
        values = "20%|30%|40%|50%|60%|70%|80%|90%|100%",
        baselabel = "npcf_option_fchance_10",
        baseval = "10%",
        default = "40%"
    });

    -- Register DEBUG option
    -- OptionsManager.registerOption2("NPCF_DEBUG", false, "npcf_option_group",
    --                                "npcf_option_debug", "option_entry_cycler", {
    --     labels = "npcf_option_debug_simple|npcf_option_debug_verbose|npcf_option_debug_debug",
    --     values = "simple|verbose|debug",
    --     baselabel = "npcf_option_debug_off",
    --     baseval = "off",
    --     default = "off"
    -- });

    -- Register NON-ID option
    OptionsManager.registerOption2("NPCF_NONID", false, "npcf_option_group",
                                   "npcf_option_nonid", "option_entry_cycler", {
        labels = "npcf_option_unknown|npcf_option_unknown_type|npcf_option_type",
        values = "unknown|uident_type|type",
        baselabel = "npcf_option_fg",
        baseval = "unchanged",
        default = "unchanged"
    });
end

-- ============================================================================
-- OPTION GETTERS
-- ============================================================================

-- Check if NPC Flavors is enabled
-- @return: boolean true if enabled
function isEnabled() return OptionsManager.getOption("NPCF_ENABLED") == "on"; end

-- Get the flavor chance percentage
-- @return: number 0-100 representing percentage
function getFlavorChance()
    local sRawOption = OptionsManager.getOption("NPCF_FCHANCE");
    local nChance = tonumber(string.match(sRawOption, "%d+"));
    return nChance or 40;
end

-- Get the non-ID mode setting
-- @return: string "unchanged", "unknown", "uident_type", or "type"
function getNonIDMode() return OptionsManager.getOption("NPCF_NONID"); end
