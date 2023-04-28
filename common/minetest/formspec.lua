---@meta
---Formspec
-----------

-- Show a formspec to a player.
---@param playername string Name of player to show formspec.
---@param formname string Passed to `on_player_receive_fields` callbacks, should follow the `"modname:<whatever>"` naming convention.
---@param formspec string Formspec to display.
function minetest.show_formspec(playername, formname, formspec) end

-- Close a formspec.
--
-- Calling `show_formspec(playername, formname, "")` is equal to this expression.
--
-- To close a formspec regardless of the formname, call `minetest.close_formspec(playername, "")`.
--
-- **USE THIS ONLY WHEN ABSOLUTELY NECESSARY!**
---@param playername string Name of player to close formspec
---@param formname string Has to exactly match the one given in `show_formspec`, or the formspec will not close
function minetest.close_formspec(playername, formname) end

-- Escapes the characters `"["`, `"]"`, `"\"`, `","` and `";"`,
-- which can not be used in formspecs.
---@param string string
---@return string
---@nodiscard
function minetest.formspec_escape(string) end

-- Returns e.g. `{type="CHG", row=1, column=2}`
--
-- `type` is one of:
-- * `"INV"`: no row selected
-- * `"CHG"`: selected
-- * `"DCL"`: double-click
---@param string string
---@return {type: '"INV"'|'"CHG"'|'"DCL"', row: integer, column: integer}
---@nodiscard
function minetest.explode_table_event(string) end

-- Returns e.g. `{type="CHG", index=1}`
--
-- `type` is one of:
-- * `"INV"`: no row selected
-- * `"CHG"`: selected
-- * `"DCL"`: double-click
---@param string string
---@return {type: '"INV"'|'"CHG"'|'"DCL"', index: integer}
---@nodiscard
function minetest.explode_textlist_event(string) end

-- Returns e.g. `{type="CHG", value=500}`
--
-- `type` is one of:
-- * `"INV"`: something failed
-- * `"CHG"`: has been changed
-- * `"VAL"`: not changed
---@param string string
---@return {type: '"INV"'|'"CHG"'|'"DCL"', value: integer}
---@nodiscard
function minetest.explode_scrollbar_event(string) end
