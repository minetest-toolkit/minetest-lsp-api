---@meta
---Global objects
-----------------

-- `EnvRef` of the server environment and world.
-- - Any function in the minetest namespace can be called using the syntax
--   `minetest.env:somefunction(somearguments)` instead of
--   `minetest.somefunction(somearguments)`
-- - Deprecated, but support is not to be dropped soon.
---@type mt.Core
minetest.env = nil

---Global callback registration functions
-----------------------------------------

---Register a function that will be called every server step, usually interval of 0.1s
---@param func fun(dtime: number)
function minetest.register_globalstep(func) end

---Map of registered globalsteps.
---@type fun(dtime: number)[]
minetest.registered_globalsteps = {}

---Register a function that will be called after mods have finished loading and before the media is cached or the aliases handled.
---@param func fun()
function minetest.register_on_mods_loaded(func) end

---Map of registered on_mods_loaded.
---@type fun()[]
minetest.registered_on_mods_loaded = {}

---Register a function that will be called before server shutdown.
---
---**Warning**: If the server terminates abnormally (i.e. crashes), the registered callbacks **will likely not be run**.
---
---Data should be saved at semi-frequent intervals as well as on server shutdown.
---@param func fun()
function minetest.register_on_shutdown(func) end

---Map of registered on_shutdown.
---@type fun()[]
minetest.registered_on_shutdown = {}

---Register a function that will be called when a node has been placed.
---
---If return `true` no item is taken from `itemstack`
---
---**Not recommended**: use `on_construct` or `after_place_node` in node definition then possible.
---@param func fun(pos: mt.Vector, newnode: mt.Node, placer?: mt.ObjectRef, oldnode: mt.Node, itemstack: mt.Item, pointed_thing: mt.PointedThing): boolean|nil
function minetest.register_on_placenode(func) end

---Map of registered on_placenode.
---@type (fun(pos: mt.Vector, newnode: mt.Node, placer?: mt.ObjectRef, oldnode: mt.Node, itemstack: mt.Item, pointed_thing: mt.PointedThing): boolean|nil)[]
minetest.registered_on_placenodes = {}

---Register a function that will be called when a node has been dug.
---
---**Not recommended**: use `on_destruct` or `after_dig_node` in node definition then possible.
---@param func fun(pos: mt.Vector, oldnode: mt.Node, digger: mt.ObjectRef)
function minetest.register_on_dignode(func) end

---Map of registered on_dignode.
---@type fun(pos: mt.Vector, oldnode: mt.Node, digger: mt.ObjectRef)[]
minetest.registered_on_dignodes = {}

---Register a function that will be called when a node has been punched.
---@param func fun(pos: mt.Vector, node: mt.Node, puncher: mt.ObjectRef, pointed_thing: mt.PointedThing)
function minetest.register_on_punchnode(func) end

---Map of registered on_punchnode.
---@type fun(pos: mt.Vector, node: mt.Node, puncher: mt.ObjectRef, pointed_thing: mt.PointedThing)[]
minetest.registered_on_punchnodes = {}

---Register a function that will be called when a piece of world has been generated.
---
---Modifying nodes inside the area is a bit faster than usually.
---@param func fun(minp: integer, maxp: integer, blockseed: integer)
function minetest.register_on_generated(func) end

---Map of registered on_generated.
---@type fun(minp: integer, maxp: integer, blockseed: integer)[]
minetest.registered_on_generateds = {}

---Register a function that will be called when a player join for the first time.
---@param func fun(player: mt.PlayerObjectRef)
function minetest.register_on_newplayer(func) end

---Map of registered on_newplayer.
---@type fun(player: mt.PlayerObjectRef)[]
minetest.registered_on_newplayers = {}

---Register a function that will be called when a player is punched.
---
---Note: This callback is invoked even if the punched player is dead.
---
---Callback should return `true` to prevent the default damage mechanism.
---@param func fun(player: mt.PlayerObjectRef, hitter: mt.ObjectRef, time_from_last_punch: number, tool_capabilities: mt.ToolCaps, dir: mt.Vector, damage: number): boolean|nil
function minetest.register_on_punchplayer(func) end

