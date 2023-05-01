---@diagnostic disable: redefined-local, unused-local, missing-return
---@meta
---Node definition
------------------

---Used by `minetest.register_node`.
---@class mt.NodeDef:mt.ItemDef
---@field drawtype mt.DrawType|nil
-- * Supported for drawtypes "plantlike", "signlike", "torchlike",
--   "firelike", "mesh", "nodebox", "allfaces".
-- * For plantlike and firelike, the image will start at the bottom of the node.
-- * For torchlike, the image will start at the surface to which the
--   node "attaches".
-- * For the other drawtypes the image will be centered on the node.
---@field visual_scale number|nil
-- * Textures of node; +Y, -Y, +X, -X, +Z, -Z
-- * Old field name was 'tile_images'.
-- * List can be shortened to needed length.
---@field tiles mt.TileDef[]|nil
-- Same as `tiles`, but these textures are drawn on top of the base
-- tiles. You can use this to colorize only specific parts of your
-- texture. If the texture name is an empty string, that overlay is not
-- drawn. Since such tiles are drawn twice, it is not recommended to use
-- overlays on very common nodes.
---@field overlay_tiles mt.TileDef[]|nil
-- * Special textures of node; used rarely.
-- * Old field name was 'special_materials'.
-- * List can be shortened to needed length.
---@field special_tiles mt.TileDef[]|nil
-- * The node's original color will be multiplied with this color.
-- * If the node has a palette, then this setting only has an effect in
--   the inventory and on the wield item.
---@field color mt.ColorSpec|nil
-- Specifies how the texture's alpha channel will be used for rendering.
-- possible values:
-- * "opaque": Node is rendered opaque regardless of alpha channel
-- * "clip": A given pixel is either fully see-through or opaque
--           depending on the alpha channel being below/above 50% in value
-- * "blend": The alpha channel specifies how transparent a given pixel
--            of the rendered node is
-- The default is "opaque" for drawtypes normal, liquid and flowingliquid;
-- "clip" otherwise.
-- If set to a boolean value (deprecated): true either sets it to blend
-- or clip, false sets it to clip or opaque mode depending on the drawtype.
---@field use_texture_alpha "opaque"|"clip"|"blend"|nil
-- * The node's `param2` is used to select a pixel from the image.
-- * Pixels are arranged from left to right and from top to bottom.
-- * The node's color will be multiplied with the selected pixel's color.
-- * Tiles can override this behavior.
-- * Only when `paramtype2` supports palettes.
---@field palette string|nil
-- Screen tint if player is inside node.
---@field post_effect_color mt.ColorSpec|nil
---@field paramtype mt.ParamType|nil
---@field paramtype2 mt.ParamType2|nil
-- Force value for param2 when player places node.
---@field place_param2 mt.NodeParam|nil
-- If false, the cave generator and dungeon generator will not carve
-- through this node.
-- Specifically, this stops mod-added nodes being removed by caves and
-- dungeons when those generate in a neighbor mapchunk and extend out
-- beyond the edge of that mapchunk.
---@field is_ground_content boolean|nil
-- If true, sunlight will go infinitely through this node.
---@field sunlight_propagates boolean|nil
-- If true, objects collide with node.
---@field walkable boolean|nil
-- If true, can be pointed at.
---@field pointable boolean|nil
-- If false, can never be dug.
---@field diggable boolean|nil
-- If true, can be climbed on (ladder).
---@field climbable boolean|nil
-- Slows down movement of players through this node (max. 7).
-- If this is nil, it will be equal to liquid_viscosity.
-- Note: If liquid movement physics apply to the node
-- (see `liquid_move_physics`), the movement speed will also be
-- affected by the `movement_liquid_*` settings.
---@field move_resistance number|nil
-- If true, placed nodes can replace this node.
---@field buildable_to boolean|nil
-- If true, liquids flow into and replace this node.
-- Warning: making a liquid node 'floodable' will cause problems.
---@field floodable boolean|nil
-- * "none":    no liquid flowing physics
-- * "source":  spawns flowing liquid nodes at all 4 sides and below;
--              recommended drawtype: "liquid".
-- * "flowing": spawned from source, spawns more flowing liquid nodes
--              around it until `liquid_range` is reached;
--              will drain out without a source;
--              recommended drawtype: "flowingliquid".
-- If it's "source" or "flowing" and `liquid_range > 0`, then
-- both `liquid_alternative_*` fields must be specified.
---@field liquidtype "none"|"source"|"flowing"|nil
-- Flowing version of source liquid.
---@field liquid_alternative_flowing string|nil
-- Source version of flowing liquid.
---@field liquid_alternative_source string|nil
-- Controls speed at which the liquid spreads/flows (max. 7).
-- 0 is fastest, 7 is slowest.
-- By default, this also slows down movement of players inside the node
-- (can be overridden using `move_resistance`)
---@field liquid_viscosity number|nil
-- If true, a new liquid source can be created by placing two or more
-- sources nearby.
---@field liquid_renewable boolean|nil
-- * false: No liquid movement physics apply.
-- * true: Enables liquid movement physics. Enables things like
--   ability to "swim" up/down, sinking slowly if not moving,
--   smoother speed change when falling into, etc. The `movement_liquid_*`
--   settings apply.
-- * nil: Will be treated as true if `liquidtype ~= "none"`
--   and as false otherwise.
-- Default: nil
---@field liquid_move_physics boolean|nil
-- Only valid for "nodebox" drawtype with 'type = "leveled"'.
-- Allows defining the nodebox height without using param2.
-- The nodebox height is 'leveled' / 64 nodes.
-- The maximum value of 'leveled' is `leveled_max`.
---@field leveled number|nil
-- Maximum value for `leveled` (0-127), enforced in
-- `minetest.set_node_level` and `minetest.add_node_level`.
-- Values above 124 might causes collision detection issues.
---@field leveled_max number|nil
-- Maximum distance that flowing liquid nodes can spread around
-- source on flat land;
-- maximum = 8; set to 0 to disable liquid flow.
---@field liquid_range number|nil
-- Player will take this amount of damage if no bubbles are left.
---@field drowning number|nil
-- If player is inside node, this damage is caused.
---@field damage_per_second number|nil
---@field node_box mt.NodeBox|nil
-- Used for nodebox nodes with the type == "connected".
-- Specifies to what neighboring nodes connections will be drawn.
-- e.g. `{"group:fence", "default:wood"}` or `"default:stone"`.
---@field connects_to string[]|nil
-- Tells connected nodebox nodes to connect only to these sides of this node.
---@field connect_sides string[]|nil
-- File name of mesh when using "mesh" drawtype.
---@field mesh string|nil
-- Custom selection box definition. Multiple boxes can be defined.
-- If "nodebox" drawtype is used and selection_box is nil, then node_box
-- definition is used for the selection box.
---@field selection_box mt.NodeBox|nil
-- Custom collision box definition. Multiple boxes can be defined.
-- If "nodebox" drawtype is used and collision_box is nil, then node_box
-- definition is used for the collision box.
--
-- Support maps made in and before January 2012.
---@field collision_box mt.NodeBox|nil
---@field legacy_facedir_simple boolean|nil
---@field legacy_wallmounted boolean|nil
-- Valid for drawtypes:
-- mesh, nodebox, plantlike, allfaces_optional, liquid, flowingliquid.
-- 1 - wave node like plants (node top moves side-to-side, bottom is fixed)
-- 2 - wave node like leaves (whole node moves side-to-side)
-- 3 - wave node like liquids (whole node moves up and down)
-- Not all models will properly wave.
-- plantlike drawtype can only wave like plants.
-- allfaces_optional drawtype can only wave like leaves.
-- liquid, flowingliquid drawtypes can only wave like liquids.
---@field waving number|nil
---@field sounds mt.NodeSoundsDef|nil
---@field drop string|mt.NodeDropDef|nil
---@field drops (string|mt.NodeDropDef)[]|nil
-- * Stores which mod actually registered a node.
-- * If it can not find a source, returns "??".
-- * Useful for getting what mod truly registered something.
-- * Example: if a node is registered as ":othermodname:nodename",
--   nodename will show "othermodname", but mod_origin will say "modname"
---@field mod_origin string|nil
local node = {}

