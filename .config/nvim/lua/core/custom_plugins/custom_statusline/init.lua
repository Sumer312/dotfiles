local mode = require("core.custom_plugins.custom_statusline.modes").get_mode
local colors = require("core.custom_plugins.custom_statusline.colors").colors
local black_bg_colors = require("core.custom_plugins.custom_statusline.colors").black_bg_colors
local inverse_colors = require("core.custom_plugins.custom_statusline.colors").inverse_colors
local diagnostics = require("core.custom_plugins.custom_statusline.diagnostics").diagnostics
local filename = require("core.custom_plugins.custom_statusline.file").filename
local filetype = require("core.custom_plugins.custom_statusline.file").filetype
local lineinfo = require("core.custom_plugins.custom_statusline.file").lineinfo
local getIcon = require("core.custom_plugins.custom_statusline.icons").getIcon
local git = require("core.custom_plugins.custom_statusline.git_branch")
require("core.custom_plugins.custom_statusline.theme")

Statusline = {}

Statusline.active = function()
  local lspTable = {}
  local lspString = ""
  pcall(function()
    local length = #vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })

    for i = 1, length, 1 do
      lspTable[i] = tostring(vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })[i].name)
      if i == 1 then
        lspString = string.format("%s", lspTable[i])
        goto continue
      end
      lspString = string.format("%s, %s", lspString, lspTable[i])
      ::continue::
    end

    if #lspString == 0 then
      lspString = " "
    end
  end)
  return table.concat {
    colors(),
    mode(),
    black_bg_colors(),
    getIcon(),
    filetype(),
    git(),
    inverse_colors(),
    filename(),
    diagnostics(),
    inverse_colors(),
    "%=",
    string.format("Language Servers: %s  ", lspString),
    colors(),
    lineinfo(),
  }
end

Statusline.inactive = function()
  return table.concat {
    inverse_colors(),
    filename(),
    "%=",
    colors(),
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

