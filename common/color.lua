---@meta
---Colors
---------

-- `#RGB` defines a color in hexadecimal format.
--
-- `#RGBA` defines a color in hexadecimal format and alpha channel.
--
-- `#RRGGBB` defines a color in hexadecimal format.
--
-- `#RRGGBBAA` defines a color in hexadecimal format and alpha channel.
--
-- Named colors are also supported and are equivalent to
-- [CSS Color Module Level 4](https://www.w3.org/TR/css-color-4/#named-color).
-- To specify the value of the alpha channel, append `#A` or `#AA` to the end of
-- the color name (e.g. `colorname#08`).
---@alias mt.ColorString string

-- The raw integer value of an ARGB8 quad: `colorspec = 0xFF00FF00`.
---@alias mt.ColorInteger integer

---@class mt.ColorTable
---@field r number
---@field g number
---@field b number
---@field a number

-- A ColorSpec specifies a 32-bit color. It can be written in any of the following
-- forms:
--
-- * Table form: Each element ranging from 0..255 (a, if absent, defaults to 255):
--   `colorspec = {a=255, r=0, g=255, b=0}`
-- * Numerical form: The raw integer value of an ARGB8 quad.
-- * String form: A ColorString: `colorspec = "green"`
---@alias mt.ColorSpec mt.ColorTable|mt.ColorString|mt.ColorInteger
