---@meta
---PerlinNoise and PerlinNoiseMap
---------------------------------

-- FIXME: No documentation provided.
---@class mt.PerlinNoiseParams

-- A perlin noise generator. It can be created via `PerlinNoise()` or
-- `minetest.get_perlin()`. For `minetest.get_perlin()`, the actual seed used is
-- the noiseparams seed plus the world seed, to create world-specific noise.
---@class mt.PerlinNoise
-- Returns 2D noise value at `pos={x=,y=}`.
---@field get_2d fun(pos:mt.Vector): mt.PerlinNoise
-- Returns 3D noise value at `pos={x=,y=,z=}`.
---@field get_3d fun(pos:mt.Vector): mt.PerlinNoise

---@overload fun(seeddiff, octaves, persistence, spread):mt.PerlinNoise Deprecated.
---@param noiseparams mt.PerlinNoiseParams
---@return mt.PerlinNoise
function PerlinNoise(noiseparams) end

---@overload fun(seeddiff, octaves, persistence, spread):mt.PerlinNoise Deprecated.
---@param noiseparams mt.PerlinNoiseParams
---@return mt.PerlinNoise
function minetest.get_perlin(noiseparams) end

-- A fast, bulk perlin noise generator.
--
-- It can be created via `PerlinNoiseMap(noiseparams, size)` or
-- `minetest.get_perlin_map(noiseparams, size)`. For `minetest.get_perlin_map()`,
-- the actual seed used is the noiseparams seed plus the world seed, to create
-- world-specific noise.
---@class mt.PerlinNoiseMap
local map

-- Returns a `<size.x>` times `<size.y>` 2D array of 2D noise
-- with values starting at `pos={x=,y=}`.
---@param pos mt.Vector
---@return mt.PerlinNoise[]
function map:get_2d_map(pos) end

-- Returns a `<size.x>` times `<size.y>` times `<size.z>` 3D array of 3D noise
-- with values starting at `pos={x=,y=,z=}`.
---@param pos mt.Vector
---@return mt.PerlinNoise[][]
function map:get_3d_map(pos) end

-- Returns a flat `<size.x * size.y>` element array of 2D noise
-- with values starting at `pos={x=,y=}`.
---@param pos mt.Vector
-- If `buffer` is not nil, this table will be used to store the result
-- instead of creating a new table.
---@param buffer mt.PerlinNoise[]|nil
---@return mt.PerlinNoise[]
function map:get_2d_map_flat(pos, buffer) end

-- Returns a flat `<size.x * size.y * size.z>` element array of 3D noise
-- with values starting at `pos={x=,y=,z=}`.
---@param pos mt.Vector
-- If `buffer` is not nil, this table will be used to store the result
-- instead of creating a new table.
---@param buffer mt.PerlinNoise[]|nil
---@return mt.PerlinNoise[]
function map:get_3d_map_flat(pos, buffer) end

-- Calculates the 2d noise map starting at `pos`.
-- The result is stored internally.
---@param pos mt.Vector
function map:calc_2d_map(pos) end

-- Calculates the 3d noise map starting at `pos`.
-- The result is stored internally.
---@param pos mt.Vector
function map:calc_3d_map(pos) end

-- In the form of an array,
-- returns a slice of the most recently computed noise results. The result slice
-- begins at coordinates `slice_offset` and takes a chunk of `slice_size`. E.g.
-- to grab a 2-slice high horizontal 2d plane of noise starting at buffer offset
-- y = 20: `noisevals = noise:get_map_slice({y=20}, {y=2})` It is important to
-- note that `slice_offset` offset coordinates begin at 1, and are relative to
-- the starting position of the most recently calculated noise. To grab a single
-- vertical column of noise starting at map coordinates x = 1023, y=1000, z =
-- 1000: `noise:calc_3d_map({x=1000, y=1000, z=1000})`
-- `noisevals = noise:get_map_slice({x=24, z=1}, {x=1, z=1})`
---@param slice_offset mt.Vector
---@param slice_size mt.Vector
---@param buffer mt.PerlinNoise[]|nil
---@return mt.PerlinNoise[]
function map:get_map_slice(slice_offset, slice_size, buffer) end

---@param noiseparams mt.PerlinNoiseParams
-- Format of `size` is `{x=dimx, y=dimy, z=dimz}`. The `z` component is omitted for
-- 2D noise, and it must be must be larger than 1 for 3D noise (otherwise `nil` is
-- returned).
---@param size mt.Vector
-- If `buffer` is not nil, this table will be used to store the result
-- instead of creating a new table.
---@param buffer mt.PerlinNoiseMap|nil
---@return mt.PerlinNoiseMap
function PerlinNoiseMap(noiseparams, size, buffer) end

---@param noiseparams mt.PerlinNoiseParams
-- Format of `size` is `{x=dimx, y=dimy, z=dimz}`. The `z` component is omitted for
-- 2D noise, and it must be must be larger than 1 for 3D noise (otherwise `nil` is
-- returned).
---@param size mt.Vector
-- If `buffer` is not nil, this table will be used to store the result
-- instead of creating a new table.
---@param buffer mt.PerlinNoiseMap|nil
---@return mt.PerlinNoiseMap
function minetest.get_perlin_map(noiseparams, size, buffer) end
