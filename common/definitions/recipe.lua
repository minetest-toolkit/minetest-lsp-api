---@meta
---Crafting recipes
-------------------

-- Used by `minetest.register_craft`.
---@alias mt.CraftRecipe mt.CraftRecipeRepair|mt.CraftRecipeFuel|mt.CraftRecipeShaped|mt.CraftRecipeCooking|mt.CraftRecipeShapeless

---@class mt.CraftRecipeShaped
---@field output string
---@field recipe string[][]
-- Replace one input item with another item on crafting.
---@field replacements nil|{[1]:string, [2]:string}[]

---@class mt.CraftRecipeShapeless
---@field type "shapeless"
---@field output string
---@field recipe string[]
-- Replace one input item with another item on crafting.
---@field replacements nil|{[1]:string, [2]:string}[]

-- Adds a shapeless recipe for *every* tool that doesn't have the `disable_repair=1`
-- group. Player can put 2 equal tools in the craft grid to get one "repaired" tool
-- back.
--
-- The wear of the output is determined by the wear of both tools, plus a
-- 'repair bonus' given by `additional_wear`. To reduce the wear (i.e. 'repair'),
-- you want `additional_wear` to be negative.
--
-- The formula used to calculate the resulting wear is:
--
--     65536 - ( (65536 - tool_1_wear) + (65536 - tool_2_wear) + 65536 * additional_wear )
--
-- The result is rounded and can't be lower than 0. If the result is 65536 or higher,
-- no crafting is possible.
---@class mt.CraftRecipeRepair
---@field type "toolrepair"
---@field additional_wear number Multiplier of 65536.

---@class mt.CraftRecipeCooking
---@field type "cooking"
---@field output string
---@field recipe string
---@field cooktime number

---@class mt.CraftRecipeFuel
---@field type "fuel"
---@field recipe string
---@field burntime number
-- Replace one input item with another item on crafting.
---@field replacements nil|{[1]:string, [2]:string}[]
