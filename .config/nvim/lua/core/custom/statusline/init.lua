local mode = require("core.custom.statusline.modes").get_mode
local colors = require("core.custom.statusline.colors").colors
local black_bg_colors = require("core.custom.statusline.colors").black_bg_colors
local inverse_colors = require("core.custom.statusline.colors").inverse_colors
local diagnostics = require("core.custom.statusline.diagnostics").diagnostics
local filename = require("core.custom.statusline.file").filename
local lineinfo = require("core.custom.statusline.file").lineinfo
local getIcon = require("core.custom.statusline.icons").getIcon
local git = require("core.custom.statusline.git_branch")
require("core.custom.statusline.theme")

Statusline = {}

Statusline.active = function()
  local lspTable = {}
  local lspString = ""
  local lsPrefix = ""
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

    if #lspTable == 0 then
      lspString = " "
    else
      lsPrefix = " :"
    end
  end)
  return table.concat {
    colors(),
    mode(),
    black_bg_colors(),
    git(),
    inverse_colors(),
    getIcon(),
    filename(),
    diagnostics(),
    inverse_colors(),
    "%=",
    string.format("%s %s ", lsPrefix, lspString),
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
  au User StartifyReady setlocal statusline=%!v:lua.Statusline.active()
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinEnter,BufEnter netrw setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  augroup END
]], false)
