---@meta
---NodeTimerRef
---------------

-- Node Timers: a high resolution persistent per-node timer. Can be gotten via
-- `minetest.get_node_timer(pos)`.
---@class mt.NodeTimerRef
local NodeTimerRef

-- - Set a timer's state.
-- - Will trigger the node's `on_timer` function after `(timeout - elapsed)`
--   seconds.
---@param timeout number is in seconds, and supports fractional values (0.1 etc)
---@param elapsed number is in seconds, and supports fractional values (0.1 etc)
function NodeTimerRef:set(timeout, elapsed) end

-- - Start a timer.
-- - Equivalent to `set(timeout, 0)`.
---@param timeout number is in seconds, and supports fractional values (0.1 etc)
function NodeTimerRef:start(timeout) end

-- Stops the timer.
function NodeTimerRef:stop() end

-- Returns current timeout in seconds.
--
-- - If `timeout` equals `0`, timer is inactive.
---@return number
function NodeTimerRef:get_timeout() end

-- Returns current elapsed time in seconds.
--
-- - The node's `on_timer` function will be called after `(timeout - elapsed)` seconds.
---@return number
function NodeTimerRef:get_elapsed() end

-- Returns boolean state of timer.
--
-- - Returns `true` if timer is started, otherwise `false`.
---@return boolean
function NodeTimerRef:is_started() end
