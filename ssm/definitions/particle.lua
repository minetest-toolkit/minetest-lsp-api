---@meta
---Particle definition
----------------------

-- Used by `minetest.add_particle`.
---@class mt.ParticleDef
---@field pos mt.Vector
---@field velocity mt.Vector
-- Spawn particle at pos with velocity and acceleration.
---@field acceleration mt.Vector
-- Disappears after expirationtime seconds.
---@field expirationtime number
-- * Scales the visual size of the particle texture.
-- * If `node` is set, size can be set to 0 to spawn a randomly-sized
--   particle (just like actual node dig particles).
---@field size number
-- If true collides with `walkable` nodes and, depending on the
-- `object_collision` field, objects too.
---@field collisiondetection boolean
-- If true particle is removed when it collides.
-- Requires collisiondetection = true to have any effect.
---@field collision_removal boolean
-- * If true particle collides with objects that are defined as
--   `physical = true` and `collide_with_objects = true`.
-- * Requires collisiondetection = true to have any effect.
---@field object_collision boolean
-- If true faces player using y axis only.
---@field vertical boolean
-- The texture of the particle.
---@field texture string
-- Optional, if specified spawns particle only on the player's client.
---@field playername string|nil
-- Optional, specifies how to animate the particle texture.
---@field animation mt.TileAnimDef|nil
-- * Optional, specify particle self-luminescence in darkness.
-- * Values: `0..14`.
---@field glow number|nil
-- * Optional, if specified the particle will have the same appearance as
--   node dig particles for the given node.
-- * `texture` and `animation` will be ignored if this is set.
---@field node mt.Node|nil
-- * Optional, only valid in combination with `node`
--   If set to a valid number 1-6, specifies the tile from which the
--   particle texture is picked.
-- * Otherwise, the default behavior is used. (currently: any random tile)
---@field node_tile number|nil
