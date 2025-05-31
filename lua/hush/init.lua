local hush = require("hush.core")

local M = {}

M.setup = function()
  vim.api.nvim_create_user_command("Hush", hush.hush, {})
  vim.api.nvim_create_user_command("HushAll", hush.hush_all, {})
end

return M
