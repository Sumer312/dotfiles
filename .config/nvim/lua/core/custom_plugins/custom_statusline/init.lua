local mode = require("core.custom_plugins.custom_statusline.modes").get_mode
local update_mode_colors = require("core.custom_plugins.custom_statusline.colors").update_mode_colors
local update_extra_colors = require("core.custom_plugins.custom_statusline.colors").update_extra_colors
local lsp = require("core.custom_plugins.custom_statusline.lsp").lsp
local filename = require("core.custom_plugins.custom_statusline.file").filename
local lineinfo = require("core.custom_plugins.custom_statusline.file").lineinfo
local update_file_colors = require("core.custom_plugins.custom_statusline.colors").update_file_colors
require("core.custom_plugins.custom_statusline.theme")

Statusline = {}

local seperator = "⏽"

Statusline.active = function()
  return table.concat {
    update_mode_colors(),
    mode(),
    update_file_colors(),
    filename(),
    seperator,
    " ",
    lsp(),
    update_extra_colors(),
    lineinfo(),
  }
end

function Statusline.inactive()
  return "%F"
end

vim.go.laststatus = 3

vim.cmd([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]], false)
