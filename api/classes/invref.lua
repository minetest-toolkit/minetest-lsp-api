---@meta
---InvRef
---------

-- An `InvRef` is a reference to an inventory.
--
-- When a player tries to put an item to a place where another item is, the items are *swapped*.
-- This means that all callbacks will be called twice (once for each action).
---@class mt.InvRef
local InvRef = {}

---Return `true` if list is empty.
---@param listname string
---@return boolean
function InvRef:is_empty(listname) end

---Get size of a list.
---@param listname string
---@return integer
function InvRef:get_size(listname) end

---* Set size of a list.
---* Returns `false` on error (e.g. invalid `listname` or `size`).
---@param listname string
---@param size integer
---@return boolean success
function InvRef:set_size(listname, size) end

---Get width of a list.
---@param listname string
---@return integer
function InvRef:get_width(listname) end

---Set width of list; currently used for crafting.
---@param listname string
---@param width integer
function InvRef:set_width(listname, width) end

---Get a copy of stack index in list.
---@param listname string
---@param index integer
---@return mt.ItemStack
function InvRef:get_stack(listname, index) end

---Copy `stack` to index in list.
---@param listname string
---@param index integer
---@param stack mt.Item
function InvRef:set_stack(listname, index, stack) end

---Return full list (list of `ItemStack`s).
---@param listname string
---@return mt.ItemStack[]
function InvRef:get_list(listname) end

---Set full list (size will not change).
---@param listname string
---@param list mt.Item[]
function InvRef:set_list(listname, list) end

---Returns table that maps listnames to inventory lists.
---@return table lists
function InvRef:get_lists() end

---Sets inventory lists (size will not change).
---@param lists table
function InvRef:set_lists(lists) end

---Add item somewhere in list, returns leftover `ItemStack`.
---@param listname string
---@param stack mt.ItemStack
---@return mt.ItemStack leftover
function InvRef:add_item(listname, stack) end

---Returns `true` if the stack of items can be fully added to the list.
---@param listname string
---@param stack mt.Item
---@return boolean
function InvRef:room_for_item(listname, stack) end

---* Returns `true` if the stack of items can be fully taken from the list.
---* If `match_meta` is false (default), only the items' names are compared.
---@param listname string
---@param stack mt.Item
---@param match_meta boolean|nil `false` Only compares names if unset.
---@return boolean
function InvRef:contains_item(listname, stack, match_meta) end

---* Take as many items as specified from the
---  list, returns the items that were actually removed (as an `ItemStack`).
---* Note that any item metadata is ignored, so attempting to remove a specific
---  unique item this way will likely remove the wrong one -- to do that use
---  `set_stack` with an empty `ItemStack`.
---@param listname string
---@param stack mt.Item
---@return mt.ItemStack
function InvRef:remove_item(listname, stack) end

---* Returns a location compatible to `minetest.get_inventory(location)`.
---* Returns `{type="undefined"}` in case location is not known.
---@return table
function InvRef:get_location() end

-- * Moving items in the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_move() end

-- * Moving items in the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_metadata_inventory_move() end

-- * Taking items from the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_take() end

-- * Taking items from the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_metadata_inventory_take() end

-- * Putting items to the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_put() end

-- * Putting items to the inventory.
-- * The `allow_*` callbacks return how many items can be moved.
-- * This callback triggered `before` the action.
function InvRef:allow_metadata_inventory_put() end

-- * Moving items in the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_move() end

-- * Moving items in the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_metadata_inventory_move() end

-- * Taking items from the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_take() end

-- * Taking items from the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_metadata_inventory_take() end

-- * Putting items to the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_put() end

-- * Putting items to the inventory.
-- * The `on_*` callbacks are called after the items have been placed in the inventories.
-- * This callback triggered `after` the action.
function InvRef:on_metadata_inventory_put() end
