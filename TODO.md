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
- [ ] Sounds
- [x] Registered definitions
  - [x] [Registration functions](ssm/minetest/register.lua)
  - [x] [Registered definition tables](ssm/minetest/registered.lua)
- [ ] [Nodes](ssm/node.lua)
  - [ ] Describe mt.MapBlock and mt.MapChunk
- [ ] Map terminology and coordinates
- [ ] HUD
- [ ] Representations of simple things
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
- [ ] Helper functions
- [ ] Translations
- [ ] Perlin noise
- [ ] Ores
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
  - [ ] Sounds
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
  - [ ] ItemStackMetaRef
  - [ ] MetaDataRef
  - [ ] ModChannel
  - [ ] NodeMetaRef
  - [ ] NodeTimerRef
  - [x] [ObjectRef](ssm/classes/objectref.lua)
  - [ ] PcgRandom
  - [ ] PerlinNoise
  - [ ] PerlinNoiseMap
  - [ ] PlayerMetaRef
  - [ ] PseudoRandom
  - [ ] Raycast
  - [ ] SecureRandom
  - [ ] Settings
  - [ ] StorageRef
- [ ] [Definition tables](ssm/definitions)
  - [x] [Object Properties](ssm/definitions/object.lua)
  - [x] [Entity definition](ssm/definitions/entity.lua)
  - [x] [ABM (ActiveBlockModifier) definition](ssm/definitions/abm.lua)
  - [x] [LBM (LoadingBlockModifier) definition](ssm/definitions/lbm.lua)
  - [x] [Tile definition](ssm/definitions/tile.lua)
  - [x] [Item definition](ssm/definitions/item.lua)
  - [x] [Node definition](ssm/definitions/node.lua)
  - [ ] Crafting recipes
  - [ ] Ore definition
  - [ ] Biome definition
  - [ ] Decoration definition
  - [ ] Chat command definition
  - [ ] Privilege definition
  - [ ] Detached inventory callbacks
  - [ ] HUD Definition
  - [ ] Particle definition
  - [ ] ParticleSpawner definition
  - [ ] HTTPRequest definition
  - [ ] Authentication handler definition
  - [ ] Bit Library

## Final tasks

- [ ] Check all `unknown` and `table` types
- [ ] Double check documentation and update it to the latest version
- [ ] Check all optional variables
- [ ] Test it in an existed games
- [ ] Add examples
