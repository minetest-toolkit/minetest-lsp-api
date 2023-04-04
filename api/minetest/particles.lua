---@meta
---Particles
------------

---@param particle mt.ParticleDef
function minetest.add_particle(particle) end

---@param particlespawner mt.ParticleSpawnerDef
---@return number id
function minetest.add_particlespawner(particlespawner) end

-- Delete `ParticleSpawner` with `id`
-- (return value from `minetest.add_particlespawner`).
--
-- If `playername` is specified, only deletes on the player's client,
-- otherwise on all clients.
---@param id number
---@param playername string
function minetest.delete_particlespawner(id, playername) end
