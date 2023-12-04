local update_mode_colors = require("core.custom_plugins.custom_statusline.colors").update_mode_colors

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
function M.lsp()
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
    if count["errors"] ~= 0 then
      errors = "%#DiagnosticSignError#" .. M.symbols.icons.error .. count["errors"] .. " "
    end
    if count["warnings"] ~= 0 then
      warnings = "%#DiagnosticSignWarn# " .. M.symbols.icons.warn .. count["warnings"] .. " "
    end
    if count["hints"] ~= 0 then
      hints = "%#DiagnosticSignHint# " .. M.symbols.icons.hint .. count["hints"] .. " "
    end
    if count["info"] ~= 0 then
      info = "%#DiagnosticSignInfo# " .. M.symbols.icons.info .. count["info"] .. " "
    end

    local str = errors .. warnings .. hints .. info
    return str
  else
    if count["errors"] ~= 0 then
      errors = update_mode_colors() .. M.symbols.icons.error .. count["errors"] .. " "
    end
    if count["warnings"] ~= 0 then
      warnings = update_mode_colors() .. M.symbols.icons.warn .. count["warnings"] .. " "
    end
    if count["hints"] ~= 0 then
      hints = update_mode_colors() .. M.symbols.icons.hint .. count["hints"] .. " "
    end
    if count["info"] ~= 0 then
      info = update_mode_colors() .. M.symbols.icons.info .. count["info"] .. " "
    end
    local str = errors .. warnings .. hints .. info
    return str
  end
end

return M
