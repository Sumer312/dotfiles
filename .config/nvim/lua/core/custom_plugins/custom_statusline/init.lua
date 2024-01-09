local mode = require("core.custom_plugins.custom_statusline.modes").get_mode
local update_mode_colors = require("core.custom_plugins.custom_statusline.colors").update_mode_colors
local update_extra_colors = require("core.custom_plugins.custom_statusline.colors").update_extra_colors
local update_lsp_colors = require("core.custom_plugins.custom_statusline.colors").update_lsp_colors
local lsp = require("core.custom_plugins.custom_statusline.lsp").lsp
local filename = require("core.custom_plugins.custom_statusline.file").filename
local lineinfo = require("core.custom_plugins.custom_statusline.file").lineinfo
local update_file_colors = require("core.custom_plugins.custom_statusline.colors").update_file_colors
local git = require("core.custom_plugins.custom_statusline.git_signs")
require("core.custom_plugins.custom_statusline.theme")

Statusline = {}

local seperator = "⏽"

Statusline.active = function()
  local lspServer
  pcall(function()
    lspServer = tostring(vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })[1].name)
  end)
  return table.concat {
    update_mode_colors(),
    mode(),
    update_file_colors(),
    filename(),
    seperator,
    git(),
    update_file_colors(),
    lsp(),
    update_file_colors(),
    "%=",
    string.format("Lsp: %s", lspServer),
    update_extra_colors(),
    lineinfo(),
  }
end

Statusline.inactive = function()
  return table.concat {
    update_file_colors(),
    filename(),
    update_extra_colors(),
    lineinfo(),
  }
end

vim.go.laststatus = 3

vim.cmd([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
