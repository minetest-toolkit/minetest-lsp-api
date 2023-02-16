---@meta
---Registration functions
-------------------------

---Anything added using certain registration functions gets added to one or more
---of the global registered definition tables.
---
---Note that in some cases you will stumble upon things that are not contained
---in these tables (e.g. when a mod has been removed). Always check for
---existence before trying to access the fields.
---
---Example:
---
---All nodes registered with `minetest.register_node` get added to the table
---`minetest.registered_nodes`.
---
---If you want to check the drawtype of a node, you could do it like this:
---
---    local def = minetest.registered_nodes[nodename]
---    local drawtype = def and def.drawtype
---@param name string
---@param definition mt.NodeDef
function minetest.register_node(name, definition) end

---@param name string
---@param item mt.ItemDef
function minetest.register_craftitem(name, item) end

---@param name string
---@param item mt.ItemDef
function minetest.register_tool(name, item) end

---* Overrides fields of an item registered with register_node/tool/craftitem.
---* Note: Item must already be defined, (opt)depend on the mod defining it.
---* Example: `minetest.override_item("default:mese",
---  {light_source=minetest.LIGHT_MAX})`
---@param name string
---@param item mt.ItemDef
function minetest.override_item(name, item) end

---* Unregister the item from the engine, and deletes the entry with key
---  `name` from `minetest.registered_items` and from the associated item table
---  according to its nature: `minetest.registered_nodes`, etc.
---@param name string
function minetest.unregister_item(name) end

---@param name string
---@param entity mt.EntityDef
function minetest.register_entity(name, entity) end

---@param abm mt.ABMDef
function minetest.register_abm(abm) end

---@param lbm mt.LBMDef
function minetest.register_lbm(name, lbm) end

---This adds an alias `alias` for the item called `original_name`.
---From now on, you can use `alias` to refer to the item `original_name`.
---@param alias string
---@param original_name string
function minetest.register_alias(alias, original_name) end

---The only difference between `minetest.register_alias` and
---`minetest.register_alias_force` is that if an item named `alias` already exists,
---`minetest.register_alias` will do nothing while
---`minetest.register_alias_force` will unregister it.
---@param alias string
---@param original_name string
function minetest.register_alias_force(alias, original_name) end

---The order of ore registrations determines the order of ore generation.
---@param ore mt.OreDef
---@return integer handle Uniquely identifying the registered ore on success.
function minetest.register_ore(ore) end

---To get the biome ID, use `minetest.get_biome_id`.
---@param biome mt.BiomeDef
---@return integer handle Uniquely identifying the registered biome on success.
function minetest.register_biome(biome) end

---* Unregister the biome from the engine, and deletes the entry with key
---  `name` from `minetest.registered_biomes`.
---* Warning: This alters the biome to biome ID correspondences, so any
---  decorations or ores using the 'biomes' field must afterwards be cleared
---  and re-registered.
---@param name string
function minetest.unregister_biome(name) end

---* To get the decoration ID, use `minetest.get_decoration_id`.
---* The order of decoration registrations determines the order of decoration
---  generation.
---@param decoration mt.DecorDef
---@return integer handle Uniquely identifying the registered biome on success.
function minetest.register_decoration(decoration) end

---* If the schematic is loaded from a file, the `name` field is set to the filename.
---* If the function is called when loading the mod, and `name` is a relative
---  path, then the current mod path will be prepended to the schematic filename.
---@param schematic mt.SchematicSpec
---@return integer handle Uniquely identifying the registered biome on success.
function minetest.register_schematic(schematic) end

---* Clears all biomes currently registered.
---* Warning: Clearing and re-registering biomes alters the biome to biome ID
---  correspondences, so any decorations or ores using the 'biomes' field must
---  afterwards be cleared and re-registered.
function minetest.clear_registered_biomes() end

---Clears all decorations currently registered.
function minetest.clear_registered_decorations() end

---Clears all ores currently registered.
function minetest.clear_registered_ores() end

---Clears all schematics currently registered.
function minetest.clear_registered_schematics() end

---### Gameplay

---@param recipe mt.CraftRecipe
function register_craft(recipe) end

---* Will erase existing craft based either on output item or on input recipe.
---* Specify either output or input only. If you specify both, input will be
---  ignored. For input use the same recipe table syntax as for
---  `minetest.register_craft(recipe)`. For output specify only the item,
---  without a quantity.
---* Returns false if no erase candidate could be found, otherwise returns true.
---* **Warning**! The type field ("shaped", "cooking" or any other) will be
---  ignored if the recipe contains output. Erasing is then done independently
---  from the crafting method.
---@param recipe mt.CraftRecipe
function clear_craft(recipe) end

---@param name string
---@param cmd mt.ChatCmdDef
function register_chatcommand(name, cmd) end

---Overrides fields of a chatcommand registered with `register_chatcommand`.
---@param name string
---@param cmd mt.ChatCmdDef
function override_chatcommand(name, cmd) end

---Unregister a chatcommands registered with `register_chatcommand`.
---@param name string
function unregister_chatcommand(name) end

---* `priv` can be a description or a definition table.
---* If it is a description, the priv will be granted to singleplayer and admin
---  by default.
---* To allow players with `basic_privs` to grant, see the `basic_privs`
---  minetest.conf setting.
---@param name string
---@param priv unknown|mt.PrivDef
function minetest.register_privilege(name, priv) end

---* Registers an auth handler that overrides the builtin one.
---* This function can be called by a single mod once only.
---@param handler mt.AuthHandlerDef
function minetest.register_authentication_handler(handler) end
