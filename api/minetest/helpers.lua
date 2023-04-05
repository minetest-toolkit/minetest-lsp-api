---@meta
---Helper functions
-------------------

-- Returns a string which makes `obj` human-readable.
---@param obj any
---@param dumped table|nil Default: `{}`.
function dump(obj, dumped) end

-- Returns a string which makes `obj` human-readable, handles reference loops.
---@param obj any
---@param name string|nil Default: `"_"`.
---@param dumped table|nil Default: `{}`.
function dump2(obj, name, dumped) end

-- Get the hypotenuse of a triangle with legs x and y. Useful for distance
-- calculation.
---@param x mt.Vector
---@param y mt.Vector
---@return number
function math.hypot(x, y) end

-- Get the sign of a number.
--
-- If the absolute value of `x` is within the `tolerance` or `x` is NaN, `0` is
-- returned.
---@param x number
---@param tolerance number Default: `0`
---@return -1|0|1
function math.sign(x, tolerance) end

---@param x number
---@return  number
function math.factorial(x) end

-- `"a,b":split","` returns `{"a", "b"}`.
---@param str string
---@param separator string|nil Default: `","`.
---@param include_empty boolean|nil Default: `false`.
---@param max_splits number|nil If it's negative, splits aren't limited. Default: `-1`.
---@param sep_is_pattern boolean|nil Is separator a plain string or a pattern? Default: `false`.
---@return string[]
function string.split(str, separator, include_empty, max_splits, sep_is_pattern) end

-- Returns the string without whitespace pre- and suffixes.
-- - e.g. `"\n \t\tfoo bar\t ":trim()` returns `"foo bar"`
---@return string
function string:trim() end

-- Adds newlines to the string to keep it within the specified character limit
--
-- Note that the returned lines may be longer than the limit since it only
-- splits at word borders.
---@param str string
---@param limit number Maximal amount of characters in one line.
---@param as_table boolean|nil If `true`, a table of lines instead of a string is returned, default: `false`.
---@return string|table
function minetest.wrap_text(str, limit, as_table) end

-- Convert a vector to human-readable string `"(X,Y,Z)"`.
---@param pos mt.Vector
---@param decimal_places number|nil If specified, the x, y and z values of the position are rounded to the given decimal place.
---@return string
function minetest.pos_to_string(pos, decimal_places) end

-- Convert a string like `"(X,Y,Z)"` to a vector.
--
-- If string can't be parsed to a position, nothing is returned.
---@return mt.Vector|nil
function minetest.string_to_pos(string) end

--[[
Convert a string like `"(X1, Y1, Z1) (X2, Y2, Z2)"` to two vectors - box angles.

- `relative_to`: Optional. If set to a position, each coordinate can use the
  tilde notation for relative positions.
- Tilde notation: `"~"`: Relative coordinate `"~<number>"`: Relative coordinate
  plus `<number>`.
- Example: `minetest.string_to_area("(1,2,3) (~5,~-5,~)", {x=10,y=10,z=10})`
  returns `{x=1,y=2,z=3}, {x=15,y=5,z=10}`.
]]
---@param str string
---@param relative_to mt.Vector|nil
---@return mt.Vector, mt.Vector
function minetest.string_to_area(str, relative_to) end

-- Escapes the characters `"["`, `"]"`, `"\"`, `","` and `";"`,
-- which can not be used in formspecs.
---@param str string
---@return string
function minetest.formspec_escape(str) end

-- Returns true if passed 'y', 'yes', 'true' or a number that isn't zero.
---@param arg any
---@return boolean
function minetest.is_yes(arg) end

-- Returns true when the passed number represents NaN.
---@param arg any
---@return boolean
function minetest.is_nan(arg) end

-- Returns time with microsecond precision. May not return wall time.
---@return number
function minetest.get_us_time() end

-- Returns a deep copy of `t`.
---@generic T:table
---@param t T
---@return T
function table.copy(t) end

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
