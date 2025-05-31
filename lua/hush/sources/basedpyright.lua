---@class BasedPyrightSource: DiagnosticSource

---@class BasedPyrightSource
local BP = {}

BP.comment_start = "#"
BP.name = "#"

BP.build_suppress_all_diagnostics = function()
  return "pyright: ignore"
end

BP.build_suppress_diagnostics_of_type = function(diagnostic_type)
  return "pyright: ignore[" .. diagnostic_type .. "]"
end

BP.get_type_from_diagnostic = function() end

return BP
