---@meta
---Inventory
------------

---@class mt.InvLocation
---@field type "player"|"node"|"detached"
---@field name string|nil
---@field pos mt.Vector|nil

---@param location mt.InvLocation
---@return mt.InvRef
function minetest.get_inventory(location) end

-- Creates a detached inventory. If it already exists, it is cleared.
--
-- `player_name`: Make detached inventory available to one player
-- exclusively, by default they will be sent to every player (even if not used).
-- Note that this parameter is mostly just a workaround and will be removed
-- in future releases.
---@param name string
---@param callbacks mt.DetachedInvDef
---@param player_name string|nil
---@return mt.InvRef
function minetest.create_detached_inventory(name, callbacks, player_name) end

---@param name string
---@return boolean success
function minetest.remove_detached_inventory(name) end

---@param hp_change integer
---@param replace_with_item mt.ItemStack
---@param itemstack mt.ItemStack
---@param user mt.ObjectRef
---@param pointed_thing mt.PointedThing
---@return mt.ItemStack leftover
function minetest.do_item_eat(hp_change, replace_with_item, itemstack, user, pointed_thing) end