---Map of registered on_punchplayer.
---@type (fun(player: mt.PlayerObjectRef, hitter: mt.ObjectRef, time_from_last_punch: number, tool_capabilities: mt.ToolCaps, dir: mt.Vector, damage: number): boolean)[]
minetest.registered_on_punchplayers = {}

---Register a function that will be called when a player is rightclicked (the `place/use` key was used while pointing a player).
---@param func fun(player: mt.PlayerObjectRef, clicker: mt.ObjectRef)
function minetest.register_on_rightclickplayer(func) end

---Map of registered on_rightclickplayer.
---@type fun(player: mt.PlayerObjectRef, clicker: mt.ObjectRef)[]
minetest.registered_on_rightclickplayers = {}

---Register a function that will be called when a player is damaged or healed.
---@param func fun(player: mt.PlayerObjectRef, hp_change: integer, reason: mt.PlayerHPChangeReason): integer?, boolean?
---@param modifier boolean  When true, the function should return the actual `hp_change`.
---Note: modifiers only get a temporary `hp_change` that can be modified by later modifiers.
---
---Modifiers can return true as a second argument to stop the execution of further functions.
---
---Non-modifiers receive the final HP change calculated by the modifiers.
function minetest.register_on_player_hpchange(func, modifier) end

---@class mt.PlayerHPChangeReason
---@field type
-- A mod or the engine called `set_hp` without giving a type -
-- use this for custom damage types.
---|"set_hp"
-- Was punched. `reason.object` will hold the puncher, or nil if none.
---|"punch"
---|"fall"
-- `damage_per_second` from a neighboring node.
---|"node_damage"
---|"drown"
---|"respawn"
---@field object mt.ObjectRef|nil
---@field node string|nil node name
---@field from
---|"mod"
---|"engine"
-- When true, the function should return the actual `hp_change`.
--
-- Note: modifiers only get a temporary `hp_change` that can be modified by
-- later modifiers. Modifiers can return true as a second argument to stop the
-- execution of further functions. Non-modifiers receive the final HP change
-- calculated by the modifiers.
---@field modifier boolean

---Map of registered on_player_hpchange.
---@type {modifiers: (fun(player: mt.PlayerObjectRef, hp_change: integer, reason: mt.PlayerHPChangeReason): integer?, boolean?)[], loggers: (fun(player: mt.PlayerObjectRef, hp_change: integer, reason: mt.PlayerHPChangeReason): integer?, boolean?)[]}
minetest.registered_on_player_hpchanges = { modifiers = {}, loggers = {} }

---Register a function that will be called when a player dies.
---@param func fun(player: mt.PlayerObjectRef, reason: mt.PlayerHPChangeReason)
function minetest.register_on_dieplayer(func) end

---Map of registered on_dieplayers.
---@type fun(player: mt.PlayerObjectRef, reason: mt.PlayerHPChangeReason)[]
minetest.registered_on_dieplayers = {}

---Register a function that will be called when a player is to be respawned.
---
---Called **before** repositioning of player occurs.
---
---Return `true` in func to disable regular player placement.
---@param func fun(player: mt.PlayerObjectRef): boolean|nil
function minetest.register_on_respawnplayer(func) end

---Map of registered on_respawnplayer.
---@type (fun(player: mt.PlayerObjectRef): boolean|nil)[]
minetest.registered_on_respawnplayers = {}

---Register a function that will be called when a client connects to the server, prior to authentication.
---
---If it returns a string, the client is disconnected with that string as reason.
---@param func fun(name: string, ip: string): string
function minetest.register_on_prejoinplayer(func) end

---Map of registered on_prejoinplayer.
---@type (fun(name: string, ip: string): string)[]
minetest.registered_on_prejoinplayers = {}

---Register a function that will be called when a player joined.
---
---`last_login`: The timestamp of the previous login, or `nil` if player is new
---@param func fun(player: mt.PlayerObjectRef, last_login?: integer)
function minetest.register_on_joinplayer(func) end

