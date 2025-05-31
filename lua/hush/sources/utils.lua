local M = {}

M.get_diagnostics_for_line = function(line_nr)
  return vim.diagnostic.get(vim.fn.bufnr(), { lnum = line_nr - 1 })
end

M.get_diagnostics_for_current_line = function()
  local line_nr = vim.api.nvim_win_get_cursor(0)[1]
  return vim.diagnostic.get(0, { lnum = line_nr - 1 })
end

return M
