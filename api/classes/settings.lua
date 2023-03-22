---@meta
---Settings
-----------

-- Settings constructor.
---@param filename string
---@return mt.Settings
function Settings(filename) end

-- An interface to read config files in the format of `minetest.conf`.
--
-- It can be created via `Settings(filename)`.
---@class mt.Settings
local SettingsClass

-- Returns a value.
---@param key any
---@return any value
function SettingsClass:get(key) end

-- Returns `nil` if `key` is not found and `default` not specified.
---@param key any
---@param default any|nil The value returned if `key` is not found.
---@return boolean|nil
function SettingsClass:get_bool(key, default) end

---@return mt.NoiseParams
function SettingsClass:get_np_group(key) end

-- Is currently limited to mapgen flags `mg_flags` and mapgen-specific flags
-- like `mgv5_spflags`.
---@return mt.OreFlagsTable
function SettingsClass:get_flags(key) end

-- - Setting names can't contain whitespace or any of `="{}#`.
-- - Setting values can't contain the sequence `\n"""`.
-- - Setting names starting with "secure." can't be set on the main settings
--   object (`minetest.settings`).
---@param key string
---@param value any
function SettingsClass:set(key, value) end

-- - Setting names can't contain whitespace or any of `="{}#`.
-- - Setting values can't contain the sequence `\n"""`.
-- - Setting names starting with "secure." can't be set on the main settings
--   object (`minetest.settings`).
---@param key string
---@param value boolean
function SettingsClass:set_bool(key, value) end

-- - Setting names can't contain whitespace or any of `="{}#`.
-- - Setting values can't contain the sequence `\n"""`.
-- - Setting names starting with "secure." can't be set on the main settings
--   object (`minetest.settings`).
---@param key string
---@param value mt.NoiseParams
function SettingsClass:set_np_group(key, value) end

-- Returns a boolean (`true` for success).
---@param key string
---@return boolean
function SettingsClass:remove(key) end

---@return string[]
function SettingsClass:get_names() end

-- Writes changes to file.
--
-- Returns a boolean (`true` for success).
---@return boolean
function SettingsClass:write() end

---@return mt.SettingsTable
function SettingsClass:to_table() end

--[[
The settings have the format `key = value`. Example:

    foo = example text
    bar = """
    Multiline
    value
    """
]]
---@class mt.SettingsTable
