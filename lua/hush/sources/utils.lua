local M = {}

---@param line_nr integer
---@return vim.Diagnostic[]
M.get_diagnostics_for_line = function(line_nr)
  return vim.diagnostic.get(vim.fn.bufnr(), { lnum = line_nr - 1 })
end

---@return vim.Diagnostic[]
M.get_diagnostics_for_current_line = function()
  local line_nr = vim.api.nvim_win_get_cursor(0)[1]
  return vim.diagnostic.get(0, { lnum = line_nr - 1 })
end

---@return table<string, string[]>
M.get_diagnostic_map_for_current_line = function()
  local diagnostics = M.get_diagnostics_for_current_line()
  local result = {}
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.source and diagnostic.code then
      result[diagnostic.source] = result[diagnostic.source] or {}
      local codes = result[diagnostic.source]
      if not vim.tbl_contains(codes, diagnostic.code) then
        table.insert(codes, diagnostic.code)
      end
    end
  end
  return result
end

return M
