local utils = require("hush.sources.utils")

local M = {}

M.setup = function()
  vim.keymap.set("n", "<leader>nn", function()
    vim.notify(vim.inspect(utils.get_diagnostics_for_current_line()))
  end)
end

return M
