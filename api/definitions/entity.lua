---@meta
---Entity definition
--------------------

-- Used by `minetest.register_entity`.
--
-- You can define arbitrary member variables here by using a '_' prefix:
--
-- `_custom_field = whatever:mt.ItemDef`.
---@class mt.EntityDef
-- * A table of object properties.
-- * Object properties being read directly from the entity definition
--   table is deprecated.
-- * Define object properties in this `initial_properties` table instead.
---@field initial_properties mt.ObjectProp
---@field name string Registered name `("mod:thing")`.
---@field object mt.ObjectRef
local entity = {}

---@param staticdata string
---@param dtime number Elapsed time.
function entity:on_activate(staticdata, dtime) end

-- Called when the object is about to get removed or unloaded.
--
-- - Note that this won't be called if the object hasn't been activated in the
--   first place. In particular, `minetest.clear_objects({mode = "full"})` won't
--   call this, whereas `minetest.clear_objects({mode = "quick"})` might call
--   this.
---@param removal boolean Indicating whether the object is about to get removed.
function entity:on_deactivate(removal) end

-- Called every server step.
---@param dtime number Elapsed time.
---@param moveresult mt.CollisionInfo|nil Only available if `physical` == `true`.
function entity:on_step(dtime, moveresult) end

--[[
Damage calculation:

```
damage = 0
foreach group in cap.damage_groups:
  damage += cap.damage_groups[group]
    * limit(actual_interval / cap.full_punch_interval, 0.0, 1.0)
    * (object.armor_groups[group] / 100.0)
    -- Where object.armor_groups[group] is 0 for inexistent values
return damage
```

Client predicts damage based on damage groups. Because of this, it is able to
give an immediate response when an entity is damaged or dies; the response is
pre-defined somehow (e.g. by defining a sprite animation) (not implemented;
TODO). Currently a smoke puff will appear when an entity dies.

The group `immortal` completely disables normal damage.

Entities can define a special armor group, which is `punch_operable`. This group
disables the regular damage mechanism for players punching it by hand or a
non-tool item, so that it can do something else than take damage.
]]
---@param puncher mt.ObjectRef|nil
---@param time_from_last_punch number|nil
---@param tool_capabilities mt.ToolCaps|nil
---@param dir mt.Vector Pointing from the source of the punch to the punched object.
---@param damage number
---@return boolean is_damaged
function entity:on_punch(puncher, time_from_last_punch, tool_capabilities, dir, damage) end

-- Called when the object dies.
---@param killer mt.ObjectRef|nil
function entity:on_death(killer) end

-- Called when `clicker` pressed the 'place/use' key while pointing to the
-- object (not necessarily an actual rightclick).
---@param clicker mt.ObjectRef
function entity:on_rightclick(clicker) end

---@param child mt.ObjectRef
function entity:on_attach_child(child) end

---@param child mt.ObjectRef|nil
function entity:on_detach_child(child) end

-- Called sometimes; the string returned is passed to `on_activate` when
-- the entity is re-activated from static state.
---@return string
function entity:get_staticdata() end

---Collision info passed to `on_step` (`moveresult` argument).
---@class mt.CollisionInfo
---@field touching_ground boolean
---@field collides boolean
---@field standing_on_object boolean
---@field collisions mt.Collisions

-- `mt.Collisions` does not contain data of unloaded mapblock collisions
-- or when the velocity changes are negligibly small.
---@class mt.Collisions
---@field type "node"|"object"
---@field axis "x"|"y"|"z"
---@field node_pos mt.Vector If type is "node".
---@field object mt.ObjectRef If type is "object".
---@field old_velocity mt.Vector
---@field new_velocity mt.Vector
