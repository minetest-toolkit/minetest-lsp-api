---@meta
---Detached inventory callbacks
-------------------------------

-- Used by `minetest.create_detached_inventory`.
---@class mt.DetachedInvDef
local did = {}

-- Called when a player wants to move items inside the inventory.
--
-- * Moving items in the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param inv mt.InvRef
---@param from_list string
---@param from_index number
---@param to_list string
---@param to_index number
---@param count number
---@param player mt.PlayerObjectRef
---@return number items_allowed_count
function did.allow_move(inv, from_list, from_index, to_list, to_index, count, player) end

-- Called when a player wants to move items inside the inventory.
--
-- * Return value: number of items allowed to move.
-- * Moving items in the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param pos mt.Vector
---@param from_list unknown
---@param from_index integer
---@param to_list unknown
---@param to_index integer
---@param count integer
---@param player mt.ObjectRef
---@return integer allowed
function did.allow_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * Moving items in the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
---@param inv mt.InvRef
---@param from_list string
---@param from_index number
---@param to_list string
---@param to_index number
---@param count number
---@param player mt.PlayerObjectRef
function did.on_move(inv, from_list, from_index, to_list, to_index, count, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * No return value.
---@param pos mt.Vector
---@param from_list unknown
---@param from_index integer
---@param to_list unknown
---@param to_index integer
---@param count integer
---@param player mt.ObjectRef
function did.on_metadata_inventory_move(pos, from_list, from_index, to_list, to_index, count, player) end

-- Called when a player wants to put something into the inventory.
--
-- * Putting items to the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param inv mt.InvRef
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.PlayerObjectRef
-- If `-1`: Allow and don't modify item count in inventory.
---@return number items_allowed_count
function did.allow_put(inv, listname, index, stack, player) end

-- Called when a player wants to put something into the inventory.
--
-- * Return value: number of items allowed to put.
-- * Return value -1: Allow and don't modify item count in inventory.
-- * Putting items to the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
---@return integer allowed
function did.allow_metadata_inventory_put(pos, listname, index, stack, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * Putting items to the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
---@param inv mt.InvRef
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.PlayerObjectRef
function did.on_put(inv, listname, index, stack, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * No return value.
-- * Moving items in the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
function did.on_metadata_inventory_put(pos, listname, index, stack, player) end

-- Called when a player wants to take something out of the inventory.
--
-- * Taking items from the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param inv mt.InvRef
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.PlayerObjectRef
-- If `-1`: Allow and don't modify item count in inventory.
---@return number items_allowed_count
function did.allow_take(inv, listname, index, stack, player) end

-- Called when a player wants to take something out of the inventory.
--
-- * Return value: number of items allowed to take.
-- * Return value -1: Allow and don't modify item count in inventory.
-- * Taking items from the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
---@return integer allowed
function did.allow_metadata_inventory_take(pos, listname, index, stack, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * Taking items from the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
---@param inv mt.InvRef
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.PlayerObjectRef
function did.on_take(inv, listname, index, stack, player) end

-- Called after the actual action has happened, according to what was allowed.
--
-- * No return value.
-- * Taking items from the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
function did.on_metadata_inventory_take(pos, listname, index, stack, player) end
