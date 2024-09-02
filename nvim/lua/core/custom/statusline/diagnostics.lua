local colors = require("core.custom.statusline.colors").colors

local M = {}

M.symbols = {
  icons = {
    error = '󰅚 ', -- x000f015a
    warn = '󰀪 ', -- x000f002a
    info = '󰋽 ', -- x000f02fd
    hint = '󰌶 ', -- x000f0336
  },
  no_icons = { error = 'E:', warn = 'W:', info = 'I:', hint = 'H:' },
}

M.options = {
  colored = true,
  update_in_insert = false,
  always_visible = false,
  sources = { 'nvim_diagnostic', 'coc' },
  sections = { 'error', 'warn', 'info', 'hint' },
}
function M.diagnostics()
  local count = {}
  local levels = {
    errors = "Error",
    warnings = "Warn",
    info = "Info",
    hints = "Hint",
  }

  for k, level in pairs(levels) do
    count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
  end

  local errors = ""
  local warnings = ""
  local hints = ""
  local info = ""
  if vim.api.nvim_get_mode().mode == "n" then
    local res = ""
    if count["errors"] ~= 0 then
      errors = string.format("%s %s%d", "%#DiagnosticSignError#", M.symbols.icons.error, count["errors"])
      res = string.format("%s", errors)
    end
    if count["warnings"] ~= 0 then
      warnings = string.format("%s %s%d", "%#DiagnosticSignWarn#", M.symbols.icons.warn, count["warnings"])
      res = string.format("%s%s", res, warnings)
    end
    if count["hints"] ~= 0 then
      hints = string.format("%s %s%d", "%#DiagnosticSignHint#", M.symbols.icons.hint, count["hints"])
      res = string.format("%s%s", res, hints)
    end
    if count["info"] ~= 0 then
      info = string.format("%s %s%d", "%#DiagnosticSignInfo#", M.symbols.icons.info, count["info"])
      res = string.format("%s%s", res, info)
    end
    return res
  else
    local res = ""
    if count["errors"] ~= 0 then
      errors = string.format("%s %s%d", colors(), M.symbols.icons.error, count["errors"])
      res = string.format("%s", errors)
    end
    if count["warnings"] ~= 0 then
      warnings = string.format("%s %s%d", colors(), M.symbols.icons.warn, count["warnings"])
      res = string.format("%s%s", res, warnings)
    end
    if count["hints"] ~= 0 then
      hints = string.format("%s %s%d", colors(), M.symbols.icons.hint, count["hints"])
      res = string.format("%s%s", res, hints)
    end
    if count["info"] ~= 0 then
      info = string.format("%s %s%d", colors(), M.symbols.icons.info, count["info"])
      res = string.format("%s%s", res, info)
    end

    return res
  end
end

return M
