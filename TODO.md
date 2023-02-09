# Roadmap

If you think that any of the items listed here is done, please tick it and add
links to the affected files to make it easier to update the documentation in the
future.

Feel free to add your subitems if item is partially done.

## Documentation

- [x] [Minetest Lua Modding API Reference](common/minetest.lua)
- [ ] Games
- [ ] Mods
- [ ] Aliases
- [ ] Textures
- [x] [Sounds](ssm/sounds.lua)
- [x] Registered definitions
  - [x] [Registration functions](ssm/minetest/register.lua)
  - [x] [Registered definition tables](ssm/minetest/registered.lua)
- [ ] [Nodes](ssm/node.lua)
  - [ ] Describe mt.MapBlock and mt.MapChunk
- [ ] Map terminology and coordinates
- [x] [HUD](ssm/hud.lua)
- [x] Representations of simple things
  - [x] [Vector](common/vector.lua)
  - [x] [PointedThing](common/pointed.lua)
- [ ] Flag Specifier Format
- [ ] Items
- [ ] Groups
- [x] [Tool Capabilities](ssm/tool_caps.lua)
- [ ] Entity damage mechanism
- [ ] Metadata
- [ ] Formspec
- [ ] Inventory
- [x] [Colors](common/color.lua)
- [ ] Escape sequences
- [ ] [Spatial Vectors](common/vector.lua)
  - [x] Full form
  - [ ] Simple form as different type?
  - [ ] Separate Vector2 and Vector3?
- [ ] Helper functions
- [ ] Translations
- [ ] Perlin noise
- [x] [Ores](ssm/definitions/ore.lua)
- [ ] Decoration types
- [ ] Schematics
- [ ] Lua Voxel Manipulator
- [ ] Mapgen objects
- [ ] Registered entities
- [ ] L-system trees
- [ ] Privileges
- [ ] [Minetest namespace reference](ssm/minetest)
  - [ ] Utilities
  - [ ] Logging
  - [x] [Registration functions](ssm/minetest/register.lua)
  - [ ] Global callback registration functions
  - [ ] Setting-related
  - [ ] Authentication
  - [ ] Chat
  - [ ] Environment access
  - [ ] Mod channels
  - [ ] Inventory
  - [ ] Formspec
  - [ ] Item handling
  - [ ] Rollback
  - [ ] Defaults
  - [x] [Sounds](ssm/minetest/sounds.lua)
  - [ ] Timing
  - [ ] Async environment
  - [ ] Server
  - [ ] Bans
  - [ ] Particles
  - [ ] Schematics
  - [ ] HTTP Requests
  - [ ] Storage API
  - [ ] Misc
  - [ ] Global objects
  - [x] [Global tables](ssm/minetest/registered.lua)
- [ ] [Class reference](ssm/classes)
  - [ ] AreaStore
  - [x] [InvRef](ssm/classes/invref.lua)
  - [x] [ItemStack](ssm/classes/itemstack.lua)
  - [x] [ItemStackMetaRef](ssm/classes/metaref.lua)
  - [x] [MetaDataRef](ssm/classes/metaref.lua)
  - [ ] ModChannel
  - [x] [NodeMetaRef](ssm/classes/metaref.lua)
  - [ ] NodeTimerRef
  - [x] [ObjectRef](ssm/classes/objectref.lua)
  - [ ] PcgRandom
  - [ ] PerlinNoise
  - [ ] PerlinNoiseMap
  - [x] [PlayerMetaRef](ssm/classes/metaref.lua)
  - [ ] PseudoRandom
  - [ ] Raycast
  - [ ] SecureRandom
  - [ ] Settings
  - [x] [StorageRef](ssm/classes/metaref.lua)
- [ ] [Definition tables](ssm/definitions)
  - [x] [Object Properties](ssm/definitions/object.lua)
  - [x] [Entity definition](ssm/definitions/entity.lua)
  - [x] [ABM (ActiveBlockModifier) definition](ssm/definitions/abm.lua)
  - [x] [LBM (LoadingBlockModifier) definition](ssm/definitions/lbm.lua)
  - [x] [Tile definition](ssm/definitions/tile.lua)
  - [x] [Item definition](ssm/definitions/item.lua)
  - [x] [Node definition](ssm/definitions/node.lua)
  - [x] [Crafting recipes](ssm/definitions/recipe.lua)
  - [x] [Ore definition](ssm/definitions/ore.lua)
  - [ ] Biome definition
  - [ ] Decoration definition
  - [ ] Chat command definition
  - [ ] Privilege definition
  - [ ] Detached inventory callbacks
  - [x] [HUD Definition](ssm/definitions/hud.lua)
  - [ ] Particle definition
  - [ ] ParticleSpawner definition
  - [ ] HTTPRequest definition
  - [ ] Authentication handler definition
  - [ ] Bit Library

## Final tasks

- [ ] Check all `unknown` and `table` types
- [ ] Double check documentation and update it to the latest version
- [ ] Check all optional variables
- [ ] Mark optional class fields?
- [ ] Test it in an existed games
- [ ] Add examples
