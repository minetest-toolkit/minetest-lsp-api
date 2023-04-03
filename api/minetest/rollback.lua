---@meta
---Rollback
-----------

-- Used in `minetest.rollback_get_node_actions`.
---@class mt.RollbackAction
---@field actor string `"player:<name>"`, also `"liquid"`.
---@field pos mt.Vector
---@field time number
---@field oldnode mt.Node
---@field newnode mt.Node

-- Finds who has done something to a node, or near a node.
---@param pos mt.Vector
---@param range integer
---@param seconds number
---@param limit integer Maximum number of actions to search.
---@return mt.RollbackAction[]
function minetest.rollback_get_node_actions(pos, range, seconds, limit) end

---@param actor string `"player:<name>"`, also `"liquid"`.
---@param seconds number
---@return boolean, string log_messages
function minetest.rollback_revert_actions_by(actor, seconds) end
