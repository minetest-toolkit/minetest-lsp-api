---@meta
---Global objects
-----------------

-- `EnvRef` of the server environment and world.
-- - Any function in the minetest namespace can be called using the syntax
--   `minetest.env:somefunction(somearguments)` instead of
--   `minetest.somefunction(somearguments)`
-- - Deprecated, but support is not to be dropped soon.
---@type mt.Core
minetest.env = nil
