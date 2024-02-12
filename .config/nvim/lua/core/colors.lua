local palatte = require("core.color_palatte")
local ColorMyLines = require("core.custom_plugins.custom_statusline.theme").ColorMyLines

function ColorMyPencils(color)
  color = color or "kanagawa-wave"
  vim.cmd.colorscheme(color)
  local set = vim.api.nvim_set_hl

  set(0, "Normal", { bg = "none" })
  set(0, "Visual", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0 })
  set(0, "FloatBorder", { fg = palatte.fujiWhite })
  set(0, "NormalFloat", { bg = "none" })
  set(0, "Comment", { fg = palatte.katanaGray, italic = true })
  set(0, "function", { fg = palatte.crystalBlue })
  set(0, "TabLine", { bg = "none" })
  set(0, "TabLineFill", { bg = "none" })
  set(0, "TabLineSel", { bg = "none" })
  set(0, "WinBar", { bg = "none" })
  set(0, "EndOfBuffer", { fg = palatte.katanaGray })
  set(0, "WinSeparator", { fg = palatte.lotusWhite5 })

  set(0, "DiagnosticWarn", { fg = palatte.surimiOrange })
  set(0, "DiagnosticHint", { fg = palatte.lotusCyan })
  set(0, "DiagnosticInfo", { fg = palatte.springBlue })
  set(0, "DiagnosticError", { fg = palatte.samuraiRed })

  set(0, "Harpoon", { fg = palatte.sakuraPink })
  set(0, "HarpoonBorder", { fg = palatte.lotusYellow4 })

  set(0, "CmpItemAbbrMatch", { fg = palatte.waveRed })
  set(0, "CmpItemAbbr", { fg = palatte.fujiWhite })
  set(0, "CmpItemMenu", { fg = palatte.katanaGray })

  set(0, "TelescopeBorder", { bg = "none", fg = palatte.springGreen })
  set(0, "TelescopeMatching", { bg = "none", fg = palatte.springGreen })
  set(0, "TelescopeSelectionCaret", { bg = "none", fg = palatte.springGreen })
  set(0, "TelescopeTitle", { fg = "white" })
  set(0, "TelescopePromptCounter", { fg = "white" })
  set(0, "TelescopePromptBorder", { bg = "none", fg = palatte.springGreen })
  set(0, "TelescopePreviewBorder", { bg = "none", fg = palatte.oniViolet2 })

  set(0, "TreesitterContext", { bg = "none", bold = true, italic = true })
  set(0, "TreesitterContextLineNumber",
    { bg = "none", fg = palatte.sakuraPink, bold = true, underdotted = true })
  set(0, "TreesitterContextSeparator", { bg = "none", fg = palatte.dragonRed })

  set(0, "LineNr", { fg = palatte.lotusYellow4 })
  set(0, "CursorLineNr", { fg = palatte.springGreen, bold = true, italic = true })
  set(0, "CursorLine", { bg = "none" })
  set(0, "SignColumn", { bg = "none" })

  set(0, "DiagnosticSignError", { fg = palatte.samuraiRed, bg = "none" })
  set(0, "DiagnosticSignWarn", { fg = palatte.surimiOrange, bg = "none" })
  set(0, "DiagnosticSignHint", { fg = palatte.lotusCyan, bg = "none" })
  set(0, "DiagnosticSignInfo", { fg = palatte.springBlue, bg = "none" })

  set(0, "GitSignsAdd", { fg = palatte.springGreen, bg = "none" })
  set(0, "GitSignsChange", { fg = palatte.roninYellow, bg = "none" })
  set(0, "GitSignsDelete", { fg = palatte.samuraiRed, bg = "none" })
  set(0, "GitSignsUntracked", { fg = palatte.springBlue, bg = "none" })

  set(0, "Pmenu", { bg = "none" })
  set(0, "PmenuSel", { bg = palatte.fujiWhite, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "PmenuThumb", { bg = palatte.waveRed, fg = palatte.waveRed })
  set(0, "PmenuSbar", { bg = "none" })

  set(0, "LspInfoBorder", { bg = "none", fg = palatte.fujiWhite })
  ColorMyLines()
end

ColorMyPencils("kanagawa-wave")
