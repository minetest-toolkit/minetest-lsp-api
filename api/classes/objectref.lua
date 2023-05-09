---@diagnostic disable: unused-local, missing-return
---@meta
---ObjectRef
------------

---@class mt.ObjectRefProto
local ObjectRef = {}

-- A reference to an entity.
--
-- This is basically a reference to a C++ `ServerActiveObject`.
--
-- **Advice on handling `ObjectRefs`**
--
-- When you receive an `ObjectRef` as a callback argument or from another API
-- function, it is possible to store the reference somewhere and keep it around.
-- It will keep functioning until the object is unloaded or removed.
--
-- However, doing this is **NOT** recommended as there is (intentionally) no method
-- to test if a previously acquired `ObjectRef` is still valid.
-- Instead, `ObjectRefs` should be "let go" of as soon as control is returned from
-- Lua back to the engine.
-- Doing so is much less error-prone and you will never need to wonder if the
-- object you are working with still exists.
---@alias mt.ObjectRef mt.LuaObjectRef|mt.PlayerObjectRef

---@return mt.Vector|nil
function ObjectRef:get_pos() end

---@param pos mt.Vector
function ObjectRef:set_pos(pos) end

---@return mt.Vector|nil
function ObjectRef:get_velocity() end

---* In comparison to using get_velocity, adding the velocity and then using
---  set_velocity, add_velocity is supposed to avoid synchronization problems.
---  Additionally, players also do not support set_velocity.
---* If a player:
---  * Does not apply during free_move.
---  * Note that since the player speed is normalized at each move step,
---    increasing e.g. Y velocity beyond what would usually be achieved
---    (see: physics overrides) will cause existing X/Z velocity to be reduced.
---  * Example: `add_velocity({x=0, y=6.5, z=0})` is equivalent to
---    pressing the jump key (assuming default settings)
---@param vel mt.Vector
function ObjectRef:add_velocity(vel) end

---* Does an interpolated move for Lua entities for visually smooth transitions.
---* If `continuous` is true, the Lua entity will not be moved to the current
---      position before starting the interpolated move.
---* For players this does the same as `set_pos`,`continuous` is ignored.
---@param pos mt.Vector
---@param continuous boolean|nil Default: `false`.
function ObjectRef:move_to(pos, continuous) end

--[[
If `direction` equals `nil` and `puncher` does not equal `nil`, `direction`
will be automatically filled in based on the location of `puncher`.
]]
---@param puncher mt.ObjectRef
---@param time_from_last_punch number|nil Time since last punch action.
---@param tool_capabilities mt.ToolCaps|nil
---@param direction mt.Vector|nil
---@return number tool_wear
function ObjectRef:punch(
  puncher,
  time_from_last_punch,
  tool_capabilities,
  direction
)
end

---@param clicker mt.ObjectRef
function ObjectRef:right_click(clicker) end

---Returns number of health points.
---@return number|nil
function ObjectRef:get_hp() end

---* Set number of health points.
---* Is limited to the range of 0 ... 65535 (2^16 - 1).
---* For players: HP are also limited by `hp_max` specified in object properties.
---@param hp number
---@param reason string|nil See in register_on_player_hpchange
function ObjectRef:set_hp(hp, reason) end

---Returns an `InvRef` for players, otherwise returns `nil`.
---@return mt.InvRef|nil
function ObjectRef:get_inventory() end

---Returns the name of the inventory list the wielded item is in.
---@return string|nil
function ObjectRef:get_wield_list() end

---Returns the index of the wielded item.
---@return number|nil
function ObjectRef:get_wield_index() end

---@return mt.ItemStack|nil
function ObjectRef:get_wielded_item() end

---Replaces the wielded item, returns `true` if successful.
---@param item mt.Item
---@return boolean true If successful.
function ObjectRef:set_wielded_item(item) end

---@param group_table table {group1=rating, group2=rating, ...}
function ObjectRef:set_armor_groups(group_table) end

---Returns a table with the armor group ratings.
---@return table {group1=rating, group2=rating, ...}|nil
function ObjectRef:get_armor_groups() end

