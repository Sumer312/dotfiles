local palatte = require("core.theme_colors")

function ColorMyPencils(color)
  color = color or "kanagawa-wave"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = palatte.roninYellow })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  vim.api.nvim_set_hl(0, "Comment", { fg = palatte.katanaGray, italic = true })
  vim.api.nvim_set_hl(0, "function", { fg = palatte.crystalBlue })
  vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
  vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
  vim.api.nvim_set_hl(0, "WinBar", { bg = "none" })
  vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = palatte.dragonGreen })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", fg = palatte.springGreen })
  vim.api.nvim_set_hl(0, "WinSeparator", { fg = palatte.lotusWhite5 })

  vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = palatte.lotusGreen2, italic = true })
  vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = palatte.lotusYellow4 })

  vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = palatte.lotusGreen2 })
  vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none", fg = palatte.lotusGreen2 })
  vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", { bg = "none", fg = palatte.lotusGreen2 })
  vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "white" })
  vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = "white" })
  vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = palatte.lotusGreen2 })
  vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = palatte.oniViolet2 })

  vim.api.nvim_set_hl(0, "LineNr", { fg = palatte.carpYellow })
  vim.api.nvim_set_hl(0, "CursorLineNr", { fg = palatte.springGreen, bold = true, italic = true })
  vim.api.nvim_set_hl(0, "CursorLine", { bg = palatte.dragonBlack0 })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

  vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = palatte.samuraiRed, bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = palatte.surimiOrange, bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = palatte.waveAqua3, bg = "none" })
  vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = palatte.springBlue, bg = "none" })

  vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = palatte.springGreen, bg = "none" })
  vim.api.nvim_set_hl(0, "GitSignsChange", { fg = palatte.roninYellow, bg = "none" })
  vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = palatte.samuraiRed, bg = "none" })

  vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = palatte.roninYellow, fg = palatte.dragonBlack0, bold = true, italic = true })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = palatte.waveAqua3, fg = palatte.waveAqua3 })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "none" })
end

ColorMyPencils("kanagawa-wave")
