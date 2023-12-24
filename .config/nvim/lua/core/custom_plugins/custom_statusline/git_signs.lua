local git = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
local seperator = "⏽"
  return table.concat {
    "  ",
    git_info.head,
    " ",
    seperator
  }
end
return git
