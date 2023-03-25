---@meta
---Utilities
------------

-- Returns the currently loading mod's name, when loading a mod.
---@return string
function minetest.get_current_modname() end

-- * Returns the directory path for a mod,
--   e.g. `"/home/user/.minetest/usermods/modname"`.
-- * Returns nil if the mod is not enabled or does not exist (not installed).
-- * Works regardless of whether the mod has been loaded yet.
-- * Useful for loading additional `.lua` modules or static data from a mod,
--   or checking if a mod is enabled.
---@param modname string
---@return string
function minetest.get_modpath(modname) end

-- * Returns a list of enabled mods, sorted alphabetically.
-- * Does not include disabled mods, even if they are installed.
---@return string[]
function minetest.get_modnames() end

-- * Returns a table containing information about the
--   current game. Note that other meta information (e.g. version/release number)
--   can be manually read from `game.conf` in the game's root directory.
---@return {id: string, title: string, author: string, path: string}
function minetest.get_game_info() end

-- * Returns e.g. `"/home/user/.minetest/world"`
-- * Useful for storing custom data
---@return string
function minetest.get_worldpath() end

---@return boolean
function minetest.is_singleplayer() end

-- Table containing API feature flags.
---@class mt.Feature
---@field glasslike_framed boolean (0.4.7).
---@field nodebox_as_selectionbox boolean (0.4.7).
---@field get_all_craft_recipes_works boolean (0.4.7).
-- The transparency channel of textures can optionally be used on nodes (0.4.7).
---@field use_texture_alpha boolean
-- Tree and grass ABMs are no longer done from C++ (0.4.8).
---@field no_legacy_abms boolean
-- Texture grouping is possible using parentheses (0.4.11).
---@field texture_names_parens boolean
-- Unique Area ID for AreaStore:insert_area (0.4.14).
---@field area_store_custom_ids boolean
-- `add_entity` supports passing initial staticdata to `on_activate` (0.4.16).
---@field add_entity_with_staticdata boolean
-- Chat messages are no longer predicted (0.4.16).
---@field no_chat_message_prediction boolean
-- The transparency channel of textures can optionally be used on
-- objects (ie: players and lua entities) (5.0.0).
---@field object_use_texture_alpha boolean
-- Object selectionbox is settable independently from collisionbox (5.0.0).
---@field object_independent_selectionbox boolean
-- Specifies whether binary data can be uploaded or downloaded using
-- the HTTP API (5.1.0).
---@field httpfetch_binary_data boolean
-- Whether formspec_version[<version>] may be used (5.1.0).
---@field formspec_version_element boolean
-- Whether AreaStore's IDs are kept on save/load (5.1.0).
---@field area_store_persistent_ids boolean
-- Whether minetest.find_path is functional (5.2.0).
---@field pathfinder_works boolean
-- Whether Collision info is available to an objects' on_step (5.3.0).
---@field object_step_has_moveresult boolean
-- Whether `get_velocity()` and `add_velocity()` can be used on players (5.4.0).
---@field direct_velocity_on_players boolean
-- `nodedef`'s `use_texture_alpha` accepts new string modes (5.4.0).
---@field use_texture_alpha_string_modes boolean
-- `degrotate` param2 rotates in units of 1.5° instead of 2°
-- thus changing the range of values from 0-179 to 0-240 (5.5.0).
---@field degrotate_240_steps boolean
-- ABM supports `min_y` and `max_y` fields in definition (5.5.0).
---@field abm_min_max_y boolean
-- `dynamic_add_media` supports passing a table with options (5.5.0).
---@field dynamic_add_media_table boolean
-- Particlespawners support texpools and animation of properties,
-- particle textures support smooth fade and scale animations, and
-- sprite-sheet particle animations can by synced to the lifetime
-- of individual particles (5.6.0).
---@field particlespawner_tweenable boolean
-- Allows get_sky to return a table instead of separate values (5.6.0).
---@field get_sky_as_table boolean
-- `VoxelManip:get_light_data` accepts an optional buffer argument (5.7.0).
---@field get_light_data_buffer boolean
-- When using a mod storage backend that is not "files" or "dummy",
-- the amount of data in mod storage is not constrained by
-- the amount of RAM available. (5.7.0).
---@field mod_storage_on_disk boolean
-- "zstd" method for compress/decompress (5.7.0).
---@field compress_zstd boolean
minetest.features = {}

---@param arg string | table<mt.Feature, boolean>
---@return boolean, table<mt.Feature, boolean> missing
function minetest.has_feature(arg) end

