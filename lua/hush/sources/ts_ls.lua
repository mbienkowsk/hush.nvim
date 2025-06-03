---@class TSLanguageServerSource: DiagnosticSource

---@class TSLanguageServerSource
local TSLS = {}

TSLS.comment_position = "above"

TSLS.build_suppress_all_diagnostics = function()
  return "// @ts-ignore"
end

TSLS.build_suppress_diagnostics = function(_)
  return TSLS.build_suppress_all_diagnostics()
end

TSLS.matches_diagnostic = function(diagnostic)
  return diagnostic.source == "typescript"
end

return TSLS
