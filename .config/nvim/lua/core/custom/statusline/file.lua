local colors = require("core.custom.statusline.colors").colors
local black_bg_colors = require("core.custom.statusline.colors").black_bg_colors

local M = {}

local symbols = {
  modified = '[+]',
  readonly = '[-]',
  unnamed = '[No Name]'
}

function M.filename()
  local fpath = vim.fn.expand("%:p:~")
  if vim.bo.modifiable == true and vim.bo.modified then
    fpath = string.format("%s %s", fpath, symbols.modified)
  end
  if vim.bo.modifiable == false or vim.bo.readonly == true then
    fpath = string.format("%s %s", fpath, symbols.readonly)
  end
  return string.format(" %s ", fpath)
end

function M.filetype()
  return string.format(" %s ", vim.bo.filetype)
end

function M.lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  local ln_and_cn = string.format(" %s:%s ", "%l", "%c")
  local percentage = string.format(" %s%% ", "%p%")
  return table.concat {
    black_bg_colors(),
    percentage,
    colors(),
    ln_and_cn
  }
end

return M
