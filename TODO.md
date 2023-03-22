# Roadmap

If you think that any of the items listed here is done, please tick it and add
links to the affected files to make it easier to update the documentation in the
future.

Feel free to add your subitems if item is partially done.

## Documentation

- [x] [Minetest Lua Modding API Reference](api/minetest/minetest.lua)
- [ ] Games
- [ ] Mods
- [ ] Aliases
- [ ] Textures
- [x] [Sounds](api/sounds.lua)
- [x] Registered definitions
  - [x] [Registration functions](api/minetest/register.lua)
  - [x] [Registered definition tables](api/minetest/registered.lua)
- [x] [Nodes](api/node.lua)
- [ ] Map terminology and coordinates
- [x] [HUD](api/hud.lua)
- [x] Representations of simple things
  - [x] [Vector](api/vector.lua)
  - [x] [PointedThing](api/pointed.lua)
- [ ] Flag Specifier Format
- [x] [Items](api/item.lua)
- [ ] Groups
- [x] [Tool Capabilities](api/tool_caps.lua)
- [ ] Entity damage mechanism
- [ ] Metadata
- [ ] Formspec
- [ ] Inventory
- [x] [Colors](api/color.lua)
- [x] [Escape sequences](api/escape.lua)
- [ ] [Spatial Vectors](api/vector.lua)
  - [x] Full form
  - [ ] Simple form as different type?
  - [ ] Separate Vector2 and Vector3?
- [ ] Helper functions
- [ ] Translations
- [ ] Perlin noise
- [x] [Ores](api/definitions/ore.lua)
- [x] [Decoration types](api/definitions/decor.lua)
- [x] [Schematics](api/definitions/schematic.lua)
- [ ] Lua Voxel Manipulator
- [ ] Mapgen objects
- [ ] Registered entities
- [ ] L-system trees
- [ ] Privileges
- [ ] [Minetest namespace reference](api/minetest)
  - [ ] Utilities
  - [ ] Logging
  - [x] [Registration functions](api/minetest/register.lua)
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
  - [x] [Sounds](api/minetest/sounds.lua)
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
  - [x] [Global tables](api/minetest/registered.lua)
- [x] [Class reference](api/classes)
  - [x] [AreaStore](api/classes/areastore.lua)
  - [x] [InvRef](api/classes/invref.lua)
  - [x] [ItemStack](api/classes/itemstack.lua)
  - [x] [ItemStackMetaRef](api/classes/metaref.lua)
  - [x] [MetaDataRef](api/classes/metaref.lua)
  - [x] [ModChannel](api/classes/modchannel.lua)
  - [x] [NodeMetaRef](api/classes/metaref.lua)
  - [x] [NodeTimerRef](api/classes/nodetimer.lua)
  - [x] [ObjectRef](api/classes/objectref.lua)
  - [x] [PcgRandom](api/classes/pcgrandom.lua)
  - [x] [PerlinNoise](api/classes/perlinnoise.lua)
  - [x] [PerlinNoiseMap](api/classes/perlinnoise.lua)
  - [x] [PlayerMetaRef](api/classes/metaref.lua)
  - [x] [PseudoRandom](api/classes/pseudorandom.lua)
  - [x] [Raycast](api/classes/raycast.lua)
  - [x] [SecureRandom](api/classes/securerandom.lua)
  - [x] Settings
  - [x] [StorageRef](api/classes/metaref.lua)
- [x] [Definition tables](api/definitions)
  - [x] [Object Properties](api/definitions/object.lua)
  - [x] [Entity definition](api/definitions/entity.lua)
  - [x] [ABM (ActiveBlockModifier) definition](api/definitions/abm.lua)
  - [x] [LBM (LoadingBlockModifier) definition](api/definitions/lbm.lua)
  - [x] [Tile definition](api/definitions/tile.lua)
  - [x] [Item definition](api/definitions/item.lua)
  - [x] [Node definition](api/definitions/node.lua)
  - [x] [Crafting recipes](api/definitions/recipe.lua)
  - [x] [Ore definition](api/definitions/ore.lua)
  - [x] [Biome definition](api/definitions/biome.lua)
  - [x] [Decoration definition](api/definitions/decor.lua)
  - [x] [Chat command definition](api/definitions/chat.lua)
  - [x] [Privilege definition](api/definitions/priv.lua)
  - [x] [Detached inventory callbacks](api/definitions/detached.lua)
  - [x] [HUD Definition](api/definitions/hud.lua)
  - [x] [Particle definition](api/definitions/particle.lua)
  - [x] [ParticleSpawner definition](api/definitions/particle_spawner.lua)
  - [x] [HTTPRequest definition](api/definitions/http.lua)
  - [x] [Authentication handler definition](api/definitions/auth.lua)
  - [x] Bit Library

## Final tasks

- [ ] Check all `unknown` and `table` types
- [ ] Double check documentation and update it to the latest version
- [ ] Check all optional variables
- [ ] Mark optional class fields?
- [ ] Test it in an existed games
- [ ] Add examples
