local M = {}
local basedpyright = require("hush.sources.basedpyright")
local lua_ls = require("hush.sources.lua_ls")
local ts_ls = require("hush.sources.ts_ls")

M.all = {
  basedpyright,
  lua_ls,
  ts_ls,
}

M.basedpyright = basedpyright
M.lua_ls = lua_ls
M.ts_ls = ts_ls

return M
