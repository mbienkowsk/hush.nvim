local M = {}

---@param contents string
---@param gap_width integer
---@param position CommentPosition
M.add_comment = function(contents, gap_width, position)
  local line = vim.api.nvim_get_current_line()
  local template = vim.bo.commentstring

  local gap = string.rep(" ", gap_width)
  local new_line

  local comment = string.format(template, contents)

  if position == "above" then
    local current_line_nr = vim.api.nvim_win_get_cursor(0)[1]
    vim.api.nvim_buf_set_lines(0, current_line_nr - 1, current_line_nr - 1, false, { comment })
    return
  end

  if line ~= "" then
    new_line = line .. gap .. comment
  else
    new_line = comment
  end

  vim.api.nvim_set_current_line(new_line)
end

return M
