local sources = require("hush.sources")
local utils = require("hush.sources.utils")
local fileops = require("hush.fileops")

local M = {}

M.hush = function()
  local diagnostics = utils.get_diagnostic_map_for_current_line()

  for source, codes in pairs(diagnostics) do
    if sources[source] == nil then
      vim.notify("Diagnostic source '" .. source .. "' is not supported", vim.log.levels.WARN, { title = "hush" })
      goto continue
    end

    local comment = sources[source].build_suppress_diagnostics_of_codes(codes)
    local position = sources[source].comment_position
    local gap_width = 2 -- TODO: parametrize
    fileops.add_comment(comment, gap_width, position)

    ::continue::
  end
end

M.hush_all = function()
  local diagnostics = utils.get_diagnostic_map_for_current_line()

  for source, codes in pairs(diagnostics) do
    if sources[source] == nil then
      vim.notify("Diagnostic source '" .. source .. "' is not supported", vim.log.levels.WARN, { title = "hush" })
      goto continue
    end

    local comment = sources[source].build_suppress_all_diagnostics(codes)
    local position = sources[source].comment_position
    local gap_width = 2 -- TODO: parametrize
    fileops.add_comment(comment, gap_width, position)

    ::continue::
  end
end

return M