---@param frame_range { x: number, y: number }|nil `{x=1, y=1}`
---@param frame_speed number|nil Default: `15.0`.
---@param frame_blend number|nil Default: `0.0`.
---@param frame_loop boolean|nil Default: `true`.
function ObjectRef:set_animation(
  frame_range,
  frame_speed,
  frame_blend,
  frame_loop
)
end

---@return { x: number, y: number}|nil range
---@return number|nil frame_speed
---@return number|nil frame_blend
---@return boolean|nil frame_loop
function ObjectRef:get_animation() end

---@param frame_speed number|nil Default: `15.0`.
function ObjectRef:set_animation_frame_speed(frame_speed) end

---@param parent mt.ObjectRef
---@param bone string|nil Default: `""`. The root bone.
---@param position mt.Vector|nil Default: `{x=0, y=0, z=0}`. Relative position.
---@param rotation mt.Vector|nil Default: `{x=0, y=0, z=0}`. Relative rotation in degrees.
---@param forced_visible boolean|nil Default: `false`. Should appear in first person?
function ObjectRef:set_attach(
  parent,
  bone,
  position,
  rotation,
  forced_visible
)
end

---* This command may fail silently (do nothing) when it would result
---  in circular attachments.
---* Returns parent, bone, position, rotation, forced_visible,
---  or nil if it isn't attached.
---@return mt.ObjectRef|nil parent
---@return string|nil bone The root bone.
---@return mt.Vector|nil position Relative position.
---@return mt.Vector|nil rotation Relative rotation in degrees.
---@return boolean|nil forced_visible Should appear in first person?
function ObjectRef:get_attach() end

---Returns a list of ObjectRefs that are attached to the object.
---@return mt.ObjectRef[]|nil
function ObjectRef:get_children() end

function ObjectRef:set_detach() end

---@param bone string|nil Default: `""`. The root bone.
---@param position mt.Vector|nil Default: `{x=0, y=0, z=0}`. Relative position.
---@param rotation mt.Vector|nil Default: `{x=0, y=0, z=0}`.
function ObjectRef:set_bone_position(bone, position, rotation) end

---Returns position and rotation of the bone.
---@param bone string
---@return mt.Vector|nil position, mt.Vector|nil rotation
function ObjectRef:get_bone_position(bone) end

---@param property_table table
function ObjectRef:set_properties(property_table) end

---@return table|nil
function ObjectRef:get_properties() end

---@return boolean
function ObjectRef:is_player() end

---@class mt.NameTagAttributes
---@field text string|nil
---@field color mt.ColorSpec|nil
---@field bgcolor mt.ColorSpec|nil

---Returns a table with the attributes of the nametag of an object.
---@return mt.NameTagAttributes|nil
function ObjectRef:get_nametag_attributes() end

---Sets the attributes of the nametag of an object.
---@param attrs mt.NameTagAttributes
function ObjectRef:set_nametag_attributes(attrs) end

---Lua entity only (no-op for other objects).
---@class mt.LuaObjectRef : mt.ObjectRefProto
local LuaObjectRef = {}

---* Remove object.
---* The object is removed after returning from Lua. However the `ObjectRef`
---  itself instantly becomes unusable with all further method calls having
---  no effect and returning `nil`.
function LuaObjectRef:remove() end

---@param vel mt.Vector
function LuaObjectRef:set_velocity(vel) end

---@param acc mt.Vector
function LuaObjectRef:set_acceleration(acc) end

---@return mt.Vector
function LuaObjectRef:get_acceleration() end

---* X is pitch (elevation), Y is yaw (heading) and Z is roll (bank).
---* Does not reset rotation incurred through `automatic_rotate`.
---* Remove & read your objects to force a certain rotation.
---@param rot mt.Vector (radians)
function LuaObjectRef:set_rotation(rot) end

---@return mt.Vector (radians)
function LuaObjectRef:get_rotation() end

---Sets the yaw in radians (heading).
---@param yaw number
function LuaObjectRef:set_yaw(yaw) end

---Returns number in radians.
---@return number
function LuaObjectRef:get_yaw() end

---* Set a texture modifier to the base texture, for sprites and meshes.
---* When calling `set_texture_mod` again, the previous one is discarded.
---@param mod string Texture modifier.
function LuaObjectRef:set_texture_mod(mod) end

