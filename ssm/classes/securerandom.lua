---@meta
---SecureRandom
---------------

-- Crypto-secure PRNG constructor.
--
-- Returns `nil` if a secure random device cannot be found on the system.
---@return mt.SecureRandom|nil
function SecureRandom() end

-- Interface for the operating system's crypto-secure PRNG.
--
-- It can be created via `SecureRandom()`.
---@class mt.SecureRandom
local SecureRandomClass

-- Return next `count`.
---@param count number|nil Many random bytes. Default 1, capped at 2048.
---@return string count
function SecureRandomClass:next_bytes(count) end
