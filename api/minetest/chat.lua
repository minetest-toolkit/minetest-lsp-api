---@meta
---Chat
-------

---@param text string
function minetest.chat_send_all(text) end

---@param name string
---@param text string
function minetest.chat_send_player(name, text) end

---Used by the server to format a chat message, based on the setting `chat_message_format`.
---Refer to the documentation of the setting for a list of valid placeholders.
---Takes player name and message, and returns the formatted string to be sent to players.
---Can be redefined by mods if required, for things like colored names or messages.
---**Only** the first occurrence of each placeholder will be replaced.
---@param name string
---@param message string
function minetest.format_chat_message(name, message) end