---Returns current texture modifier.
---@return string mod Texture modifier.
function LuaObjectRef:get_texture_mod() end

---* Specifies and starts a sprite animation.
---* Animations iterate along the frame `y` position.
---  * First column:  subject facing the camera
---  * Second column: subject looking to the left
---  * Third column:  subject backing the camera
---  * Fourth column: subject looking to the right
---  * Fifth column:  subject viewed from above
---  * Sixth column:  subject viewed from below
---@param start_frame {x: number, y: number}|nil Default: `{x=0, y=0}`. The coordinate of the first frame.
---@param num_frames number|nil Default: `1`. Total frames in the texture.
---@param framelength number|nil Default: `0.2`. Time per animated frame in seconds.
---@param select_x_by_camera boolean|nil Default: `false`. Only for visual = `sprite`. Changes the frame `x` position according to the view direction.
function LuaObjectRef:set_sprite(
  start_frame,
  num_frames,
  framelength,
  select_x_by_camera
)
end

---**Deprecated**: Use the field `self.name` instead.
---@deprecated
function LuaObjectRef:get_entity_name() end

---@return any
function LuaObjectRef:get_luaentity() end

---Player only (no-op for other objects).
---@class mt.PlayerObjectRef : mt.ObjectRefProto
local PlayerObjectRef = {}

---@return string name `""` if is not a player.
function PlayerObjectRef:get_player_name() end

---**DEPRECATED**, use get_velocity() instead.
---@deprecated
---@return mt.Vector|nil
function PlayerObjectRef:get_player_velocity() end

---**DEPRECATED**, use add_velocity(vel) instead.
---@deprecated
---@param vel mt.Vector|nil
function PlayerObjectRef:add_player_velocity(vel) end

---Get camera direction as a unit vector.
---@return mt.Vector|nil
function PlayerObjectRef:get_look_dir() end

---* Pitch in radians.
---* Angle ranges between -pi/2 and pi/2, which are straight up and down
---  respectively.
---@return number|nil
function PlayerObjectRef:get_look_vertical() end

---* Yaw in radians.
---* Angle is counter-clockwise from the +z direction.
---@return number|nil
function PlayerObjectRef:get_look_horizontal() end

---Sets look pitch.
---@param radians number Angle from looking forward, where positive is downwards.
function PlayerObjectRef:set_look_vertical(radians) end

---Sets look yaw.
---@param radians number Angle from the +z direction, where positive is counter-clockwise.
function PlayerObjectRef:set_look_horizontal(radians) end

---* Pitch in radians - **Deprecated** as broken. Use `get_look_vertical`.
---* Angle ranges between -pi/2 and pi/2, which are straight down and up
---  respectively.
---@deprecated
---@return number|nil
function PlayerObjectRef:get_look_pitch() end

---* Yaw in radians - **Deprecated** as broken. Use `get_look_horizontal`.
---* Angle is counter-clockwise from the +x direction.
---@deprecated
---@return number|nil
function PlayerObjectRef:get_look_yaw() end

---Sets look pitch - **Deprecated**. Use `set_look_vertical`.
---@deprecated
---@param radians number Angle from looking forward, where positive is downwards.
function PlayerObjectRef:set_look_pitch(radians) end

---Sets look yaw - **Deprecated**. Use `set_look_horizontal`.
---@deprecated
---@param radians number
function PlayerObjectRef:set_look_yaw(radians) end

---Returns player's breath.
---@return number|nil
function PlayerObjectRef:get_breath() end

---* Sets player's breath
---* values:
---  * `0`: player is drowning
---  * max: bubbles bar is not shown
---  * See [Object properties] for more information
---* Is limited to range 0 ... 65535 (2^16 - 1)
---@param value number
function PlayerObjectRef:set_breath(value) end

---* Sets player's FOV.
---* Set `fov` to 0 to clear FOV override.
---@param fov number FOV value
---@param is_multiplier boolean|nil Default: `false`. Set to `true` if the FOV value is a multiplier.
---@param transition_time number|nil Default: `0`. If defined, enables smooth FOV transition. Interpreted as the time (in seconds) to reach target FOV. If set to 0, FOV change is instantaneous.
function PlayerObjectRef:set_fov(fov, is_multiplier, transition_time) end