---Map of registered on_joinplayer.
---@type fun(player: mt.PlayerObjectRef, last_login?: integer)[]
minetest.registered_on_joinplayers = {}

---Register a function that will be called when a player leaves the game.
---
---`timed_out`: True for timeout, false for other reasons.
---@param func fun(player: mt.PlayerObjectRef, timed_out: boolean|nil)
function minetest.register_on_leaveplayer(func) end

---Map of registered on_leaveplayer.
---@type fun(player: mt.PlayerObjectRef, timed_out: boolean|nil)[]
minetest.registered_on_leaveplayers = {}

---Register a function that will be called when a client attempts to log into an account.
---
---* `name`: The name of the account being authenticated.
---* `ip`: The IP address of the client
---* `is_success`: Whether the client was successfully authenticated
---* For newly registered accounts, `is_success` will always be true
---@param func fun(name: string, ip: string, is_success: boolean|nil)
function minetest.register_on_authplayer(func) end

---@type fun(name: string, ip: string, is_success: boolean|nil)[]
minetest.registered_on_authplayers = {}

---Register a function that will be called when a client attempts to log into an account but fails.
---
---**DEPRECATED**, use `minetest.register_on_authplayer` instead.
---@deprecated
---@param func fun(name: string, ip: string)
function minetest.register_on_auth_fail(func) end

---Register a function that will be called when a player is detected by builtin anticheat.
---@param func fun(player: mt.PlayerObjectRef, cheat: {type: '"moved_too_fast"'|'"interacted_too_far"'|'"interacted_with_self"'|'"interacted_while_dead"'|'"finished_unknown_dig"'|'"dug_unbreakable"'|'"dug_too_fast"'})
function minetest.register_on_cheat(func) end

---Map of registered on_cheat.
---@type fun(player: mt.PlayerObjectRef, cheat: {type: '"moved_too_fast"'|'"interacted_too_far"'|'"interacted_with_self"'|'"interacted_while_dead"'|'"finished_unknown_dig"'|'"dug_unbreakable"'|'"dug_too_fast"'})[]
minetest.registered_on_cheats = {}

---Register a function that will be called when a player send a chat message.
---
---Return `true` to mark the message as handled, which means that it will not be sent to other players.
---@param func fun(name: string, message: string): boolean|nil
function minetest.register_on_chat_message(func) end

---Map of registered on_chat_message.
---@type (fun(name: string, message: string): boolean|nil)[]
minetest.registered_on_chat_messages = {}

---Register a function that will be called when a player send a chat command.
---
---Called always when a chatcommand is triggered, before `minetest.registered_chatcommands` is checked to see if the command exists, but after the input is parsed.
---
---Return `true` to mark the command as handled, which means that the default handlers will be prevented.
---@param func fun(name: string, command: string, params: string)
function minetest.register_on_chatcommand(func) end

---Map of registered on_chatcommand.
---@type fun(name: string, command: string, params: string)[]
minetest.registered_on_chatcommands = {}

