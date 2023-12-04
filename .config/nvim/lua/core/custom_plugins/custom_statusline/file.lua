local M = {}

local default_options = {
  symbols = {
    modified = '[+]',
    readonly = '[-]',
    unnamed = '[No Name]',
    newfile = '[New]',
  },
  file_status = true,
  newfile_status = false,
  path = 0,
  shorting_target = 40,
}

function M.filepath()
end

function M.filename()
  local fpath = vim.fn.expand("%:p:~")
  local fname = vim.fn.expand("%:t")
  if vim.bo.modified then
    fname = fname .. ' ' .. default_options.symbols.modified
    fpath = fpath .. ' ' .. default_options.symbols.modified
  end
  if vim.bo.modifiable == false or vim.bo.readonly then
    fname = fname .. ' ' .. default_options.symbols.readonly
    fpath = fpath .. ' ' .. default_options.symbols.readonly
  end
  if fpath == "" or fpath == "." then
    return " " .. fname .. " "
  end
  return " " .. fpath .. " "
end

function M.filetype()
  return string.format(" %s ", vim.bo.filetype):upper()
end

function M.lineinfo()
  if vim.bo.filetype == "alpha" then
    return ""
  end
  return " %l:%c "
end

return M