---@return number|nil fov Server-sent FOV value. Returns 0 if an FOV override doesn't exist.
---@return boolean|nil is_multiplier Indicating whether the FOV value is a multiplier.
---@return number|nil transition_time (in seconds) taken for the FOV transition. Set by `set_fov`.
function PlayerObjectRef:get_fov() end

---**DEPRECATED**, use set_meta() instead.
---@deprecated
---@param attribute string
---@param value string|number|nil
function PlayerObjectRef:set_attribute(attribute, value) end

---**DEPRECATED**, use set_meta() instead.
---@deprecated
---@param attribute string
---@return string|nil value
function PlayerObjectRef:get_attribute(attribute) end

---@return mt.PlayerMetaRef|nil
function PlayerObjectRef:get_meta() end

---* Redefine player's inventory form.
---* Should usually be called in `on_joinplayer`
---* If `formspec` is `""`, the player's inventory is disabled.
--- @param formspec string
function PlayerObjectRef:set_inventory_formspec(formspec) end

---Returns a formspec string.
--- @return string|nil
function PlayerObjectRef:get_inventory_formspec() end

---* The formspec string will be added to every formspec shown to the user,
---  except for those with a no_prepend[] tag.
---* This should be used to set style elements such as background[] and
---  bgcolor[], any non-style elements (eg: label) may result in weird behavior.
---* Only affects formspecs shown after this is called.
---@param formspec string
function PlayerObjectRef:set_formspec_prepend(formspec) end

---Returns a formspec string.
---@return string formspec|nil
function PlayerObjectRef:get_formspec_prepend() end

---* Returns table with player pressed keys.
---* The table consists of fields with the following boolean values
---  representing the pressed keys: `up`, `down`, `left`, `right`, `jump`,
---  `aux1`, `sneak`, `dig`, `place`, `LMB`, `RMB`, and `zoom`.
---* The fields `LMB` and `RMB` are equal to `dig` and `place` respectively,
---  and exist only to preserve backwards compatibility.
---* Returns an empty table `{}` if the object is not a player.
---@return { up: boolean|nil, down: boolean|nil, left: boolean|nil, right: boolean|nil, jump: boolean|nil, aux1: boolean|nil, sneak: boolean|nil, dig: boolean|nil, place: boolean|nil, LMB: boolean|nil, RMB: boolean|nil, zoom: boolean|nil }|nil
function PlayerObjectRef:get_player_control() end

---* Returns integer with bit packed player pressed keys.
---* Bits:
---  * 0 - up
---  * 1 - down
---  * 2 - left
---  * 3 - right
---  * 4 - jump
---  * 5 - aux1
---  * 6 - sneak
---  * 7 - dig
---  * 8 - place
---  * 9 - zoom
---* Returns `0` (no bits set) if the object is not a player.
---@return number|nil
function PlayerObjectRef:get_player_control_bits() end

---@class mt.PhysicsOverride
---@field speed number|nil Default: `1`. Multiplier to default walking speed value.
---@field jump number|nil Default: `1`. Multiplier to default jump value.
---@field gravity number|nil Default: `1`. Multiplier to default gravity value.
---@field sneak boolean|nil Default: `true`. Whether player can sneak.
---@field sneak_glitch boolean|nil Default: `false`. Whether player can use the new move code replications of the old sneak side-effects: sneak ladders and 2 node sneak jump.
---@field new_move boolean|nil Default: `true`. Use new move/sneak code. When false the exact old code is used for the specific old sneak behavior.

--- @param override_table mt.PhysicsOverride
function PlayerObjectRef:set_physics_override(override_table) end

---Returns the table given to `set_physics_override`.
---@return mt.PhysicsOverride|nil
function PlayerObjectRef:get_physics_override() end

---Add a HUD element described by HUD def, returns ID number on success.
---@param definition mt.HUDDef
---@return number id On success.
function PlayerObjectRef:hud_add(definition) end

---Remove the HUD element of the specified id.
---@param id number
function PlayerObjectRef:hud_remove(id) end

