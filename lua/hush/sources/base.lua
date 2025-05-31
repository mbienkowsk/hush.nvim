---@class DiagnosticSource
---@field comment_position CommentPosition // whether the diagnostic ignore comment is supposed to be above or on the offending line
---@field build_suppress_all_diagnostics fun(): string // builds a comment that suppresses all diagnostics from this source
---@field build_suppress_diagnostics_of_codes fun(): string // builds a comment that suppresses all diagnostics with the given codes

---@enum CommentPosition
local _ = {
  ABOVE = "above",
  CURRENT = "current",
}
