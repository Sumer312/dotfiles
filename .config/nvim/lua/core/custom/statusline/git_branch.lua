local git = function()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  return string.format("  %s ", git_info.head)
end
return git