---* Change a value of a previously added HUD element.
---* `stat` supports the same keys as in the hud definition table except for
---  `"hud_elem_type"`.
---@param id number
---@param stat '"position"'|'"name"'|'"scale"'|'"text"'|'"number"'|'"item"'|'"dir"'
---@param value any
function PlayerObjectRef:hud_change(id, stat, value) end

---Gets the HUD element definition structure of the specified ID.
---@param id number
---@return mt.HUDElement
function PlayerObjectRef:hud_get(id) end

---@class mt.HUDFlags
---@field hotbar boolean|nil
---@field healthbar boolean|nil
---@field crosshair boolean|nil
---@field wielditem boolean|nil
---@field breathbar boolean|nil
---@field minimap boolean|nil The client may locally elect to not view the minimap.
---@field minimap_radar boolean|nil Is only usable when `minimap` is true.
---Allow showing basic debug info that might give a gameplay advantage.
---This includes map seed, player position, look direction, the pointed node
---and block bounds. Does not affect players with the `debug` privilege.
---@field basic_debug boolean|nil

---Sets specified HUD flags of player.
---@param flags mt.HUDFlags If a flag equals `nil`, the flag is not modified.
function PlayerObjectRef:hud_set_flags(flags) end

---`hud_get_flags()`: returns a table of player HUD flags with boolean values.
---@return mt.HUDFlags
function PlayerObjectRef:hud_get_flags() end

---Sets number of items in builtin hotbar.
---@param count number Must be between `1` and `32`.
function PlayerObjectRef:hud_set_hotbar_itemcount(count) end

---Returns number of visible items.
---@return number
function PlayerObjectRef:hud_get_hotbar_itemcount() end

---Sets background image for hotbar.
---@param texturename string
function PlayerObjectRef:hud_set_hotbar_image(texturename) end

---Returns texturename.
---@return string
function PlayerObjectRef:hud_get_hotbar_image() end

---Sets image for selected item of hotbar.
---@param texturename string
function PlayerObjectRef:hud_set_hotbar_selected_image(texturename) end

---Returns texturename
---@return string
function PlayerObjectRef:hud_get_hotbar_selected_image() end

---@class mt.MiniMapMode
---@field type '"off"'|'"surface"'|'"radar"'|'"texture"'|nil
---@field label string|nil
---@field size number|nil Side length or diameter in nodes.
---@field texture string|nil Name of the texture.
---@field scale number|nil Only for texture type.

---Overrides the available minimap modes (and toggle order), and changes the
---selected mode.
---@param modes mt.MiniMapMode[]
---@param selected_mode number Mode index to be selected after change (starting at 0).
function PlayerObjectRef:set_minimap_modes(modes, selected_mode) end

---* The presence of the function `set_sun`, `set_moon` or `set_stars` indicates
---  whether `set_sky` accepts this format. Check the legacy format otherwise.
---* Passing no arguments resets the sky to its default values.
---@param sky_parameters mt.SkyParameters|nil
---@overload fun(base_color: mt.ColorSpec|nil, type:string|nil, textures:table|nil, clouds:boolean|nil) **Deprecated**.
function PlayerObjectRef:set_sky(sky_parameters) end

---A table used in regular sky_parameters type only (alpha is ignored)
---@class mt.SkyColor
---Default: `#61b5f5`. For the top half of the sky during the day.
---@field day_sky mt.ColorSpec|nil
---Default: `#90d3f6`. For the bottom half of the sky during the day.
---@field day_horizon mt.ColorSpec|nil
---Default: `#b4bafa`. For the top half of the sky during dawn/sunset.
---@field dawn_sky mt.ColorSpec|nil
---Default: `#bac1f0`. For the bottom half of the sky during dawn/sunset.
---@field dawn_horizon mt.ColorSpec|nil
---Default: `#006bff`. For the top half of the sky during the night.
---@field night_sky mt.ColorSpec|nil
---Default: `#4090ff`. For the bottom half of the sky during the night.
---@field night_horizon mt.ColorSpec|nil
---Default: `#646464`. For when you're either indoors or underground.
---@field indoors mt.ColorSpec|nil
---Default: `#f47d1d`. Changes the fog tinting for the sun at sunrise and sunset.
---@field fog_sun_tint mt.ColorSpec|nil
---Default: `#7f99cc`. Changes the fog tinting for the moon at sunrise and sunset.
---@field fog_moon_tint mt.ColorSpec|nil
---Default: `"default"`. Changes which mode the directional fog.
---@field fog_tint_type `"custom"`|`"default"`|nil

