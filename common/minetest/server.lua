---@meta

---Request the server to shutdown.
---@param message? string Will display `message` to clients.
---@param reconnect? boolean Displays a reconnect button to players.
---@param delay? any Adds an optional delay (in seconds) before shutdown. Negative delay cancels the current active shutdown. Zero delay triggers an immediate shutdown.
function minetest.request_shutdown(message, reconnect, delay) end

---Cancel current delayed shutdown.
function minetest.cancel_shutdown_requests() end

---Returns the server status string when a player joins or when the command `/status` is called.
---
---Returns `nil` or an empty string when the message is disabled.
---
---This function may be overwritten by mods to customize the status message.
---@param name string
---@param joined any Indicates whether the function was called when a player joined.
---@return string
function minetest.get_server_status(name, joined) end

---Returns the server uptime in seconds.
---@return integer
function minetest.get_server_uptime() end

---Returns the current maximum lag.
---@return number
function minetest.get_server_max_lag() end

---Remove player from database if he is not connected.
---
---As auth data is not removed, `minetest.player_exists` will continue to return true.
---
---Call `minetest.remove_player_auth(name)` as well if you want to remove auth data too.
---@param name string
---@return 0|1|2 (0: successful, 1: no such player, 2: player is connected).
function minetest.remove_player(name) end

---Remove player authentication data.
---
---Returns boolean indicating success (false if player nonexistant).
---@param name string
---@return boolean
function minetest.remove_player_auth(name) end

---@class dynamic_add_media_options
local dynamic_add_media_options = {}

---Path to a media file on the filesystem.
---@type string
dynamic_add_media_options.filepath = nil

---Name of the player the media should be sent to instead of all players (optional).
---@type string
dynamic_add_media_options.to_player = nil

---Marks the media as ephemeral, it will not be cached on the client (optional, default: false).
---@type boolean
dynamic_add_media_options.ephemeral = nil

---Pushes the specified media file to client(s).
---
---The file must be a supported image, sound or model format.
---
---Returns `false` on error, `true` if the request was accepted.
---
---The given callback will be called for every player as soon as the media is available on the client.
---Details/Notes:
---* If `ephemeral`=false and `to_player` is unset the file is added to the media sent to clients on startup, this means the media will appear even on old clients if they rejoin the server.
---* If `ephemeral`=false the file must not be modified, deleted, moved or renamed after calling this function.
---* Regardless of any use of `ephemeral`, adding media files with the same name twice is not possible/guaranteed to work. An exception to this is the use of `to_player` to send the same, already existent file to multiple chosen players.
---* Clients will attempt to fetch files added this way via remote media, this can make transfer of bigger files painless (if set up). Nevertheless it is advised not to use dynamic media for big media files.
---@param options dynamic_add_media_options
---@param callback fun(name: string)
---@return boolean
function minetest.dynamic_add_media(options, callback) end