-- Table containing information about a player.
---@class mt.PlayerInfo
---@field address string IP address of client
---@field ip_version integer ip_version
---@field connection_uptime number seconds since client connected
---@field protocol_version integer protocol version used by client
---@field formspec_version integer supported formspec version
---@field lang_code string Language code used for translation
---@field min_rtt number|nil minimum round trip time
---@field max_rtt number|nil maximum round trip time
---@field avg_rtt number|nil average round trip time
---@field min_jitter number|nil minimum packet time jitter
---@field max_jitter number|nil maximum packet time jitter
---@field avg_jitter number|nil average packet time jitter
---@field ser_vers number DEBUG ONLY! serialization version used by client
---@field major number DEBUG ONLY! major version number
---@field minor number DEBUG ONLY! minor version number
---@field patch number DEBUG ONLY! patch version number
---@field vers_string string DEBUG ONLY! full version string
---@field state string DEBUG ONLY! current client state

---@param player_name string
---@return mt.PlayerInfo
function minetest.get_player_information(player_name) end

-- Creates a directory specified by `path`, creating parent directories
-- if they don't exist.
---@param path string
---@return boolean success
function minetest.mkdir(path) end

-- Removes a directory specified by `path`.
-- If `recursive` is set to `true`, the directory is recursively removed.
-- Otherwise, the directory will only be removed if it is empty.
---@param path string
---@param recursive boolean
---@return boolean success
function minetest.rmdir(path, recursive) end

-- Copies a directory specified by `path` to `destination`
-- Any files in `destination` will be overwritten if they already exist.
---@param path string
---@param destination string
---@return boolean success
function minetest.cpdir(path, destination) end

-- Moves a directory specified by `path` to `destination`.
-- If the `destination` is a non-empty directory, then the move will fail.
---@param path string
---@param destination string
---@return boolean success
function minetest.mvdir(path, destination) end

-- Returns list of entry names.
---@param path string
-- * nil: return all entries,
-- * true: return only subdirectory names,
-- * false: return only file names.
---@param is_dir boolean|nil
---@return string[]
function minetest.get_dir_list(path, is_dir) end

-- Replaces contents of file at path with new contents in a safe (atomic)
-- way. Use this instead of below code when writing e.g. database files:
-- `local f = io.open(path, "wb"); f:write(content); f:close()`
---@param path string
---@param content string
---@return boolean success
function minetest.safe_file_write(path, content) end

-- Returns a table containing components of the engine version.
---@return mt.EngineVersion
function minetest.get_version() end

---@class mt.EngineVersion
---@field project string Name of the project, eg, "Minetest".
---@field string string Simple version, eg, "1.2.3-dev".
-- Full git version (only set if available), eg, "1.2.3-dev-01234567-dirty".
---@field hash string
-- Boolean value indicating whether it's a development build.
-- Use this for informational purposes only. The information in the returned
-- table does not represent the capabilities of the engine, nor is it
-- reliable or verifiable. Compatible forks will have a different name and
-- version entirely. To check for the presence of engine features, test
-- whether the functions exported by the wanted features exist. For example:
-- `if minetest.check_for_falling then ... end`.
---@field is_dev boolean

-- Returns the sha1 hash of data.
---@param data string
---@param raw boolean|nil `false` return raw bytes instead of hex digits
---@return string
function minetest.sha1(data, raw) end

-- Converts a ColorSpec to a ColorString.
-- If the ColorSpec is invalid, returns `nil`.
---@param colorspec mt.ColorSpec
---@return mt.ColorString|nil
function minetest.colorspec_to_colorstring(colorspec) end

-- Converts a ColorSpec to a raw string of four bytes in an RGBA layout.
---@param colorspec mt.ColorSpec
---@return string
function minetest.colorspec_to_bytes(colorspec) end

-- Encode a PNG image and return it in string form.
---@param width integer
---@param height integer
-- Image data, one of:
--   * array table of ColorSpec, length must be width*height
--   * string with raw RGBA pixels, length must be width*height*4
--
-- The data is one-dimensional, starting in the upper left corner of the image
-- and laid out in scanlines going from left to right, then top to bottom.
-- Please note that it's not safe to use string.char to generate raw data,
-- use `colorspec_to_bytes` to generate raw RGBA values in a predictable way.
-- The resulting PNG image is always 32-bit. Palettes are not supported at the moment.
-- You may use this to procedurally generate textures during server init.
---@param data mt.ColorSpec[]|string
---@param compression integer|nil Optional zlib compression level from 0 to 9.
function minetest.encode_png(width, height, data, compression) end
