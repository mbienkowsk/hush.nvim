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

--- Returns a map of diagnostics for the current line, grouped by their source.
---@return table<DiagnosticSource, vim.Diagnostic>
M.get_diagnostic_map_for_current_line = function()
  local diagnostics = M.get_diagnostics_for_current_line()
  local rv = {}

  for _, diagnostic in ipairs(diagnostics) do
    if not diagnostic.source or not diagnostic.code then
      vim.notify("Diagnostic without source encountered - skipping", vim.log.levels.WARN, { title = "hush" })
      goto continue
    end

    local source = M.get_source_for_diagnostic(diagnostic)
    if not source then
      vim.notify(
        "Diagnostic source '" .. diagnostic.source .. "' is not supported",
        vim.log.levels.WARN,
        { title = "hush" }
      )
      goto continue
    end

    rv[source] = rv[source] or {}
    table.insert(rv[source], diagnostic)

    ::continue::
  end

  return rv
end

--- Extracts unique diagnostic codes from a list of diagnostics
---@param diagnostics vim.Diagnostic[]
---@return string[]
M.get_sources_from_diagnostics = function(diagnostics)
  local sources = {}
  for _, diagnostic in ipairs(diagnostics) do
    if diagnostic.code and not vim.tbl_contains(sources, diagnostic.code) then
      table.insert(sources, diagnostic.code)
    end
  end
  return sources
end

--- Try to find a source that matches the given diagnostic.
---@param diagnostic vim.Diagnostic
---@return BasedPyrightSource | nil
M.get_source_for_diagnostic = function(diagnostic)
  local sources = require("hush.sources").all
  for _, source in ipairs(sources) do
    if source.matches_diagnostic(diagnostic) then
      return source
    end
  end
end

return M
