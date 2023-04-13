---@meta
---Lua Voxel Manipulator
------------------------

--[[
VoxelManip is a scripting interface to the internal 'Map Voxel Manipulator'
facility. The purpose of this object is for fast, low-level, bulk access to
reading and writing Map content. As such, setting map nodes through VoxelManip
will lack many of the higher level features and concepts you may be used to
with other methods of setting nodes. For example, nodes will not have their
construction and destruction callbacks run, and no rollback information is
logged.

It is important to note that VoxelManip is designed for speed, and *not* ease
of use or flexibility. If your mod requires a map manipulation facility that
will handle 100% of all edge cases, or the use of high level node placement
features, perhaps `minetest.set_node()` is better suited for the job.

In addition, VoxelManip might not be faster, or could even be slower, for your
specific use case. VoxelManip is most effective when setting large areas of map
at once - for example, if only setting a 3x3x3 node area, a
`minetest.set_node()` loop may be more optimal. Always profile code using both
methods of map manipulation to determine which is most appropriate for your
usage.

A recent simple test of setting cubic areas showed that `minetest.set_node()`
is faster than a VoxelManip for a 3x3x3 node cube or smaller.
]]
---@class mt.VoxelManip
local VoxelManip = {}

---Loads a chunk of map into the VoxelManip object
---containing the region formed by `p1` and `p2`.
---@param p1 mt.Vector
---@param p2 mt.Vector
function VoxelManip:read_from_map(p1, p2) end

---Writes the data loaded from the `VoxelManip` back to the map.
---@param light boolean `true` by default
---* If `light` is true, then lighting is automatically recalculated.
---* If `light` is false, no light calculations happen, and you should correct
---all modified blocks with `minetest.fix_light()` as soon as possible.
---
---Keep in mind that modifying the map where light is incorrect can cause
---more lighting bugs.
function VoxelManip:write_to_map(light) end

---Returns a `MapNode` table of the node currently loaded in
---the `VoxelManip` at that position.
---@param pos mt.Vector
---@return mt.MapNode
function VoxelManip:get_node_at(pos) end

---Sets a specific `MapNode` in the `VoxelManip` at that position.
---@param pos mt.Vector
---@param node mt.MapNode
function VoxelManip:set_node_at(pos, node) end

---Retrieves the node content data loaded into the `VoxelManip` object.
---@param buffer? table if present, will be used to store the result
---@return integer[]? # raw node data in the form of an array of node content IDs
function VoxelManip:get_data(buffer) end

---Sets the data contents of the `VoxelManip` object
---@param data integer[]
function VoxelManip:set_data(data) end

---Does nothing, kept for compatibility.
function VoxelManip:update_map() end

---Set the lighting within the `VoxelManip` to a uniform value.
---To be used only by a `VoxelManip` object from
---`minetest.get_mapgen_object`.
---@param light {day: integer, night: integer}
---@param p1 mt.Vector
---@param p2 mt.Vector
---* light constraints: `{day=<0...15>, night=<0...15>}`
---* (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
---area if left out.
function VoxelManip:set_lighting(light, p1, p2) end

--- Gets the light data read into the `VoxelManip` object
---@param buffer? integer[] if present, will be used to store the result
---@return integer[]? # array of integers ranging from `0` to `255`.
---Each value is the bitwise combination of day and night light values
---(`0` to `15` each). `light = day + (night * 16)`
function VoxelManip:get_light_data(buffer) end

---Sets the `param1` (light) contents of each node in the `VoxelManip`.
---Expects lighting data in the same format that `get_light_data()` returns
---@param light_data integer[] # integer range is `0` to `255`.
---Each value is the bitwise combination of day and night light values
---(`0` to `15` each). `light = day + (night * 16)`
function VoxelManip:set_light_data(light_data) end

---Gets the raw `param2` data read into the `VoxelManip` object.
---@return integer[]? # array of integers ranging from `0` to `255`.
---@param buffer? table if is present, this table
---will be used to store the result instead.
function VoxelManip:get_param2_data(buffer) end

---Sets the `param2` contents of each node in the `VoxelManip`.
---@param param2_data integer[] array of integers ranging from `0` to `255`.
function VoxelManip:set_param2_data(param2_data) end

---Calculate lighting within the `VoxelManip`.
---@param p1? mt.Vector
---@param p2? mt.Vector
---@param propagate_shadow boolean
---* To be used only by a `VoxelManip` object from
---  `minetest.get_mapgen_object`.
---* (`p1`, `p2`) is the area in which lighting is set, defaults to the whole
---  area if left out or nil. For almost all uses these should be left out
---  or nil to use the default.
---* `propagate_shadow` is an optional boolean deciding whether shadows in a
---  generated mapchunk above are propagated down into the mapchunk, defaults
---  to `true` if left out.
function VoxelManip:calc_lighting(p1, p2, propagate_shadow) end

---Update liquid flow
function VoxelManip:update_liquids() end

---Returns `true` if the data in the voxel manipulator
---had been modified since the last read from map, due to a call to
---`minetest.set_data()` on the loaded area elsewhere.
---@return boolean
function VoxelManip:was_modified() end

---@return mt.Vector # actual emerged minimum position
---@return mt.Vector # actual emerged maximum position
function VoxelManip:get_emerged_area() end

---@alias mt.HeightMap number[]

---@alias mt.BiomeMap integer[]

---@alias mt.HeatMap number[]

---@alias mt.HumidityMap number[]

---@class mt.GenNotify
---A table mapping requested generation notification types to arrays of
---positions at which the corresponding generated structures are located within
---the current chunk. To enable the capture of positions of interest to be recorded
---call `minetest.set_gen_notify()` first.
---@field dungeon mt.Vector[] bottom center position of dungeon rooms
---@field temple mt.Vector[] bottom center position of desert temples (mgv6 only)
---@field cave_begin mt.Vector[]
---@field cave_end mt.Vector[]
---@field large_cave_begin mt.Vector[]
---@field large_cave_end mt.Vector[]
---@field [string] mt.Vector[] key format is `"decoration#id"` (see below)
---Decorations keys are in format `"decoration#id"`, where `id` is the
---numeric unique decoration ID as returned by `minetest.get_decoration_id()`.
---For example, `"decoration#123"`.

---@alias mt.MapgenObject
---|mt.VoxelManip
---|mt.HeightMap
---|mt.BiomeMap
---|mt.HeatMap
---|mt.HumidityMap
---|mt.GenNotify
