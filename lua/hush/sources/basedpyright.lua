---@class BasedPyrightSource: DiagnosticSource

---@class BasedPyrightSource
local BP = {}

BP.comment_position = "current"

BP.build_suppress_all_diagnostics = function()
  return "pyright: ignore"
end

BP.build_suppress_diagnostics_of_codes = function(diagnostic_codes)
  return "pyright: ignore[" .. table.concat(diagnostic_codes, ", ") .. "]"
end

return BP
