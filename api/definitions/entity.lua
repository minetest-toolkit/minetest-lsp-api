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

---@param self mt.EntityDef
---@param staticdata string
---@param dtime number Elapsed time.
function entity.on_activate(self, staticdata, dtime) end

-- Called when the object is about to get removed or unloaded.
--
-- - Note that this won't be called if the object hasn't been activated in the
--   first place. In particular, `minetest.clear_objects({mode = "full"})` won't
--   call this, whereas `minetest.clear_objects({mode = "quick"})` might call
--   this.
---@param self mt.EntityDef
---@param removal boolean Indicating whether the object is about to get removed.
function entity.on_deactivate(self, removal) end

-- Called every server step.
---@param self mt.EntityDef
---@param dtime number Elapsed time.
---@param moveresult mt.CollisionInfo|nil Only available if `physical` == `true`.
function entity.on_step(self, dtime, moveresult) end

---@param self mt.EntityDef
---@param puncher mt.ObjectRef
---@param time_from_last_punch number
---@param tool_capabilities unknown
---@param dir unknown
function entity.on_punch(self, puncher, time_from_last_punch, tool_capabilities, dir) end

-- Called when the object dies.
---@param self mt.EntityDef
---@param killer mt.ObjectRef|nil
function on_death(self, killer) end

-- Called when `clicker` pressed the 'place/use' key while pointing to the
-- object (not necessarily an actual rightclick).
---@param self mt.EntityDef
---@param clicker mt.ObjectRef
function entity.on_rightclick(self, clicker) end

---@param self mt.EntityDef
---@param child mt.ObjectRef
function on_attach_child(self, child) end

---@param self mt.EntityDef
---@param child mt.ObjectRef|nil
function on_detach_child(self, child) end

-- Called sometimes; the string returned is passed to `on_activate` when
-- the entity is re-activated from static state.
---@param self mt.EntityDef
---@return string
function entity.get_staticdata(self) end

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
