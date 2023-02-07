---@meta
---Tool capabilities
--------------------

---'Tool capabilities' is a property of items that defines two things:
---
---1) Which nodes it can dig and how fast
---2) Which objects it can hurt by punching and by how much
---
---Tool capabilities are available for all items, not just tools.
---But only tools can receive wear from digging and punching.
---
---Missing or incomplete tool capabilities will default to the
---player's hand.
---
---Tool capabilities define:
---
---* Full punch interval
---* Maximum drop level
---* For an arbitrary list of node groups:
---* Uses (until the tool breaks)
---* Maximum level (usually `0`, `1`, `2` or `3`)
---* Digging times
---* Damage groups
---* Punch attack uses (until the tool breaks)
---@class mt.ToolCaps
local tool_capabilities = {}

---When used as a weapon, the item will do full damage if this time is spent
---between punches. If e.g. half the time is spent, the item will do half
---damage.
---@type number|nil
tool_capabilities.full_punch_interval = nil

---Suggests the maximum level of node, when dug with the item, that will drop
---its useful item. (e.g. iron ore to drop a lump of iron).
---
---This value is not used in the engine; it is the responsibility of the game/mod
---code to implement this.
---@type number|nil
tool_capabilities.max_drop_level = nil

---Determines how many uses the tool has when it is used for digging a node,
---of this group, of the maximum level. The maximum supported number of
---uses is 65535. The special number 0 is used for infinite uses.
---For lower leveled nodes, the use count is multiplied by `3^leveldiff`.
---`leveldiff` is the difference of the tool's `maxlevel` `groupcaps` and the
---node's `level` group. The node cannot be dug if `leveldiff` is less than zero.
---
---* `uses=10, leveldiff=0`: actual uses: 10
---* `uses=10, leveldiff=1`: actual uses: 30
---* `uses=10, leveldiff=2`: actual uses: 90
---
---For non-tools, this has no effect.
---@type number|nil
tool_capabilities.uses = nil

---See `uses`.
---@type number|nil
tool_capabilities.leveldiff = nil

---Tells what is the maximum level of a node of this group that the item will
---be able to dig.
---@type number|nil
tool_capabilities.maxlevel = nil

---List of digging times for different ratings of the group, for nodes of the
---maximum level.
---
---For example, as a Lua table, `times={[2]=2.00, [3]=0.70}`. This would
---result in the item to be able to dig nodes that have a rating of `2` or `3`
---for this group, and unable to dig the rating `1`, which is the toughest.
---Unless there is a matching group that enables digging otherwise.
---
---If the result digging time is 0, a delay of 0.15 seconds is added between
---digging nodes; If the player releases LMB after digging, this delay is set to 0,
---i.e. players can more quickly click the nodes away instead of holding LMB.
---@type number[]|nil
tool_capabilities.times = nil

---### Damage groups
---
---List of damage for groups of entities. See [Entity damage mechanism].
---
---### Punch attack uses (tools only)

---Determines how many uses (before breaking) the tool has when dealing damage
---to an object, when the full punch interval (see above) was always
---waited out fully.
---
---Wear received by the tool is proportional to the time spent, scaled by
---the full punch interval.
---
---For non-tools, this has no effect.
---
---Example definition of the capabilities of an item:
---```lua
---tool_capabilities = {
---    groupcaps={
---        crumbly={maxlevel=2, uses=20, times={[1]=1.60, [2]=1.20, [3]=0.80}}
---    },
---}
---```
---
---This makes the item capable of digging nodes that fulfill both of these:
---
---* Have the `crumbly` group
---* Have a `level` group less or equal to `2`
---
---Table of resulting digging times:
---
---    crumbly        0     1     2     3     4  <- level
---         ->  0     -     -     -     -     -
---             1  0.80  1.60  1.60     -     -
---             2  0.60  1.20  1.20     -     -
---             3  0.40  0.80  0.80     -     -
---
---    level diff:    2     1     0    -1    -2
---
---Table of resulting tool uses:
---
---    ->  0     -     -     -     -     -
---        1   180    60    20     -     -
---        2   180    60    20     -     -
---        3   180    60    20     -     -
---
---**Notes**:
---
---* At `crumbly==0`, the node is not diggable.
---* At `crumbly==3`, the level difference digging time divider kicks in and makes
---  easy nodes to be quickly breakable.
---* At `level > 2`, the node is not diggable, because it's `level > maxlevel`
---@type table<string, table>|nil
tool_capabilities.groupcaps = nil

---Damage calculation:
---
---    damage = 0
---    foreach group in cap.damage_groups:
---        damage += cap.damage_groups[group]
---            * limit(actual_interval / cap.full_punch_interval, 0.0, 1.0)
---            * (object.armor_groups[group] / 100.0)
---            -- Where object.armor_groups[group] is 0 for inexistent values
---    return damage
---
---Client predicts damage based on damage groups. Because of this, it is able to
---give an immediate response when an entity is damaged or dies; the response is
---pre-defined somehow (e.g. by defining a sprite animation) (not implemented).
---Currently a smoke puff will appear when an entity dies.
---
---The group `immortal` completely disables normal damage.
---
---Entities can define a special armor group, which is `punch_operable`. This
---group disables the regular damage mechanism for players punching it by hand or
---a non-tool item, so that it can do something else than take damage.
---
---On the Lua side, every punch calls:
---
---    entity:on_punch(puncher, time_from_last_punch, tool_capabilities, direction,
---                    damage)
---
---This should never be called directly, because damage is usually not handled by
---the entity itself.
---
---* `puncher` is the object performing the punch. Can be `nil`. Should never be
---  accessed unless absolutely required, to encourage interoperability.
---* `time_from_last_punch` is time from last punch (by `puncher`) or `nil`.
---* `tool_capabilities` can be `nil`.
---* `direction` is a unit vector, pointing from the source of the punch to
---   the punched object.
---* `damage` damage that will be done to entity
---Return value of this function will determine if damage is done by this function
---(retval true) or shall be done by engine (retval false)
---
---To punch an entity/object in Lua, call:
---
---  object:punch(puncher, time_from_last_punch, tool_capabilities, direction)
---
---* Return value is tool wear.
---* Parameters are equal to the above callback.
---* If `direction` equals `nil` and `puncher` does not equal `nil`, `direction`
---  will be automatically filled in based on the location of `puncher`.
---@type table<string, number>|nil
tool_capabilities.damage_groups = nil