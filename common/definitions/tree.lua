---@meta
---Tree definition
------------------

--[[ Example:

Spawn a small apple tree:

    pos = {x=230,y=20,z=4}
    apple_tree={
        axiom="FFFFFAFFBF",
        rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
        rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
        trunk="default:tree",
        leaves="default:leaves",
        angle=30,
        iterations=2,
        random_level=0,
        trunk_type="single",
        thin_branches=true,
        fruit_chance=10,
        fruit="default:apple"
    }
    minetest.spawn_tree(pos,apple_tree)
]]
---@class mt.TreeDef
---@field axiom mt.TreeAxioms Initial tree axiom.
---@field rules_a mt.TreeAxioms Rules set A.
---@field rules_b mt.TreeAxioms Rules set B.
---@field rules_c mt.TreeAxioms Rules set C.
---@field rules_d mt.TreeAxioms Rules set D.
---@field trunk string Trunk node name.
---@field leaves string Leaves node name.
---@field leaves2 string Secondary leaves node name.
---@field leaves2_chance number Chance (0-100) to replace leaves with leaves2.
---@field angle number Angle in deg.
---@field iterations number Max number of iterations, usually 2-5.
---@field random_level number Factor to lower number of iterations, usually 0-3.
-- Type of trunk: 1 node, 2x2 nodes or 3x3 in cross shape.
---@field trunk_type "single"|"double"|"crossed"
---@field thin_branches boolean
---@field fruit string Fruit node name.
---@field fruit_chance number Chance (0-100) to replace leaves with fruit node.
---@field seed number Seed, if no seed is provided, the engine will create one.

--[[ Key for special L-System symbols used in axioms:

- `G`: Move forward one unit with the pen up.
- `F`: Move forward one unit with the pen down drawing trunks and branches.
- `f`: Move forward one unit with the pen down drawing leaves (100% chance).
- `T`: Move forward one unit with the pen down drawing trunks only.
- `R`: Move forward one unit with the pen down placing fruit.
- `A`: Replace with rules set A.
- `B`: Replace with rules set B.
- `C`: Replace with rules set C.
- `D`: Replace with rules set D.
- `a`: Replace with rules set A, chance 90%.
- `b`: Replace with rules set B, chance 80%.
- `c`: Replace with rules set C, chance 70%.
- `d`: Replace with rules set D, chance 60%.
- `+`: Yaw the turtle right by `angle` parameter.
- `-`: Yaw the turtle left by `angle` parameter.
- `&`: Pitch the turtle down by `angle` parameter.
- `^`: Pitch the turtle up by `angle` parameter.
- `/`: Roll the turtle to the right by `angle` parameter.
- `*`: Roll the turtle to the left by `angle` parameter.
- `[`: Save in stack current state info.
- `]`: Recover from stack state info.
]]
---@alias mt.TreeAxioms string
