local utils = require("hush.sources.utils")
---@class BasedPyrightSource: DiagnosticSource

---@class BasedPyrightSource
local BP = {}

BP.comment_position = "current"

BP.build_suppress_all_diagnostics = function()
  return "# pyright: ignore"
end

BP.build_suppress_diagnostics = function(diagnostics)
  local codes = utils.get_sources_from_diagnostics(diagnostics)
  local codes_str = table.concat(codes, ", ")

  return "# pyright: ignore[" .. codes_str .. "]"
end

BP.matches_diagnostic = function(diagnostic)
  return diagnostic.source == "basedpyright"
end

return BP
