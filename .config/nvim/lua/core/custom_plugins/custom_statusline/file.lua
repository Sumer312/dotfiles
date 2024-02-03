local colors = require("core.custom_plugins.custom_statusline.colors").colors
local black_bg_colors = require("core.custom_plugins.custom_statusline.colors").black_bg_colors

local M = {}

local symbols = {
  modified = '[+]',
  readonly = '[-]',
  unnamed = '[No Name]',
  newfile = '[New]',
}

function M.filepath()
end

function M.filename()
  local fpath = vim.fn.expand("%:p:~")
  local fname = vim.fn.expand("%:t")
  if vim.bo.modified then
    fname = string.format("%s %s", fname, symbols.modified)
    fpath = string.format("%s %s", fpath, symbols.modified)
  end
  if vim.bo.modifiable == false or vim.bo.readonly then
    fname = fname .. ' ' .. symbols.readonly
    fpath = fpath .. ' ' .. symbols.readonly
  end
  if fpath == "" or fpath == "." then
    return string.format(" %s ", fname)
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
