---@meta

-----------------
-- MetaDataRef --
-----------------

---Base class used by `StorageRef`, `NodeMetaRef`, `ItemStackMetaRef` and `PlayerMetaRef`.
---@class mt.MetaDataRef
local MetaDataRef = {}

---Returns `true` if key present, otherwise `false`.
---
---Returns `nil` when the MetaData is inexistent.
---@param key string
---@return boolean?
function MetaDataRef:contains(key) end

---Returns `nil` if key not present, else the stored string.
---@param key string
---@return string?
function MetaDataRef:get(key) end

---Value of `""` will delete the key.
---@param key string
---@param value string|nil
function MetaDataRef:set_string(key, value) end

---Returns `""` if key not present.
---@param key string
---@return string
function MetaDataRef:get_string(key) end

---@param key string
---@param value integer
function MetaDataRef:set_int(key, value) end

---Returns `0` if key not present.
---@param key string
---@return integer
function MetaDataRef:get_int(key) end

---@param key string
---@param value number
function MetaDataRef:set_float(key, value) end

---Returns `0` if key not present.
---@param key string
---@return number
function MetaDataRef:get_float(key) end

---Returns `nil` or a table with keys: `fields`: key-value storage.
---@return {fields: {[string]: any}}?
function MetaDataRef:to_table() end

---Any non-table value will clear the metadata.
---
--- * Returns `true` on success.
--- * `fields`: key-value storage
---@param table {fields: {[string]: any}}?
---@return boolean
function MetaDataRef:from_table(table) end

---Returns `true` if this metadata has the same key-value pairs as `other`.
---@param other mt.MetaDataRef
---@return boolean
function MetaDataRef:equals(other) end

-----------------
-- NodeMetaRef --
-----------------

--[[
Node metadata contains two things:

- A key-value store
- An inventory

Some of the values in the key-value store are handled specially:

- `formspec`: Defines an inventory menu that is opened with the 'place/use' key.
  Only works if no `on_rightclick` was defined for the node.
- `infotext`: Text shown on the screen when the node is pointed at. Line-breaks
  will be applied automatically. If the infotext is very long, it will be
  truncated.

Example:

```lua
local meta = minetest.get_meta(pos)
meta:set_string("formspec",
  "size[8,9]"..
  "list[context;main;0,0;8,4;]"..
  "list[current_player;main;0,5;8,4;]")
meta:set_string("infotext", "Chest");
local inv = meta:get_inventory()
inv:set_size("main", 8*4)
print(dump(meta:to_table()))
meta:from_table({
  inventory = {
    main = {[1] = "default:dirt", [2] = "", [3] = "", [4] = "",
      [5] = "", [6] = "", [7] = "", [8] = "", [9] = "",
      [10] = "", [11] = "", [12] = "", [13] = "",
      [14] = "default:cobble", [15] = "", [16] = "", [17] = "",
      [18] = "", [19] = "", [20] = "default:cobble", [21] = "",
      [22] = "", [23] = "", [24] = "", [25] = "", [26] = "",
      [27] = "", [28] = "", [29] = "", [30] = "", [31] = "",
      [32] = ""}
  },
  fields = {
    formspec = "size[8,9]list[context;main;0,0;8,4;]list[current_player;main;0,5;8,4;]",
    infotext = "Chest"
  }
})
```
]]
---@class mt.NodeMetaRef: mt.MetaDataRef
local NodeMetaRef = {}

--- * Returns `nil` or a table with keys:
--- * `fields`: key-value storage
--- * `inventory`: `{list1 = {}, ...}}`
---@return {fields: {[string]: any}, inventory: {[string]: {[integer]: string}}}?
function NodeMetaRef:to_table() end

---Any non-table value will clear the metadata.
---
--- * Returns `true` on success.
--- * `fields`: key-value storage
--- * `inventory`: `{list1 = {}, ...}}`
---@param table {fields: {[string]: any}, inventory: {[string]: {[integer]: string}}}?
---@return boolean
function NodeMetaRef:from_table(table) end

---@return mt.InvRef
function NodeMetaRef:get_inventory() end

---Mark specific vars as private.
---
---This will prevent them from being sent to the client.
---
---Note that the "private" status will only be remembered if an associated key-value pair exists, meaning it's best to call this when initializing all other meta (e.g. `on_construct`).
---@param name string|string[]
function NodeMetaRef:mark_as_private(name) end

----------------------
-- ItemStackMetaRef --
----------------------

--[[
Item metadata only contains a key-value store.

Some of the values in the key-value store are handled specially:

- `description`: Set the item stack's description. See also: `get_description`
  in [`ItemStack`]
- `short_description`: Set the item stack's short description. See also:
  `get_short_description` in [`ItemStack`]
- `color`: A `ColorString`, which sets the stack's color.
- `palette_index`: If the item has a palette, this is used to get the current
  color from the palette.
- `count_meta`: Replace the displayed count with any string.
- `count_alignment`: Set the alignment of the displayed count value. This is an
  int value. The lowest 2 bits specify the alignment in x-direction, the 3rd and
  4th bit specify the alignment in y-direction: 0 = default, 1 = left / up, 2 =
  middle, 3 = right / down The default currently is the same as right/down.
  Example: 6 = 2 + 1\*4 = middle,up

Example:

```lua
local meta = stack:get_meta()
meta:set_string("key", "value")
print(dump(meta:to_table()))
```

Example manipulations of "description" and expected output behaviors:

```lua
print(ItemStack("default:pick_steel"):get_description()) --> Steel Pickaxe
print(ItemStack("foobar"):get_description()) --> Unknown Item

local stack = ItemStack("default:stone")
stack:get_meta():set_string("description", "Custom description\nAnother line")
print(stack:get_description()) --> Custom description\nAnother line
print(stack:get_short_description()) --> Custom description

stack:get_meta():set_string("short_description", "Short")
print(stack:get_description()) --> Custom description\nAnother line
print(stack:get_short_description()) --> Short

print(ItemStack("mod:item_with_no_desc"):get_description()) --> mod:item_with_no_desc
```
]]
---@class mt.ItemStackMetaRef: mt.MetaDataRef
local ItemStackMetaRef = {}

---Overrides the item's tool capabilities
---
---A nil value will clear the override data and restore the original behavior.
---@param tool_capabilities mt.ToolCaps
function ItemStackMetaRef:set_tool_capabilities(tool_capabilities) end

----------------
-- StorageRef --
----------------

---@class mt.StorageRef: mt.MetaDataRef
local StorageRef = {}

---Returns reference to mod private `StorageRef`.
---
---Must be called during mod load time.
---@return mt.StorageRef
function minetest.get_mod_storage() end

-------------------
-- PlayerMetaRef --
-------------------

---@class mt.PlayerMetaRef: mt.MetaDataRef
local PlayerMetaRef = {}
