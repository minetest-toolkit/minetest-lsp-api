---@meta
---Setting-related
------------------

-- Returns a `Settings` object.
---@param filename string
---@return mt.Settings
function Settings(filename) end

-- The settings have the format `key = value`.
---@class mt.Settings
local settings = {}

-- Returns a value.
---@param key string
---@return string
function settings:get(key) end

-- Returns a boolean.
--
-- * `default` is the value returned if `key` is not found.
-- * Returns `nil` if `key` is not found and `default` not specified.
---@param key string
---@param default? boolean
---@return boolean?
function settings:get_bool(key, default) end

-- Returns a `NoiseParams` table.
---@param key string
---@return mt.NoiseParams
function settings:get_np_group(key) end

-- * Returns `{flag = true/false, ...}` according to the set flags.
-- * Is currently limited to mapgen flags `mg_flags` and mapgen-specific flags like `mgv5_spflags`.
---@param key string
---@return table
function settings:get_flags(key) end

-- * Setting names can't contain whitespace or any of `="{}#`.
-- * Setting values can't contain the sequence `\n"""`.
-- * Setting names starting with "secure." can't be set on the main settings object (`minetest.settings`).
---@param key string
---@param value any
function settings:set(key, value) end

-- See `set()`.
---@param key string
---@param value boolean
function settings:set_bool(key, value) end

-- Set a `NoiseParams` table.
---@param key string
---@param value mt.NoiseParams
function settings:set_np_group(key, value) end

-- Returns a boolean (`true` for success).
---@param key string
---@return boolean
function settings:remove(key) end

-- Returns `{key1,...}`.
---@return table
function settings:get_names() end

-- Writes changes to file.
--
-- Returns a boolean (`true` for success).
---@return boolean
function settings:write() end

-- Returns `{[key1]=value1,...}`.
---@return table
function settings:to_table() end

-- Settings object containing all of the settings from the main config file (`minetest.conf`).
---@type mt.Settings
minetest.settings = {}

-- Loads a setting from the main settings and parses it as a position (in the format `(1,2,3)`).
--
-- Returns a position or `nil`.
---@param name string
---@return mt.Vector?
function minetest.setting_get_pos(name) end