---@class mt.SkyParameters
---Changes fog in "skybox" and "plain".
---@field base_color mt.ColorSpec|nil Default: `#ffffff`.
---`"regular"` Uses `0 | 6 | 0` textures, `base_color`
---`ignored | used as fog | used as both fog and sky`.
---@field type `"regular"`|`"skybox"`|`"plain"`|nil
---A table containing up to six textures in the following order: Y+ (top),
---Y- (bottom), X- (west), X+ (east), Z+ (north), Z- (south).
---@field textures table|nil
---@field clouds boolean|nil `true` Boolean for whether clouds appear.
---@field sky_color mt.SkyColor

---* `as_table`: boolean that determines whether the deprecated version of this
---  function is being used.
---  * `true` returns a table containing sky parameters as defined in `set_sky(sky_parameters)`.
---  * Deprecated: `false` or `nil` returns base_color, type, table of textures,
---  clouds.
---@param as_table boolean|nil
---@return mt.ColorSpec|mt.SkyParameters, string|nil, string[]|nil, boolean|nil
function PlayerObjectRef:get_sky(as_table) end

---* Deprecated: Use `get_sky(as_table)` instead.
---* Returns a table with the `sky_color` parameters as in `set_sky`.
---@deprecated
---@return mt.SkyColor
function get_sky_color() end

---@class mt.SunParameters
---@field visible boolean|nil Default: `true`. Whether the sun is visible.
---@field texture string|nil Default: `"sun.png"`. A regular texture for the sun. Setting to `""` will re-enable the mesh sun. The texture appears non-rotated at sunrise and rotated 180 degrees (upside down) at sunset.
---@field tonemap string|nil Default: `"sun_tonemap.png"`. A 512x1 texture containing the tonemap for the sun
---@field sunrise string|nil Default: `"sunrisebg.png"`. A regular texture for the sunrise texture.
---@field sunrise_visible boolean|nil Default: `true`. Boolean for whether the sunrise texture is visible.
---@field scale number|nil Default: `1`. Overall size of the sun. For legacy reasons, the sun is bigger than the moon by a factor of about `1.57` for equal `scale` values.

---Passing no arguments resets the sun to its default values.
---@param sun_parameters mt.SunParameters|nil
function PlayerObjectRef:set_sun(sun_parameters) end

---Returns a table with the current sun parameters as in `set_sun`.
---@return mt.SunParameters|nil
function PlayerObjectRef:get_sun() end

---@class mt.MoonParameters
---@field visible boolean|nil Default: `true`. Whether the moon is visible.
---@field texture string|nil Default: `"moon.png"`. A regular texture for the moon. Setting to `""` will re-enable the mesh moon. The texture appears non-rotated at sunrise / moonset and rotated 180 degrees (upside down) at sunset / moonrise. Note: Relative to the sun, the moon texture is hence rotated by 180°. You can use the `^[transformR180` texture modifier to achieve the same orientation.
---@field tonemap string|nil Default: `"moon_tonemap.png"`. A 512x1 texture containing the tonemap for the moon.
---@field scale number|nil Default: `1`. Controlling the overall size of the moon. Note: For legacy reasons, the sun is bigger than the moon by a factor of about `1.57` for equal `scale` values.

---Passing no arguments resets the moon to its default values.
---@param moon_parameters mt.MoonParameters
function PlayerObjectRef:set_moon(moon_parameters) end

---Returns a table with the current moon parameters as in `set_moon`.
---@return mt.MoonParameters|nil
function PlayerObjectRef:get_moon() end

---@class mt.StarParameters
---@field visible boolean|nil Default: `true`. Whether the stars are visible.
---@field day_opacity number|nil Default: `0.0`. Maximum opacity of stars at day (maximum: 1.0; minimum: 0.0). No effect if `visible` is false.
---@field count integer|nil Default: `1000`. Set the number of stars in the skybox. Only applies to `"skybox"` and `"regular"` sky types.
---@field star_color mt.ColorSpec|nil Default: `#ebebff69`. Sets the colors of the stars, alpha channel is used to set overall star brightness.
---@field scale number|nil Default: `1`. Controlling the overall size of the stars.