---Register a function that will be called when the server received input from player in a formspec.
---
---Specifically, this is called on any of the following events:
---* a button was pressed,
---* Enter was pressed while the focus was on a text field
---* a checkbox was toggled,
---* something was selected in a dropdown list,
---* a different tab was selected,
---* selection was changed in a textlist or table,
---* an entry was double-clicked in a textlist or table,
---* a scrollbar was moved, or
---* the form was actively closed by the player.
---
---Fields are sent for formspec elements which define a field. `fields` is a table containing each formspecs element value (as string), with the `name` parameter as index for each. The value depends on the formspec element type:
---* `animated_image`: Returns the index of the current frame.
---* `button` and variants: If pressed, contains the user-facing button text as value. If not pressed, is `nil`
---* `field`, `textarea` and variants: Text in the field
---* `dropdown`: Either the index or value, depending on the `index event` dropdown argument.
---* `tabheader`: Tab index, starting with `"1"` (only if tab changed)
---* `checkbox`: `"true"` if checked, `"false"` if unchecked
---* `textlist`: See `minetest.explode_textlist_event`
---* `table`: See `minetest.explode_table_event`
---* `scrollbar`: See `minetest.explode_scrollbar_event`
---* Special case: `["quit"]="true"` is sent when the user actively closed the form by mouse click, keypress or through a `button_exit[]` element.
---* Special case: `["key_enter"]="true"` is sent when the user pressed the Enter key and the focus was either nowhere (causing the formspec to be closed) or on a button. If the focus was on a text field, additionally, the index `key_enter_field` contains the name of the text field. See also: `field_close_on_enter`.
---
---Newest functions are called first.
---
---If function returns `true`, remaining functions are not called.
---@param func fun(player: mt.PlayerObjectRef, formname: string, fields: table<string, any>): boolean|nil
function minetest.register_on_player_receive_fields(func) end

---Map of registered on_player_receive_fields.
---@type (fun(player: mt.PlayerObjectRef, formname: string, fields: table<string, any>): boolean|nil)[]
minetest.registered_on_player_receive_fields = {}

---Register a function that will be called when a player craft something.
---* `itemstack` is the output
---* `old_craft_grid` contains the recipe (Note: the one in the inventory is cleared).
---* `craft_inv` is the inventory with the crafting grid
---* Return either an `ItemStack`, to replace the output, or `nil`, to not modify it.
---@param func fun(itemstack: mt.ItemStack, player: mt.PlayerObjectRef, old_craft_grid: table, craft_inv: mt.InvRef): mt.ItemStack?
function minetest.register_on_craft(func) end

---Map of registered on_craft.
---@type (fun(itemstack: mt.Item, player: mt.PlayerObjectRef, old_craft_grid: table, craft_inv: mt.InvRef): mt.ItemStack?)[]
minetest.registered_on_crafts = {}

---Register a function that will be called before a player craft something to make the crafting prediction.
---
---Similar to `minetest.register_on_craft`.
---@param func fun(itemstack: mt.Item, player: mt.PlayerObjectRef, old_craft_grid: table, craft_inv: mt.InvRef)
function minetest.register_craft_predict(func) end

---Map of registered craft_predicts.
---@type fun(itemstack: mt.Item, player: mt.PlayerObjectRef, old_craft_grid: table, craft_inv: mt.InvRef)[]
minetest.registered_craft_predicts = {}

---Determines how much of a stack may be taken, put or moved to a player inventory.
---
---`player` (type `ObjectRef`) is the player who modified the inventory `inventory` (type `InvRef`).
---
---List of possible `action` (string) values and their `inventory_info` (table) contents:
---* `move`: `{from_list=string, to_list=string, from_index=number, to_index=number, count=number}`
---* `put`:  `{listname=string, index=number, stack=ItemStack}`
---* `take`: Same as `put`
---
---Return a numeric value to limit the amount of items to be taken, put or moved.
---
---A value of `-1` for `take` will make the source stack infinite.
---@param func fun(player: mt.PlayerObjectRef, action: '"move"'|'"put"'|'"take"', inventory: mt.InvRef, inventory_info: {from_list: string, to_list: string, from_index: integer, to_index: integer, count: integer}|{listname: string, index: integer, stack: mt.Item}): integer
function minetest.register_allow_player_inventory_action(func) end

---Map of registered allow_player_inventory_action.
---@type (fun(player: mt.PlayerObjectRef, action: '"move"'|'"put"'|'"take"', inventory: mt.InvRef, inventory_info: {from_list: string, to_list: string, from_index: integer, to_index: integer, count: integer}|{listname: string, index: integer, stack: mt.Item}): integer)[]
minetest.registered_allow_player_inventory_action = {}

