local utils = require("hush.sources.utils")
---@class TySource: DiagnosticSource

---@class TySource
local TY = {}

TY.comment_position = "current"

TY.build_suppress_all_diagnostics = function()
    return "# ty: ignore"
end

TY.build_suppress_diagnostics = function(diagnostics)
    local codes = utils.get_sources_from_diagnostics(diagnostics)
    local codes_str = table.concat(codes, ", ")

    return "# ty: ignore[" .. codes_str .. "]"
end

TY.matches_diagnostic = function(diagnostic)
    return diagnostic.source == "ty"
end

return TY
