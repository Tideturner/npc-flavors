-- Provides configurable logging with verbosity levels

-- Verbosity levels:
-- off = 0 (no output)
-- simple = 1 (basic info: name, type, result)
-- verbose = 2 (detailed info without internal logic)
-- debug = 3 (everything including internal logic)
local VERBOSITY_LEVELS = {
    ["off"] = 0,
    ["simple"] = 1,
    ["verbose"] = 2,
    ["debug"] = 3
};

-- ============================================================================
-- HELPERS
-- ============================================================================

-- Gets current verbosity level from options
-- @return: number 0-3 representing verbosity level
function getVerbosityLevel()
    local sOption = OptionsManager.getOption("NPCF_DEBUG");
    return VERBOSITY_LEVELS[sOption] or 0;
end

-- Checks if message should be logged based on level
-- @param nRequiredLevel: minimum verbosity level required
-- @return: boolean true if should log
function shouldLog(nRequiredLevel) return getVerbosityLevel() >= nRequiredLevel; end

-- Logs message if verbosity level is high enough
-- @param sMessage: message to log
-- @param nLevel: verbosity level required
function log(sMessage, nLevel)
    if shouldLog(nLevel) then
        ChatManager.SystemMessage("[NPC Flavors] " .. sMessage);
    end
end

-- ============================================================================
-- LOGGING FUNCTIONS
-- ============================================================================

-- Simple level (1): Basic flow information
function logSimple(sMessage) log(sMessage, 1); end

-- Verbose level (2): Detailed information
function logVerbose(sMessage) log(sMessage, 2); end

-- Debug level (3): Internal logic and detailed debugging
function logDebug(sMessage) log(sMessage, 3); end
