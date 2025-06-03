---@class (exact) DiagnosticSource
---@field comment_position CommentPosition // whether the diagnostic ignore comment is supposed to be above or on the offending line
---@field build_suppress_all_diagnostics fun(): string // builds a comment that suppresses all diagnostics from this source
---@field build_suppress_diagnostics fun(diagnostics: vim.Diagnostic[]): string // builds a line that suppresses all given diagnostics
---@field matches_diagnostic fun(diagnostic: vim.Diagnostic): boolean // checks if the diagnostic source matches the given diagnostic (some LSPs have provide multiple sources, e.g. LuaLS has Lua Diagnostics, Lua Syntax Check, etc.)

---@enum CommentPosition
local _ = {
  ABOVE = "above",
  CURRENT = "current",
}
