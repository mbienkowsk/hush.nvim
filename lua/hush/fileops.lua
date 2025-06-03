local M = {}

---@param contents string
---@param gap_width integer
---@param position CommentPosition
M.add_comment = function(contents, gap_width, position)
  local line = vim.api.nvim_get_current_line()

  local gap = string.rep(" ", gap_width)
  local new_line

  if position == "above" then
    local current_line_nr = vim.api.nvim_win_get_cursor(0)[1]
    local current_line_indent = line:match("^(%s*)") or ""
    contents = current_line_indent .. contents
    vim.api.nvim_buf_set_lines(0, current_line_nr - 1, current_line_nr - 1, false, { contents })
    return
  end

  if line ~= "" then
    new_line = line .. gap .. contents
  else
    new_line = contents
  end

  vim.api.nvim_set_current_line(new_line)
end

return M