-- * Node constructor; called after adding node.
-- * Can set up metadata and stuff like that.
-- * Not called for bulk node placement (i.e. schematics and VoxelManip).
-- * Default: `nil`.
---@param pos mt.Vector
function node.on_construct(pos) end

-- * Node destructor; called before removing node.
-- * Not called for bulk node placement.
-- * Default: `nil`.
---@param pos mt.Vector
function node.on_destruct(pos) end

-- * Node destructor; called after removing node.
-- * Not called for bulk node placement.
-- * Default: `nil`.
---@param pos mt.Vector
---@param oldnode mt.Node
function node.after_destruct(pos, oldnode) end

-- * Called when a liquid (newnode) is about to flood oldnode, if it has
--   `floodable = true` in the nodedef.
-- * Not called for bulk node placement (i.e. schematics and VoxelManip)
--   or air nodes.
-- * If return true the node is not flooded, but on_flood callback will most
--   likely be called over and over again every liquid update interval.
-- * Default: `nil`.
-- * Warning: making a liquid node 'floodable' will cause problems.
---@param pos mt.Vector
---@param oldnode mt.Node
---@param newnode mt.Node
function node.on_flood(pos, oldnode, newnode) end

-- * Called when oldnode is about be converted to an item, but before the
--   node is deleted from the world or the drops are added.
-- * This is generally the result of either the node being dug or an attached
--   node becoming detached.
-- * Default: `nil`.
---@param pos mt.Vector
---@param oldnode mt.Node
---@param oldmeta mt.NodeMetaRef Old node before deletion.
---@param drops table<unknown, mt.Item>
function node.preserve_metadata(pos, oldnode, oldmeta, drops) end