---Passing no arguments resets stars to their default values.
---@param star_parameters mt.StarParameters
function PlayerObjectRef:set_stars(star_parameters) end

---Returns a table with the current stars parameters as in `set_stars`.
---@return mt.StarParameters|nil
function PlayerObjectRef:get_stars() end

---@class mt.CloudParameters
---@field density number|nil Default: `0.4`. From `0` (no clouds) to `1` (full clouds).
---@field color mt.ColorSpec|nil Default: `#fff0f0e5`. Basic cloud color with alpha channel.
---@field ambient mt.ColorSpec|nil Default: `#000000`. Cloud color lower bound, use for a "glow at night" effect (alpha ignored).
---@field height number|nil Default: `120`. Cloud height, i.e. y of cloud base.
---@field thickness number|nil Default: `16`. Cloud thickness in nodes.
---@field speed {x:number, z:number}|nil Default: `{x=0, z=-2}`.

---Passing no arguments resets clouds to their default values.
---@param cloud_parameters mt.CloudParameters
function PlayerObjectRef:set_clouds(cloud_parameters) end

---Returns a table with the current cloud parameters as in `set_clouds`.
---@return mt.CloudParameters|nil
function PlayerObjectRef:get_clouds() end

---* Overrides day-night ratio, controlling sunlight to a specific amount.
---* `nil`: Disables override, defaulting to sunlight based on day-night cycle.
---@param ratio number|nil Ratio from 0 to 1.
function PlayerObjectRef:override_day_night_ratio(ratio) end

---@return number|nil ratio Ratio from 0 to 1, or `nil` if not overridden.
function PlayerObjectRef:get_day_night_ratio() end

---* Set animation for player model in third person view.
---* Every animation equals to a `{x=starting frame, y=ending frame}`.
---@param idle {x:number, y:number}|nil
---@param walk {x:number, y:number}|nil
---@param dig  {x:number, y:number}|nil
---@param walk_while_dig {x:number, y:number}|nil
---@param frame_speed number|nil Default: `30`.
function PlayerObjectRef:set_local_animation(
  idle,
  walk,
  dig,
  walk_while_dig,
  frame_speed
)
end

---Returns idle, walk, dig, walk_while_dig tables and `frame_speed`.
---@return {x:number, y:number}|nil idle
---@return {x:number, y:number}|nil walk
---@return {x:number, y:number}|nil dig
---@return {x:number, y:number}|nil walk_while_dig
---@return number|nil frame_speed
function PlayerObjectRef:get_local_animation() end

---* Defines offset vectors for camera per player.
---* in third person view max values are `{x=-10/10, y=-10,15, z=-5/5}`
---@param firstperson? mt.Vector|nil Default: `{x=0, y=0, z=0}`.
---@param thirdperson? mt.Vector|nil Default: `{x=0, y=0, z=0}`.
function PlayerObjectRef:set_eye_offset(firstperson, thirdperson) end

---Returns first and third person offsets.
---@return mt.Vector|nil, mt.Vector|nil
function get_eye_offset() end

---* Sends an already loaded mapblock to the player.
---* Returns `false` if nothing was sent (note that this can also mean that
---      the client already has the block)
---* Resource intensive - use sparsely
---@param blockpos mt.Vector
---@return unknown|boolean result False if failed.
function PlayerObjectRef:send_mapblock(blockpos) end

---@class mt.Light
---@field saturation number|nil This value has no effect on clients who have the "Tone Mapping" shader disabled.
---@field shadows {intensity: number|nil}|nil This value has no effect on clients who have the "Dynamic Shadows" shader disabled.

---Sets lighting for the player.
---@param light_definition mt.Light
function PlayerObjectRef:set_lighting(light_definition) end

---Returns the current state of lighting for the player.
---@return mt.Light|nil
function PlayerObjectRef:get_lighting() end

---Respawns the player using the same mechanism as the death screen,
---including calling on_respawnplayer callbacks.
function PlayerObjectRef:respawn() end

---@return mt.InvRef
function PlayerObjectRef:get_inventory() end
