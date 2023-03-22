---@meta
---Raycast
----------

--[[
A raycast on the map. It works with selection boxes. Can be used as an iterator
in a for loop as:

    local ray = Raycast(...)
    for pointed_thing in ray do
        ...
    end

The map is loaded as the ray advances. If the map is modified after the
`Raycast` is created, the changes may or may not have an effect on the object.

It can be created via `Raycast(pos1, pos2, objects, liquids)` or
`minetest.raycast(pos1, pos2, objects, liquids)` where:

- `pos1`: start of the ray
- `pos2`: end of the ray
- `objects`: if false, only nodes will be returned. Default is true.
- `liquids`: if false, liquid nodes (`liquidtype ~= "none"`) won't be returned.
  Default is false.
]]
---@class mt.Raycast
local RaycastClass

---@param pos1 mt.Vector Start of the ray.
---@param pos2 mt.Vector End of the ray.
---@param objects boolean If false, only nodes will be returned. Default is true.
---@param liquids boolean if false (default), liquid nodes (`liquidtype ~= "none"`) won't be returned.
---@return mt.Raycast
function Raycast(pos1, pos2, objects, liquids) end

minetest.raycast = Raycast

-- Returns a `pointed_thing` with exact pointing location
-- - Returns the next thing pointed by the ray or `nil`.
---@return mt.PointedThing|nil
function RaycastClass:next() end