---Called after a take, put or move event from/to/in a player inventory.
---
---Function arguments: see `minetest.register_allow_player_inventory_action`
---
---Does not accept or handle any return value.
---@param func fun(player: mt.PlayerObjectRef, action: '"move"'|'"put"'|'"take"', inventory: mt.InvRef, inventory_info: {from_list: string, to_list: string, from_index: integer, to_index: integer, count: integer}|{listname: string, index: integer, stack: mt.Item})
function minetest.register_on_player_inventory_action(func) end

---Map of registered on_player_inventory_action.
---@type fun(player: mt.PlayerObjectRef, action: '"move"'|'"put"'|'"take"', inventory: mt.InvRef, inventory_info: {from_list: string, to_list: string, from_index: integer, to_index: integer, count: integer}|{listname: string, index: integer, stack: mt.Item})[]
minetest.registered_on_player_inventory_action = {}

---Called by `builtin` and mods when a player violates protection at a position (eg, digs a node or punches a protected entity).
---
---The registered functions can be called using `minetest.record_protection_violation`.
---
---The provided function should check that the position is protected by the mod calling this function before it prints a message, if it does, to allow for multiple protection mods.
---@param func fun(pos: mt.Vector, name: string)
function minetest.register_on_protection_violation(func) end

---Map of registered on_protection_violation.
---@type fun(pos: mt.Vector, name: string)[]
minetest.registered_on_protection_violation = {}

---Called when an item is eaten, by `minetest.item_eat`.
---
---Return `itemstack` to cancel the default item eat response (i.e.: hp increase).
---@param func fun(hp_change: integer, replace_with_item, itemstack: mt.Item, user: mt.ObjectRef, pointed_thing: mt.PointedThing): mt.ItemStack?
function minetest.register_on_item_eat(func) end

---Map of registered on_item_eat.
---@type (fun(hp_change: integer, replace_with_item, itemstack: mt.Item, user: mt.ObjectRef, pointed_thing: mt.PointedThing): mt.ItemStack?)[]
minetest.registered_on_item_eat = {}

---Called when `granter` grants the priv `priv` to `name`.
---
---Note that the callback will be called twice if it's done by a player, once with `granter` being the player name, and again with `granter` being `nil`.
---@param func fun(name: string, granter?: string, priv: string)
function minetest.register_on_priv_grant(func) end

---Map of registered on_priv_grant.
---@type fun(name: string, granter?: string, priv: string)[]
minetest.registered_on_priv_grant = {}

---Called when `revoker` revokes the priv `priv` from `name`.
---
---Note that the callback will be called twice if it's done by a player, once with `revoker` being the player name, and again with `revoker` being `nil`.
---@param func fun(name: string, revoker?: string, priv: string)
function minetest.register_on_priv_revoke(func) end

---Map of registered on_priv_revoke.
---@type fun(name: string, revoker?: string, priv: string)[]
minetest.registered_on_priv_revoke = {}

---Called when `name` user connects with `ip`.
---
---Return `true` to by pass the player limit
---@param func fun(name: string, ip: string): boolean|nil
function minetest.register_can_bypass_userlimit(func) end

---Map of registered can_bypass_userlimit.
---@type fun(name: string, ip: string)[]
minetest.registered_can_bypass_userlimit = {}

---Called when an incoming mod channel message is received
---
---You should have joined some channels to receive events.
---
---If message comes from a server mod, `sender` field is an empty string.
---@param func fun(channel_name: string, sender: string, message: string)
function minetest.register_on_modchannel_message(func) end

---Map of registered on_modchannel_message.
---@type fun(channel_name: string, sender: string, message: string)[]
minetest.registered_on_modchannel_message = {}

---Called after liquid nodes (`liquidtype ~= "none"`) are modified by the engine's liquid transformation process.
---* `pos_list` is an array of all modified positions.
---* `node_list` is an array of the old node that was previously at the position with the corresponding index in `pos_list`.
---@param func fun(pos_list: mt.Vector[], node_list: mt.Node[])
function minetest.register_on_liquid_transformed(func) end

---Map of registered on_liquid_transformed.
---@type fun(pos_list: mt.Vector[], node_list: mt.Node[])[]
minetest.registered_on_liquid_transformed = {}