-- * Called after constructing node when node was placed using
--   `minetest.item_place_node` / `minetest.place_node`.
-- * If return true no item is taken from itemstack.
-- * Default: `nil`.
---@param pos mt.Vector
---@param placer mt.ObjectRef|nil
---@param itemstack mt.Item
---@param pointed_thing mt.PointedThing
function node.after_place_node(pos, placer, itemstack, pointed_thing) end

-- * Called after destructing node when node was dug using
--   `minetest.node_dig` / `minetest.dig_node`.
-- * Default: `nil`.
---@param pos mt.Vector
---@param oldnode mt.Node
---@param oldmetadata table
---@param digger mt.ObjectRef
function node.after_dig_node(pos, oldnode, oldmetadata, digger) end

-- * Returns true if node can be dug, or false if not.
-- * Default: `nil`.
---@param pos mt.Vector
---@param player mt.ObjectRef
---@return boolean
function node.can_dig(pos, player) end

-- * Default: `minetest.node_punch`.
-- * Called when puncher punches the `node` at `pos`.
-- * By default calls `minetest.register_on_punchnode` callbacks.
---@param pos mt.Vector
---@param node mt.Node
---@param puncher mt.ObjectRef
---@param pointed_thing mt.PointedThing
function node.on_punch(pos, node, puncher, pointed_thing) end

-- * Called when clicker used the 'place/build' key
--   (not necessarily an actual rightclick)
--   while pointing at the node at pos with 'node' being the node table.
-- * `itemstack` will hold clicker's wielded item.
-- * Shall return the leftover itemstack.
-- * Note: pointed_thing can be nil, if a mod calls this function.
-- * This function does not get triggered by clients <=0.4.16 if the
--   "formspec" node metadata field is set.
-- * Default: `nil`.
---@param pos mt.Vector
---@param node mt.Node
---@param clicker mt.ObjectRef
---@param itemstack mt.Item
---@param pointed_thing mt.PointedThing|nil
---@return mt.ItemStack|nil leftover
function node.on_rightclick(pos, node, clicker, itemstack, pointed_thing) end

-- * Default: `minetest.node_dig`.
-- * By default checks privileges, wears out item (if tool) and removes node.
-- * Return `true` if the node was dug successfully, `false` otherwise.
-- * Deprecated: returning nil is the same as returning true.
---@param pos mt.Vector
---@param node mt.Node
---@param digger mt.ObjectRef
---@return boolean
function node.on_dig(pos, node, digger) end

-- * Called by NodeTimers, see `minetest.get_node_timer` and `mt.NodeTimerRef`.
-- * Return `true` to run the timer for another cycle with the same timeout.
-- * Default: `nil`.
---@param pos mt.Vector
---@param elapsed number The total time passed since the timer was started.
---@return boolean
function node.on_timer(pos, elapsed) end

-- * Called when an UI form (e.g. sign text input) returns data.
-- * See `minetest.register_on_player_receive_fields` for more info.
-- * Default: `nil`.
---@param pos mt.Vector
---@param formname string
---@param fields table<string, unknown> Name = Value.
---@param sender mt.ObjectRef
function node.on_receive_fields(pos, formname, fields, sender) end

