local utils = require("hush.sources.utils")
---@class LuaLSSource: DiagnosticSource

---@class LuaLSSource
local LLS = {}

LLS.comment_position = "above"

--- LuaLS does not allow suppressing all diagnostics at once: https://luals.github.io/wiki/annotations/#diagnostic
LLS.build_suppress_all_diagnostics = function(diagnostics)
  return LLS.build_suppress_diagnostics(diagnostics)
end

LLS.build_suppress_diagnostics = function(diagnostics)
  local sources = utils.get_sources_from_diagnostics(diagnostics)
  local sources_str = table.concat(sources, ", ")
  return "---@diagnostic disable-next-line: " .. sources_str
end

---@param diagnostic vim.Diagnostic
---@return boolean
LLS.matches_diagnostic = function(diagnostic)
  return string.sub(diagnostic.source, 1, 3) == "Lua"
end

return LLS
