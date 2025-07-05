local utils = require("hush.sources.utils")
---@class ClangTidyDiagnosticSource: DiagnosticSource

---@class ClangTidyDiagnosticSource
local CT = {}

CT.comment_position = "above"

CT.build_suppress_all_diagnostics = function()
  return "// NOLINTNEXTLINE"
end

CT.build_suppress_diagnostics = function(diagnostics)
  local codes = utils.get_sources_from_diagnostics(diagnostics)
  local codes_str = table.concat(codes, ", ")

  return "// NOLINTNEXTLINE( " .. codes_str .. " )"
end

CT.matches_diagnostic = function(diagnostic)
  return diagnostic.source == "clang-tidy"
end

return CT
