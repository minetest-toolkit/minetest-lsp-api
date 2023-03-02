---@meta
---AreaStore
------------

-- AreaStore is a data structure to calculate intersections of 3D cuboid volumes
-- and points.
--
-- Despite its name, mods must take care of persisting AreaStore data.
-- They may use the provided load and write functions for this.
---@class mt.AreaStore
---@field data string Mod-relevant information to the specified area.
---@operator call: fun(type_name:string|nil):mt.AreaStore
local AreaStore = {}

---@alias mt.AreaID string|number

---@class mt.AreaInfo
---@field min mt.Vector|nil Position (if `include_corners` == `true`).
---@field max mt.Vector|nil Position (if `include_corners` == `true`).
---@field data string|nil (if `include_data` == `true`)

-- * Returns the area information about the specified ID.
-- * Returns nil if area not found.
-- * Returns boolean if `include_corners` and `include_data` are not true.
---@param id mt.AreaID
---@param include_corners boolean|nil
---@param include_data boolean|nil
---@return nil|true|mt.AreaInfo
function AreaStore:get_area(id, include_corners, include_data) end

-- Returns all areas as table, indexed by the area ID.
---@param pos mt.Vector
---@param include_corners boolean|nil
---@param include_data boolean|nil
---@return table<mt.AreaID, mt.AreaInfo>
function AreaStore:get_areas_for_pos(pos, include_corners, include_data) end

-- Returns all areas that contain all nodes inside the area specified by
-- `corner1` and `corner2` (inclusive).
---@param corner1 mt.Vector
---@param corner2 mt.Vector
---@param accept_overlap boolean|nil If `true`, areas are returned that have nodes in common (intersect) with the specified area.
---@param include_corners boolean|nil
---@param include_data boolean|nil
---@return table<mt.AreaID, mt.AreaInfo>
function AreaStore:get_areas_in_area(corner1, corner2, accept_overlap, include_corners, include_data) end

-- * Returns the new area's ID, or nil if the insertion failed.
-- * The (inclusive) positions `corner1` and `corner2` describe the area.
---@param corner1 mt.Vector
---@param corner2 mt.Vector
---@param data string
---@param id mt.AreaID|nil Will be used as the internal area ID if it is an unique number between 0 and 2^32-2.
---@return mt.AreaID|nil
function insert_area(corner1, corner2, data, id) end

-- * Requires SpatialIndex, no-op function otherwise.
-- * Reserves resources for `count` many contained areas to improve efficiency
--   when working with many area entries. Additional areas can still be inserted
--   afterwards at the usual complexity.
---@param count number|function
function AreaStore:reserve(count) end

-- Removes the area with the given id from the store, returns success.
---@param id mt.AreaID
---@return boolean
function AreaStore:remove_area(id) end

---@class mt.AreaCacheParams
-- Whether to enable, default `true`.
---@field enabled boolean
-- The radius (in nodes) of the areas the cache enerates prefiltered lists for,
-- minimum 16, default 64.
---@field block_radius integer
-- The cache size, minimum 20, default 1000
---@field limit integer

-- Sets params for the included prefiltering cache.
-- Calling invalidates the cache, so that its elements have to be newly generated.
---@param params mt.AreaCacheParams
function AreaStore:set_cache_params(params) end

-- Experimental. Returns area store serialized as a (binary) string.
---@return string
function AreaStore:to_string() end

-- Experimental. Like `to_string()`, but writes the data to a file.
---@param filename string
function AreaStore:to_file(filename) end

-- Experimental. Deserializes string and loads it into the
-- AreaStore. Returns success and, optionally, an error message.
---@param str string
---@return boolean success, string|nil error
function AreaStore:from_string(str) end

-- Experimental. Like `from_string()`, but reads the data from a file.
---@param filename string
---@return unknown
function AreaStore:from_file(filename) end
