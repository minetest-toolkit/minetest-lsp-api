---@meta
---Authentication handler definition
------------------------------------

-- Used by `minetest.register_authentication_handler`.
---@class mt.AuthHandlerDef
local auth = {}

-- Get authentication data for existing player `name` (`nil` if player doesn't exist).
---@param name string
---@return {password:string, privileges:table, last_login:number|nil}
function auth.get_auth(name) end

-- * Create new auth data for player `name`.
-- * Note that `password` is not plain-text but an arbitrary
--   representation decided by the engine.
---@param name string
---@param password string
function auth.create_auth(name, password) end

-- * Delete auth data of player `name`.
-- * Returns boolean indicating success (false if player is nonexistent).
---@param name string
---@return boolean success
function auth.delete_auth(name) end

-- * Set password of player `name` to `password`.
-- * Auth data should be created if not present.
---@param name string
---@param password string
function auth.set_password(name, password) end

-- * Set privileges of player `name`.
-- * Auth data should be created if not present.
---@param name string
---@param privileges table
function auth.set_privileges(name, privileges) end

-- * Reload authentication data from the storage location.
-- * Returns boolean indicating success.
function auth.reload() end

-- Called when player joins, used for keeping track of last_login.
---@param name string
function auth.record_login(name) end

-- Returns an iterator (use with `for` loops) for all player names
-- currently in the auth database.
---@return function
function auth.iterate() end
