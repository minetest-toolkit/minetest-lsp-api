---@meta
---Escape sequences
-------------------

---The escape sequence sets the text color to `color`.
---@param color mt.ColorString
function minetest.get_color_escape_sequence(color) end

-- Equivalent to:
-- ```lua
-- minetest.get_color_escape_sequence(color) .. message ..
-- minetest.get_color_escape_sequence("#ffffff")
-- ```
---@param color mt.ColorString
---@param message string
function minetest.colorize(color, message) end

-- The escape sequence sets the background of the whole text element to
-- `color`. Only defined for item descriptions and tooltips.
---@param color mt.ColorString
function minetest.get_background_escape_sequence(color) end

-- Removes foreground colors added by `get_color_escape_sequence`.
---@param str string
function minetest.strip_foreground_colors(str) end

-- Removes background colors added by `get_background_escape_sequence`.
---@param str string
function minetest.strip_background_colors(str) end

-- Removes all color escape sequences.
---@param str string
function minetest.strip_colors(str) end
