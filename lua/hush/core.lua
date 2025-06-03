local sources = require("hush.sources")
local utils = require("hush.sources.utils")
local fileops = require("hush.fileops")

local M = {}

--- For the current line, collect diagnostics and insert a comment to suppress them.
--- If 'mute' is true, suppress all diagnostics from the offending source; otherwise, suppress only the specific diagnostic codes present.
---@param mute boolean Suppress all diagnostics from the source (true) or only specific codes (false)
local _hush = function(mute)
  local diagnostics_map = utils.get_diagnostic_map_for_current_line()

  for source, diagnostic_list in pairs(diagnostics_map) do
    local line
    if mute then
      line = source.build_suppress_all_diagnostics()
    else
      line = source.build_suppress_diagnostics(diagnostic_list)
    end

    local position = source.comment_position
    local gap_width = 2 -- TODO: parametrize
    fileops.add_comment(line, gap_width, position)
  end
end

M.hush = function()
  _hush(false)
end

M.hush_all = function()
  _hush(true)
end

return M
