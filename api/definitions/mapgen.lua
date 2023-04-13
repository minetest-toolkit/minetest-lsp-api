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
---@return mt.Vector
---@return mt.Vector
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

-- A helper class for voxel areas.
--
-- The coordinates are *inclusive*, like most other things in Minetest.
---@class mt.VoxelArea
VoxelArea = {}

-- VoxelArea constructor.
---@param def {MinEdge:mt.Vector, MaxEdge:mt.Vector}
---@return mt.VoxelArea
function VoxelArea:new(def) end

-- VoxelArea constructor.
---@param pmin mt.Vector
---@param pmax mt.Vector
---@return mt.VoxelArea
function VoxelArea(pmin, pmax) end

-- Returns a 3D vector containing the size of the area formed by `MinEdge` and `MaxEdge`.
---@return mt.Vector
function VoxelArea:getExtent() end

-- Returns the volume of the area formed by `MinEdge` and `MaxEdge`.
---@return number
function VoxelArea:getVolume() end

-- Returns the index of an absolute position in a flat array starting at `1`.
---@param x integer
---@param y integer
---@param z integer
---@return integer
function VoxelArea:index(x, y, z) end

-- Returns the index of an absolute position in a flat array starting at `1`.
--
-- As with `index(x, y, z)`, the components of `p` must be integers, and `p`
-- is not checked for being inside the area volume.
---@param p mt.Vector
---@return integer
function VoxelArea:indexp(p) end

-- Returns the absolute position vector corresponding to index `i`.
---@param i integer
---@return mt.Vector
function VoxelArea:position(i) end

-- Check if (`x`,`y`,`z`) is inside area formed by `MinEdge` and `MaxEdge`.
---@param x number
---@param y number
---@param z number
---@return boolean
function VoxelArea:contains(x, y, z) end

-- Check if `p` is inside area formed by `MinEdge` and `MaxEdge`.
---@param p mt.Vector
---@return boolean
function VoxelArea:containsp(p) end

-- Check if index `i` is inside area formed by `MinEdge` and `MaxEdge`.
---@param i integer
---@return boolean
function VoxelArea:containsi(i) end

-- Returns an iterator that returns indexes from (`minx`,`miny`,`minz`)
-- to (`maxx`,`maxy`,`maxz`) in the order of `[z [y [x]]]`.
---@param minx number
---@param miny number
---@param minz number
---@param maxx number
---@param maxy number
---@param maxz number
---@return fun(): integer index
function VoxelArea:iter(minx, miny, minz, maxx, maxy, maxz) end

-- Returns an iterator that returns indexes in the order of `[z [y [x]]]`.
---@param minp mt.Vector
---@param maxp mt.Vector
---@return fun(): integer index
function VoxelArea:iterp(minp, maxp) end

--[[
For a particular position in a voxel area, whose flat array index is known,
it is often useful to know the index of a neighboring or nearby position.
The table below shows the changes of index required for 1 node movements along
the axes in a voxel area:

    Movement    Change of index
    +x          +1
    -x          -1
    +y          +ystride
    -y          -ystride
    +z          +zstride
    -z          -zstride

If, for example:

    local area = VoxelArea(emin, emax)

The values of `ystride` and `zstride` can be obtained using `area.ystride` and
`area.zstride`.
]]
---@alias mt.VoxelAreaStride number

---@type mt.VoxelAreaStride
VoxelArea.ystride = nil

---@type mt.VoxelAreaStride
VoxelArea.zstride = nil

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
