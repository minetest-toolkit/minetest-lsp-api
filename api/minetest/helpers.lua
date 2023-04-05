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
---@param tolerance number Default: 0
---@return -1|0|1
function math.sign(x, tolerance) end
