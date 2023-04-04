---@meta
---HTTP Requests
----------------

---@class mt.HTTPRequest
local request = {}

---@type string
request.url = nil

-- Timeout for request to be completed in seconds.
-- Default depends on engine settings.
---@type number
request.timeout = nil

-- The http method to use. Defaults to `"GET"`.
---@type '"GET"'|'"POST"'|'"PUT"'|'"DELETE"'
request.method = nil

-- Data for the POST, PUT or DELETE request.
--
-- Accepts both a string and a table.
-- If a table is specified, encodes table as `x-www-form-urlencoded` key-value pairs.
---@type string|table
request.data = nil

-- Optional, if specified replaces the default minetest user agent with given string.
---@type string
request.user_agent = nil

-- Optional, if specified adds additional headers to the HTTP request.
--
-- You must make sure that the header strings follow HTTP specification ("Key: Value").
---@type string[]
request.extra_headers = nil

-- Optional, if true performs a multipart HTTP request.
--
-- Default is false.
--
-- POST only, data must be array.
---@type boolean
request.multipart = nil

---@class mt.HTTPRequestResult
local result = {}

-- If true, the request has finished (either succeeded, failed or timed out).
---@type boolean
result.completed = nil

-- If true, the request was successful.
---@type boolean
result.succeeded = nil

-- If true, the request timed out.
---@type boolean
result.timeout = nil

-- HTTP status code.
---@type integer
result.code = nil

-- Responce data.
---@type string
result.data = nil

---@class mt.HTTPApiTable
local api = {}

-- Performs given request asynchronously and calls callback upon completion.
--
-- Use this HTTP function if you are unsure, the others are for advanced use.
---@param req mt.HTTPRequest
---@param callback fun(res: mt.HTTPRequestResult)
function api.fetch(req, callback) end

-- Performs given request asynchronously
-- and returns handle for `HTTPApiTable.fetch_async_get`.
---@param req mt.HTTPRequest
---@return any
function api.fetch_async(req) end

-- Return response data for given asynchronous HTTP request.
---@param handle any
---@return mt.HTTPRequestResult
function api.fetch_async_get(handle) end

-- Returns `HTTPApiTable` containing http functions if the calling mod has been
-- granted access by being listed in the `secure.http_mods`
-- or `secure.trusted_mods` setting, otherwise returns `nil`.
--
-- Only works at init time and must be called from the mod's main scope (not from a function).
--
-- Function only exists if minetest server was built with cURL support.
--
-- **DO NOT ALLOW ANY OTHER MODS TO ACCESS THE RETURNED TABLE, STORE IT IN A LOCAL VARIABLE!**
---@return mt.HTTPApiTable
function minetest.request_http_api() end
