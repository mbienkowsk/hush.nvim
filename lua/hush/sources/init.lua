local M = {}
local basedpyright = require("hush.sources.basedpyright")
local lua_ls = require("hush.sources.lua_ls")

M.all = {
  basedpyright,
  lua_ls,
}

M.basedpyright = basedpyright
M.lua_ls = lua_ls

return M