-- * Called when a player wants to move items inside the inventory.
-- * Return value: number of items allowed to move.
---@param pos mt.Vector
---@param from_list unknown
---@param from_index integer
---@param to_list unknown
---@param to_index integer
---@param count integer
---@param player mt.ObjectRef
---@return integer allowed
function node.allow_metadata_inventory_move(
  pos,
  from_list,
  from_index,
  to_list,
  to_index,
  count,
  player
)
end

-- * Called when a player wants to put something into the inventory.
-- * Return value: number of items allowed to put.
-- * Return value -1: Allow and don't modify item count in inventory.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
---@return integer allowed
function node.allow_metadata_inventory_put(
  pos,
  listname,
  index,
  stack,
  player
)
end

-- * Called when a player wants to take something out of the inventory.
-- * Return value: number of items allowed to take.
-- * Return value -1: Allow and don't modify item count in inventory.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
---@return integer allowed
function node.allow_metadata_inventory_take(
  pos,
  listname,
  index,
  stack,
  player
)
end

-- * Called after the actual action has happened, according to what was allowed.
-- * No return value.
---@param pos mt.Vector
---@param from_list unknown
---@param from_index integer
---@param to_list unknown
---@param to_index integer
---@param count integer
---@param player mt.ObjectRef
function node.on_metadata_inventory_move(
  pos,
  from_list,
  from_index,
  to_list,
  to_index,
  count,
  player
)
end

-- * Called after the actual action has happened, according to what was allowed.
-- * No return value.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
function node.on_metadata_inventory_put(pos, listname, index, stack, player) end

-- * Called after the actual action has happened, according to what was allowed.
-- * No return value.
---@param pos mt.Vector
---@param listname string
---@param index integer
---@param stack mt.Item
---@param player mt.ObjectRef
function node.on_metadata_inventory_take(
  pos,
  listname,
  index,
  stack,
  player
)
end

-- * If defined, called when an explosion touches the node,
--   instead of removing the node.
---@param pos mt.Vector
---@param intensity number 1.0 = mid range of regular TNT.
function node.on_blast(pos, intensity) end

-- * Definition of node sounds to be played at various events.
-- * All fields in this table are optional.
---@class mt.NodeSoundsDef
-- * If walkable, played when object walks on it.
-- * If node is climbable or a liquid, played when object moves through it.
---@field footstep mt.SimpleSoundSpec
-- * While digging node.
-- * If `"__group"`, then the sound will be `default_dig_<groupname>`,
--   where `<groupname>` is the name of the item's digging group
--   with the fastest digging time.
-- * In case of a tie, one of the sounds will be played (but we
--   cannot predict which one)
-- * Default value: `"__group"`
---@field dig mt.SimpleSoundSpec|"__group"
---@field dug mt.SimpleSoundSpec Node was dug.
---@field place mt.SimpleSoundSpec Node was placed. Also played after falling.
-- * When node placement failed.
-- * Note: This happens if the _built-in_ node placement failed.
-- * This sound will still be played if the node is placed in the
--   `on_place` callback manually.
---@field place_failed mt.SimpleSoundSpec
---@field fall mt.SimpleSoundSpec When node starts to fall or is detached.

---@class mt.NodeDropDef
-- * Maximum number of item lists to drop.
-- * The entries in 'items' are processed in order. For each:
--   Item filtering is applied, chance of drop is applied, if both are
--   successful the entire item list is dropped.
-- * Entry processing continues until the number of dropped item lists
--   equals 'max_items'.
-- * Therefore, entries should progress from low to high drop chance.
---@field max_items integer
---@field items mt.NodeDropItemsDef

---@class mt.NodeDropItemsDef
-- 1 in 1000 chance of dropping a diamond.
-- Default rarity is '1'.
---@field rarity integer
-- List of item names.
---@field items string[]
-- List of tool names.
---@field tools string[]
-- Only drop if using an item in the "magicwand" group, or an item that is
-- in both the "pickaxe" and the "lucky" groups:
-- ```lua
-- tool_groups = {
--   "magicwand",
--   {"pickaxe", "lucky"}
-- }
-- ```
---@field tool_groups (string|string[])[]
-- Whether all items in the dropped item list inherit the
-- hardware coloring palette color from the dug node.
-- * Default is 'false'.
---@field inherit_color boolean
