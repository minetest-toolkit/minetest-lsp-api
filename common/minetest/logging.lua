---@meta
---Logging functions
--------------------

---@alias mt.LogLevel
---|"none"
---|"error"
---|"warning"
---|"action"
---|"info"
---|"verbose"

---@param level mt.LogLevel
---@param text string
function minetest.log(level, text) end

---@param text string
---Log level `"none"`.
function minetest.log(text) end

---Equivalent to `minetest.log(table.concat({...}, "\t"))`.
---@see minetest.log
function minetest.debug(...) end
