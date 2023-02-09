---@meta
---Sounds
---------

---@alias mt.SoundHandle unknown

---* `parameters` is a sound parameter table
---@param spec mt.SimpleSoundSpec
---@param parameters table
--- `false`
--- Ephemeral sounds will not return a handle and can't be stopped or faded.
--- It is recommend to use this for short sounds that happen in response to
--- player actions (e.g. door closing).
---@param ephemeral boolean|nil
---@return mt.SoundHandle handle
function minetest.sound_play(spec, parameters, ephemeral) end

---@param handle mt.SoundHandle
function minetest.sound_stop(handle) end

---@param handle mt.SoundHandle
---@param step number
---@param gain number
function minetest.sound_fade(handle, step, gain) end
