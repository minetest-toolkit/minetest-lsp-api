---@meta
---PseudoRandom
---------------

--[[
A 16-bit pseudorandom number generator. Uses a well-known LCG algorithm
introduced by K&R.

It can be created via `PseudoRandom(seed)`.
]]
---@class mt.PseudoRandom
local PseudoRandom

---@cast PseudoRandom +fun(seed:number):mt.PseudoRandom

-- Return next integer random number.
--
-- `((max - min) == 32767) or ((max-min) <= 6553))`
-- must be true due to the simple implementation
-- making bad distribution otherwise.
---@param min number|nil Default: `0`
---@param max number|nil Default: `32767`
function PseudoRandom:next(min, max) end
