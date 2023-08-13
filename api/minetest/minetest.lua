---@meta

---Minetest 5.7 [2a1bc8](https://github.com/minetest/minetest/blob/2a1bc8/doc/lua_api.txt) API
---
---* [Official site](http://www.minetest.net)
---* [Developer Wiki](http://dev.minetest.net)
---* [Unofficial Modding Book](https://rubenwardy.com/minetest_modding_book)
---@class mt.Core
minetest = {
  CONTENT_AIR = 126,
  CONTENT_IGNORE = 127,
  CONTENT_UNKNOWN = 125,
  EMERGE_CANCELLED = 0,
  EMERGE_ERRORED = 1,
  EMERGE_FROM_DISK = 3,
  EMERGE_FROM_MEMORY = 2,
  EMERGE_GENERATED = 4,
  LIGHT_MAX = 14,
  MAP_BLOCKSIZE = 16,
  PLAYER_MAX_BREATH_DEFAULT = 10,
  PLAYER_MAX_HP_DEFAULT = 20,
}

---@deprecated
---@type mt.Core
minetest = {}
