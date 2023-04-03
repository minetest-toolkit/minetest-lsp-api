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

---Async environment
--------------------

-- Queue the function `func` to be ran in an async environment.
--
-- Note that there are multiple persistent workers and any of them may end up
-- running a given job.
--
-- The engine will scale the amount of worker threads automatically.
--
-- When `func` returns, the callback is called (in the normal environment)
-- with all of the return values as arguments.
---@param func function
---@param callback fun(...: any): any
---@param ... unknown Variable number of arguments that are passed to `func`.
function minetest.handle_async(func, callback, ...) end

-- Register a path to a Lua file to be imported
-- when an async environment is initialized.
--
-- You can use this to preload code which you can then call later
-- using `minetest.handle_async()`.
---@param path string
function minetest.register_async_dofile(path) end
