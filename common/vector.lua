---@meta
---Spatial Vectors
------------------

-- Minetest stores 3-dimensional spatial vectors in Lua as tables of 3 coordinates,
-- and has a class to represent them (`vector.*`), which this chapter is about.
-- For details on what a spatial vectors is, please refer to Wikipedia:
-- https://en.wikipedia.org/wiki/Euclidean_vector.
--
-- Spatial vectors are used for various things, including, but not limited to:
--
-- * any 3D spatial vector (x/y/z-directions)
-- * Euler angles (pitch/yaw/roll in radians) (Spatial vectors have no real semantic
--   meaning here. Therefore, most vector operations make no sense in this use case.)
--
-- Note that they are *not* used for:
--
-- * n-dimensional vectors where n is not 3 (ie. n=2)
-- * arrays of the form `{num, num, num}`
--
-- The API documentation may refer to spatial vectors, as produced by `vector.new`,
-- by any of the following notations:
--
-- * `(x, y, z)` (Used rarely, and only if it's clear that it's a vector.)
-- * `vector.new(x, y, z)`
-- * `{x=num, y=num, z=num}` (Even here you are still supposed to use `vector.new`.)
--
-- ### Compatibility notes
--
-- Vectors used to be defined as tables of the form `{x = num, y = num, z = num}`.
-- Since Minetest 5.5.0, vectors additionally have a metatable to enable easier use.
-- Note: Those old-style vectors can still be found in old mod code. Hence, mod and
-- engine APIs still need to be able to cope with them in many places.
--
-- Manually constructed tables are deprecated and highly discouraged. This interface
-- should be used to ensure seamless compatibility between mods and the Minetest API.
-- This is especially important to callback function parameters and functions overwritten
-- by mods.
-- Also, though not likely, the internal implementation of a vector might change in
-- the future.
-- In your own code, or if you define your own API, you can, of course, still use
-- other representations of vectors.
--
-- Vectors provided by API functions will provide an instance of this class if not
-- stated otherwise. Mods should adapt this for convenience reasons.
--
-- ### Special properties of the class
--
-- Vectors can be indexed with numbers and allow method and operator syntax.
--
-- All these forms of addressing a vector `v` are valid:
-- `v[1]`, `v[3]`, `v.x`, `v[1] = 42`, `v.y = 13`
-- Note: Prefer letter over number indexing for performance and compatibility reasons.
--
-- Where `v` is a vector and `foo` stands for any function name, `v:foo(...)` does
-- the same as `vector.foo(v, ...)`, apart from deprecated functionality.
--
-- `tostring` is defined for vectors, see `vector.to_string`.
--
-- The metatable that is used for vectors can be accessed via `vector.metatable`.
-- Do not modify it!
--
-- All `vector.*` functions allow vectors `{x = X, y = Y, z = Z}` without metatables.
-- Returned vectors always have a metatable set.
--
-- ### Operators
--
-- Operators can be used if all of the involved vectors have metatables:
--
-- * `v1 == v2`:
--     * Returns whether `v1` and `v2` are identical.
-- * `-v`:
--     * Returns the additive inverse of v.
-- * `v1 + v2`:
--     * Returns the sum of both vectors.
--     * Note: `+` cannot be used together with scalars.
-- * `v1 - v2`:
--     * Returns the difference of `v1` subtracted by `v2`.
--     * Note: `-` cannot be used together with scalars.
-- * `v * s` or `s * v`:
--     * Returns `v` scaled by `s`.
-- * `v / s`:
--     * Returns `v` scaled by `1 / s`.
---@class mt.Vector
---@field x number
---@field y number
---@field z number
---@field [1] number
---@field [2] number
---@field [3] number
---@operator unm: mt.Vector
---@operator sub(mt.Vector): mt.Vector
---@operator add(mt.Vector): mt.Vector
---@operator mul(number): mt.Vector
---@operator div(number): mt.Vector
vector = {}

---Create a new vector.
---
---Recommendations:
---* Use `vector.zero()` instead of `vector.new()`
---* Use `vector.copy(v)` instead of `vector.new(v)`
---@param x number
---@param y number
---@param z number
---@return mt.Vector
---@nodiscard
function vector.new(x, y, z) end

---Create a new vector `(0, 0, 0)`.
---@return mt.Vector
---@nodiscard
function vector.zero() end

---Returns a copy of the vector `v`.
---@param v mt.Vector
---@return mt.Vector
function vector.copy(v) end

---Returns `v, np`, where `v` is a vector read from the given string `s` and `np` is the next position in the string after the vector.
---Returns `nil` on failure.
---@param s string Has to begin with a substring of the form `"(x, y, z)"`
---@param init? integer If given starts looking for the vector at this string index.
---@return mt.Vector?
---@return integer?
---@nodiscard
function vector.from_string(s, init) end

