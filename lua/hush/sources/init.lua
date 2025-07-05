local M = {}
local basedpyright = require("hush.sources.basedpyright")
local lua_ls = require("hush.sources.lua_ls")
local clang_tidy = require("hush.sources.clang-tidy")

M.all = {
  basedpyright,
  lua_ls,
  clang_tidy,
}

M.basedpyright = basedpyright
M.lua_ls = lua_ls
M.clang_tidy = clang_tidy

return M
