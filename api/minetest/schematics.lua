---@meta
---Schematics
-------------

-- Create a schematic from the volume of map specified
-- by the box formed by `p1` and `p2`.
--
-- - Apply the specified probability and per-node force-place to the specified
--   nodes according to the `probability_list`.
-- - Apply the specified probability to the specified horizontal slices according
--   to the `slice_prob_list`.
-- - Saves schematic in the Minetest Schematic format to `filename`.
---@param p1 mt.Vector
---@param p2 mt.Vector
---@param probability_list mt.SchematicProbability[]
---@param filename string
---@param slice_prob_list mt.SchematicSliceProbability[]|nil
function minetest.create_schematic(p1, p2, probability_list, filename, slice_prob_list) end

-- Place the schematic specified by schematic at `pos`.
--
-- - If the `rotation` parameter is omitted, the schematic is not rotated.
-- - Returns nil if the schematic could not be loaded.
-- - **Warning**: Once you have loaded a schematic from a file, it will be
-- cached. Future calls will always use the cached version and the replacement
-- list defined for it, regardless of whether the file or the replacement list
-- parameter have changed. The only way to load the file anew is to restart the
-- server.
---@param pos mt.Vector
---@param schematic mt.SchematicSpec
---@param rotation "0"|"90"|"180"|"270"|"random"
---@param replacements {[string]: string}
---@param force_placement boolean Nodes other than `air` and `ignore` are replaced by the schematic.
---@param flags {place_center_x:boolean, place_center_y:boolean, place_center_z:boolean}
function minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags) end

-- Return the serialized schematic specified by schematic.
---@param schematic mt.SchematicSpec
---@param format mt.SchematicFormat
---@param options mt.SchematicSerializeOptions
---@return string
function minetest.serialize_schematic(schematic, format, options) end

-- Returns a Lua table representing the schematic.
---@param schematic mt.SchematicSpec
---@param options mt.SchematicReadOptions
---@return  mt.SchematicSpec
function minetest.read_schematic(schematic, options) end
