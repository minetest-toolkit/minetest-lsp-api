---@meta
---Registered definition tables
-------------------------------

---Map of registered items, indexed by name.
---@type table<string, mt.Item>
minetest.registered_items = {}

---Map of registered node definitions, indexed by name.
---@type table<string, mt.NodeDef>
minetest.registered_nodes = {}

---Map of registered craft item definitions, indexed by name.
---@type table<string, mt.ItemDef>
minetest.registered_craftitems = {}

---Map of registered tool definitions, indexed by name.
---@type table<string, mt.ItemDef>
minetest.registered_tools = {}

-- Map of registered entity prototypes, indexed by name.
--
-- * Values in this table may be modified directly.
-- * Note: changes to initial properties will only affect entities spawned afterwards,
--   as they are only read when spawning.
---@type table<string, mt.EntityDef>
minetest.registered_entities = {}

---@alias mt.ObjectID userdata

---Map of object references, indexed by active object id.
---@type table<mt.ObjectID, mt.ObjectRef>
minetest.object_refs = {}

---Map of Lua entities, indexed by active object id.
---@type table<mt.ObjectID, mt.LuaObjectRef>
minetest.luaentities = {}

---List of ABM definitions.
---@type mt.ABMDef[]
minetest.registered_abms = {}

---List of LBM definitions.
---@type mt.LBMDef[]
minetest.registered_lbms = {}

---Map of registered aliases, indexed by name.
---@type table<string, string>
minetest.registered_aliases = {}

-- * Map of registered ore definitions, indexed by the `name` field.
-- * If `name` is nil, the key is the object handle returned by
--   `minetest.register_ore`.
---@type table<string|number, mt.OreDef>
minetest.registered_ores = {}

-- * Map of registered biome definitions, indexed by the `name` field.
-- * If `name` is nil, the key is the object handle returned by
--   `minetest.register_biome`.
---@type table<string|number, mt.BiomeDef>
minetest.registered_biomes = {}

-- * Map of registered decoration definitions, indexed by the `name` field.
-- * If `name` is nil, the key is the object handle returned by
--   `minetest.register_decoration`.
---@type table<string|number, mt.DecorDef>
minetest.registered_decorations = {}

-- * Map of registered schematic definitions, indexed by the `name` field.
-- * If `name` is nil, the key is the object handle returned by
--   `minetest.register_schematic`.
---@type table<string|number, mt.SchematicSpec>
minetest.registered_schematics = {}

-- Map of registered chat command definitions, indexed by name.
---@type table<string, mt.ChatCmdDef>
minetest.registered_chatcommands = {}

-- * Map of registered privilege definitions, indexed by name.
-- * Registered privileges can be modified directly in this table.
---@type table<string, mt.PrivDef>
minetest.registered_privileges = {}
