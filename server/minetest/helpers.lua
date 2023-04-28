---@meta
---Helper functions
-------------------

---@param x number
---@return number
function math.factorial(x) end

-- Escapes the characters `"["`, `"]"`, `"\"`, `","` and `";"`,
-- which can not be used in formspecs.
---@param str string
---@return string
function minetest.formspec_escape(str) end

-- Returns time with microsecond precision. May not return wall time.
---@return number
function minetest.get_us_time() end

--[[
Returns the smallest numerical index containing
the value `val` in the table `list`. Non-numerical indexes are ignored. If
`val` could not be found, `-1` is returned. `list` must not have negative
indexes.
]]
---@param list any[]
---@param val any
---@return integer
function table.indexof(list, val) end

-- Appends all values in `other_table` to `table` - uses `#table + 1` to find
-- new indexes.
---@param table table
---@param other_table table
function table.insert_all(table, other_table) end

-- Returns a table with keys and values swapped.
--
-- If multiple keys in `t` map to the same value, it is unspecified which value
-- maps to that key.
---@param t table
---@return table swapped
function table.key_value_swap(t) end

-- Shuffles elements `from` to `to` in `table` in place.
---@param table table
---@param from number|nil Default: `1`
---@param to number|nil Default: `#table`
---@param random_func nil|fun(number, number?):number Default: `math.random`
function table.shuffle(table, from, to, random_func) end

-- Returns the exact position on the surface of a pointed node.
---@param placer mt.ObjectRef
---@param pointed_thing mt.PointedThing
---@return mt.Vector position
function minetest.pointed_thing_to_face_pos(placer, pointed_thing) end

--[[
Simulates a tool being used once and returns the added wear, such that, if
only this function is used to calculate wear, the tool will break exactly
after `uses` times of uses.
]]
---@param uses number Number of times the tool can be used.
---@param initial_wear number|nil Initial wear the tool starts with (default: `0`).
---@return number
function minetest.get_tool_wear_after_use(uses, initial_wear) end

-- Simulates an item that digs a node.
---@param groups mt.ObjectGroups
---@param tool_capabilities mt.ToolCaps
---@param wear number Amount of wear the tool starts with (default: `0`).
---@return mt.DigParams
function minetest.get_dig_params(groups, tool_capabilities, wear) end

---@class mt.DigParams
---@field diggable boolean `true` if node can be dug, `false` otherwise.
---@field time number|nil Time it would take to dig the node.
-- How much wear would be added to the tool (ignored for non-tools).
---@field wear number|nil

--[[
Groups are stored in a table, having the group names with keys and the group
ratings as values. Group ratings are integer values within the range [-32767,
32767]. For example:

    -- Default dirt
    groups = {crumbly=3, soil=1}

    -- A more special dirt-kind of thing
    groups = {crumbly=2, soil=1, level=2, outerspace=1}

Groups always have a rating associated with them. If there is no useful meaning
for a rating for an enabled group, it shall be `1`.

When not defined, the rating of a group defaults to `0`. Thus when you read
groups, you must interpret `nil` and `0` as the same value, `0`.

You can read the rating of a group for an item or a node by using

    minetest.get_item_group(itemname, groupname)
]]
---@alias mt.ObjectGroups table<string, number>

-- Simulates an item that punches an object.
---@param groups mt.ObjectGroups
---@param tool_caps mt.ToolCaps
---@param last_punch_time number|nil Time in seconds since last punch action.
---@param wear number|nil Amount of wear the item starts with (default: `0`).
---@return mt.HitParams
function minetest.get_hit_params(groups, tool_caps, last_punch_time, wear) end

---@class mt.HitParams
---@field hp number
---@field wear number
