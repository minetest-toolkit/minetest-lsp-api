---@meta
---Timing
---------

-- Returned by `minetest.after`.
---@class mt.Job
local job = {}

-- Cancels the job function from being called.
function job:cancel() end

-- Call the function `func` after `time` seconds, may be fractional.
---@param time number
---@param func function
---@param ... unknown Arguments that will be passed to `func`.
---@return mt.Job
function minetest.after(time, func, ...) end
