---@meta
---ABM (ActiveBlockModifier) definition
---------------------------------------

---Used by `minetest.register_abm`.
---@class mt.ABMDef
-- Descriptive label for profiling purposes (optional).
-- Definitions with identical labels will be listed as one.
---@field label string|nil
-- Apply `action` function to these nodes.
-- `group:groupname` can also be used here.
---@field nodenames string[]
-- Only apply `action` to nodes that have one of, or any
-- combination of, these neighbors.
-- If left out or empty, any neighbor will do.
-- `group:groupname` can also be used here.
---@field neighbors string[]
---@field interval number Operation interval in seconds.
-- Chance of triggering `action` per-node per-interval is 1.0 / this value
---@field chance number
-- Min height level where ABM will be processed can be used to reduce CPU usage.
---@field min_y number
-- Max height level where ABM will be processed can be used to reduce CPU usage.
---@field max_y number
-- If true, catch-up behavior is enabled: The `chance` value is
-- temporarily reduced when returning to an area to simulate time lost
-- by the area being unattended. Note that the `chance` value can often
-- be reduced to 1.
---@field catch_up boolean
local abm = {}

-- Function triggered for each qualifying node.
--
-- If any neighboring mapblocks are unloaded an estmate is calculated for them
-- based on loaded mapblocks.
---@param pos mt.Vector
---@param node mt.Node
---@param active_object_count number Active objects in the node's mapblock.
---@param active_object_count_wider number  Plus all 26 neighboring mapblocks.
function abm.action(pos, node, active_object_count, active_object_count_wider) end