---Returns a string of the form `"(x, y, z)"`.
---@param v mt.Vector
---@return string
---@nodiscard
function vector.to_string(v) end

---Returns a vector of length 1 with direction `p1` to `p2`.
---
---If `p1` and `p2` are identical, returns `(0, 0, 0)`.
---@param p1 mt.Vector
---@param p2 mt.Vector
---@return mt.Vector
---@nodiscard
function vector.direction(p1, p2) end

---Returns zero or a positive number, the distance between `p1` and `p2`.
---@param p1 mt.Vector
---@param p2 mt.Vector
---@return number
---@nodiscard
function vector.distance(p1, p2) end

---Returns zero or a positive number, the length of vector `v`.
---@param v mt.Vector
---@return number
---@nodiscard
function vector.length(v) end

---Returns a vector of length 1 with direction of vector `v`.
---
---If `v` has zero length, returns `(0, 0, 0)`.
---@param v mt.Vector
---@return mt.Vector
---@nodiscard
function vector.normalize(v) end

---Returns a vector, each dimension rounded down.
---@param v mt.Vector
---@return mt.Vector
---@nodiscard
function vector.floor(v) end

---Returns a vector, each dimension rounded to nearest integer.
---
---At a multiple of `0.5`, rounds away from zero.
---@param v mt.Vector
---@return mt.Vector
---@nodiscard
function vector.round(v) end

---Returns a vector where the function `func` has been applied to each component.
---@param v mt.Vector
---@param func fun(i: number):number
---@return mt.Vector
---@nodiscard
function vector.apply(v, func) end

---Returns a boolean, `true` if the vectors are identical.
---@param a mt.Vector
---@param b mt.Vector
---@return boolean
---@nodiscard
function vector.equals(a, b) end

---Returns in order `minp`, `maxp` vectors of the cuboid defined by `v1`, `v2`.
---@param v1 mt.Vector
---@param v2 mt.Vector
---@return mt.Vector minp
---@return mt.Vector maxp
---@nodiscard
function vector.sort(v1, v2) end

---Returns the angle between `v1` and `v2` in radians.
---@param v1 mt.Vector
---@param v2 mt.Vector
---@return number
---@nodiscard
function vector.angle(v1, v2) end

---Returns the dot product of `v1` and `v2`.
---@param v1 mt.Vector
---@param v2 mt.Vector
---@return number
function vector.dot(v1, v2) end

---Returns the cross product of `v1` and `v2`.
---@param v1 mt.Vector
---@param v2 mt.Vector
---@return mt.Vector
---@nodiscard
function vector.cross(v1, v2) end

---Returns the sum of the vectors `v` and `(x, y, z)`.
---@param v mt.Vector
---@param x number
---@param y number
---@param z number
---@return mt.Vector
---@nodiscard
function vector.offset(v, x, y, z) end

---Returns a boolean value indicating whether `v` is a real vector, eg. created by a `vector.*` function.
---
---Returns `false` for anything else, including tables like `{x=3,y=1,z=4}`.
---@param v mt.Vector
---@return boolean
---@nodiscard
function vector.check(v) end

---If `x` is a vector: Returns the sum of `v` and `x`.
---
---If `x` is a number: Adds `x` to each component of `v`.
---@param v mt.Vector
---@param x mt.Vector | number
---@return mt.Vector
---@nodiscard
function vector.add(v, x) end

---If `x` is a vector: Returns the difference of `v` subtracted by `x`.
---
---If `x` is a number: Subtracts `x` from each component of `v`.
---@param v mt.Vector
---@param x mt.Vector | number
---@return mt.Vector
---@nodiscard
function vector.subtract(v, x) end

---Returns a scaled vector.
---@param v mt.Vector
---@param s number
---@return mt.Vector
---@nodiscard
function vector.multiply(v, s) end

---Returns a scaled vector.
---@param v mt.Vector
---@param s number
---@return mt.Vector
---@nodiscard
function vector.divide(v, s) end

---Applies the rotation `r` (in radians) to `v` and returns the result.
---@param v mt.Vector
---@param r number
---@return mt.Vector
---@nodiscard
function vector.rotate(v, r) end

---Returns `v1` rotated around axis `v2` by `a` radians according to the right hand rule.
---@param v1 mt.Vector
---@param v2 mt.Vector
---@param a number
---@return mt.Vector
---@nodiscard
function vector.rotate_around_axis(v1, v2, a) end

---Returns a rotation vector for `direction` pointing forward using `up` as the up vector.
---
---If `up` is omitted, the roll of the returned vector defaults to zero.
---
---Otherwise `direction` and `up` need to be vectors in a 90 degree angle to each other.
---@param direction mt.Vector
---@param up? mt.Vector
---@return mt.Vector
---@nodiscard
function vector.dir_to_rotation(direction, up) end
