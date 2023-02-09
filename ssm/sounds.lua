---@meta
---Sounds
---------

-- These sound files are played back by the engine if provided.
---@alias mt.SpecialSoundFile
-- Played when the local player takes damage (gain = 0.5).
---|"player_damage"
-- Played when the local player takes damage by falling (gain = 0.5).
---|"player_falling_damage"
-- Played when the local player jumps.
---|"player_jump"
-- Default node digging sound.
---|"default_dig_<groupname>"

---Specifies a sound name, gain (=volume) and pitch.
---This is either a string or a table.
---
---In string form, you just specify the sound name or
---the empty string for no sound.
---
---Table form has the following fields:
---
---* `name`: Sound name
---* `gain`: Volume (`1.0` = 100%)
---* `pitch`: Pitch (`1.0` = 100%)
---
---`gain` and `pitch` are optional and default to `1.0`.
---
---Examples:
---
---* `""`: No sound
---* `{}`: No sound
---* `"default_place_node"`: Play e.g. `default_place_node.ogg`
---* `{name = "default_place_node"}`: Same as above
---* `{name = "default_place_node", gain = 0.5}`: 50% volume
---* `{name = "default_place_node", gain = 0.9, pitch = 1.1}`: 90% volume, 110% pitch
---
---@class mt.SimpleSoundSpecTable
---@field name string|mt.SpecialSoundFile
---@field gain number
---@field pitch number
local sound_spec = {}

---@alias mt.SimpleSoundSpec mt.SimpleSoundSpecTable|string|mt.SpecialSoundFile

---Looped sounds must either be connected to an object or played locationless to
---one player using `to_player = name`.
---
---A positional sound will only be heard by players that are within
---`max_hear_distance` of the sound position, at the start of the sound.
---
---`exclude_player = name` can be applied to locationless, positional and object-
---bound sounds to exclude a single player from hearing them.
---@class mt.SoundParameters
---@field gain number Default: `1.0`.
---@field pitch number Default: `1.0`.
---@field fade number Default: `0.0`. Change to a value > 0 to fade the sound in.
---@field to_player string Name.
---@field exclude_player string Name.
---@field loop boolean
---@field pos mt.Vector
---@field max_hear_distance number Default: `32`.
---@field object mt.ObjectRef
local sound_parameters = {}

---@class mt.SoundHandle

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