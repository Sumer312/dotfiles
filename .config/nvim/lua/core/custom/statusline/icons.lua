local M = {}
function M.getIcon()
  local ok, devicons = pcall(require, 'nvim-web-devicons')
  local icon, icon_highlight_group
  if ok then
    icon, icon_highlight_group = devicons.get_icon(vim.fn.expand('%:t'))
    if icon == nil then
      icon, icon_highlight_group = devicons.get_icon_by_filetype(vim.bo.filetype)
    end

    if icon == nil and icon_highlight_group == nil then
      icon = ''
      icon_highlight_group = 'DevIconDefault'
    end
  end
  return string.format(" %s", icon)
end

return M
