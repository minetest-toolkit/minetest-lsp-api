---@meta
---Item handling
----------------

-- Returns a string for making an image of a cube (useful as an item image).
---@param img1 string
---@param img2 string
---@param img3 string
---@return string
function minetest.inventorycube(img1, img2, img3) end

-- Returns the position of a `pointed_thing` or `nil` if the `pointed_thing`
-- does not refer to a node or entity.
--
-- If the optional `above` parameter is true and the `pointed_thing` refers
-- to a node, then it will return the `above` position of the `pointed_thing`.
---@param pointed_thing mt.PointedThing
---@param above boolean|nil
---@return mt.Vector
function minetest.get_pointed_thing_position(pointed_thing, above) end

-- Convert a vector to a facedir value,
-- used in `param2` for `paramtype2="facedir"`.
--
-- Passing something non-`nil`/`false` for the optional second parameter
-- causes it to take the `y` component into account.
---@param dir mt.Vector
---@param is6d boolean|nil
---@return string
function minetest.dir_to_facedir(dir, is6d) end

-- Convert a facedir back into a vector aimed directly out the "back" of a node.
---@param facedir string
---@return mt.Vector
function minetest.facedir_to_dir(facedir) end

-- Convert a vector to a 4dir value, used in `param2` for `paramtype2="4dir"`.
---@param dir mt.Vector
---@return string
function minetest.dir_to_fourdir(dir) end

-- Convert a 4dir back into a vector aimed directly out the "back" of a node.
---@param fourdir string
---@return mt.Vector
function minetest.fourdir_to_dir(fourdir) end

-- Convert a vector to a wallmounted value, used for `paramtype2="wallmounted"`.
---@param dir mt.Vector
---@return string
function minetest.dir_to_wallmounted(dir) end

-- Convert a wallmounted value back into a vector
-- aimed directly out the "back" of a node.
---@param wallmounted string
---@return mt.Vector
function minetest.wallmounted_to_dir(wallmounted) end

-- Convert a vector into a yaw (angle).
---@param dir mt.Vector
---@return number
function minetest.dir_to_yaw(dir) end

-- Convert yaw (angle) to a vector.
---@param yaw number
---@return  mt.Vector
function minetest.yaw_to_dir(yaw) end

-- Returns a boolean. Returns `true` if the given `paramtype2` contains
-- color information (`color`, `colorwallmounted`, `colorfacedir`, etc.).
---@param ptype mt.ParamType2
---@return boolean
function minetest.is_colored_paramtype(ptype) end

-- Removes everything but the color information from the given `param2` value.
--
-- Returns `nil` if the given `paramtype2` does not contain color information.
---@param param2 mt.Param
---@param paramtype2 mt.ParamType2
---@return mt.Param|nil
function minetest.strip_param2_color(param2, paramtype2) end

-- Returns list of itemstrings that are dropped by `node` when dug
-- with the item `toolname` (not limited to tools).
---@param node mt.Node|string Node as table or node name.
---@param toolname string|nil Name of the item used to dig.
function minetest.get_node_drops(node, toolname) end

-- Used in `minetest.get_craft_result` and `minetest.get_craft_recipe`.
---@class mt.CraftInput
---@field method "normal"|"cooking"|"fuel"
---@field width number
---@field items mt.Item[]

-- Used in `minetest.get_craft_result`.
---@class mt.CraftOutput
---@field item mt.ItemStack Can be empty.
---@field time number
---@field replacements mt.ItemStack[]

---@param input mt.CraftInput
---@return mt.CraftOutput output
---@return mt.CraftInput decremented_input
function minetest.get_craft_result(input) end

-- Returns last registered recipe for output item (node).
---@param output mt.Node|mt.ItemString
---@return mt.CraftInput
function minetest.get_craft_recipe(output) end

-- Example result for `"default:gold_ingot"` with two recipes:
--
-- ```lua
-- {
--     {
--         method = "cooking", width = 3,
--         output = "default:gold_ingot", items = {"default:gold_lump"}
--     },
--     {
--         method = "normal", width = 1,
--         output = "default:gold_ingot 9", items = {"default:goldblock"}
--     }
-- }
-- ```
---@class mt.AllCraftRecipes:mt.CraftInput
---@field output mt.ItemString

---@param item mt.Node
---@return mt.AllCraftRecipes|nil
function minetest.get_all_craft_recipes(item) end

-- Handles drops from nodes after digging:
-- Default action is to put them into digger's inventory.
--
-- Can be overridden to get different functionality
-- (e.g. dropping items on ground).
---@param pos mt.Vector
---@param drops mt.ItemString[]
---@param digger mt.ObjectRef
function minetest.handle_node_drops(pos, drops, digger) end

-- Creates an item string which contains palette index information
-- for hardware colorization. You can use the returned string
-- as an output in a craft recipe.
---@param item mt.Item
---@param palette_index integer Added to the item stack.
---@return mt.ItemString
function minetest.itemstring_with_palette(item, palette_index) end

-- Creates an item string which contains static color information
-- for hardware colorization. Use this method if you wish to colorize
-- an item that does not own a palette. You can use the returned string
-- as an output in a craft recipe.
---@param item mt.Item
---@param colorstring mt.ColorString The new color of the item stack.
---@return mt.ItemString
function minetest.itemstring_with_color(item, colorstring) end
