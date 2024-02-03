local palatte = require("core.theme_colors")
M = {}
local set = vim.api.nvim_set_hl
M.ColorMyLines = function()
  set(0, "Accent", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "NormalAccent", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "InsertAccent", { bg = palatte.springGreen, fg = palatte.dragonBlack0, bold = true })
  set(0, "INormalAccent", { bg = palatte.dragonGreen, fg = palatte.dragonBlack0, bold = true })
  set(0, "VisualAccent", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true })
  set(0, "CmdLineAccent", { bg = palatte.springBlue, fg = palatte.dragonBlack0, bold = true })
  set(0, "ReplaceAccent", { bg = palatte.autumnRed, fg = palatte.dragonBlack0, bold = true })
  set(0, "TerminalAccent", { bg = palatte.samuraiRed, fg = palatte.dragonBlack0, bold = true })

  set(0, "BlackBg", { bg = palatte.dragonBlack0, fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "NormalBlackBg", { bg = palatte.dragonBlack0, fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "InsertBlackBg", { bg = palatte.dragonBlack0, fg = palatte.springGreen, bold = true, italic = true })
  set(0, "INormalBlackBg", { bg = palatte.dragonBlack0, fg = palatte.dragonGreen, bold = true, italic = true })
  set(0, "VisualBlackBg", { bg = palatte.dragonBlack0, fg = palatte.oniViolet2, bold = true, italic = true })
  set(0, "CmdLineBlackBg", { bg = palatte.dragonBlack0, fg = palatte.springBlue, bold = true, italic = true })
  set(0, "ReplaceBlackBg", { bg = palatte.dragonBlack0, fg = palatte.autumnRed, bold = true, italic = true })
  set(0, "CmdBlackBg", { bg = palatte.dragonBlack0, fg = palatte.springBlue, bold = true, italic = true })
  set(0, "TerminalBlackBg", { bg = palatte.dragonBlack0, fg = palatte.samuraiRed, bold = true, italic = true })

  set(0, "Inverse", { bg = "none", fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "NormalInverse", { bg = "none", fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "InsertInverse", { bg = palatte.springGreen, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "INormalInverse", { bg = palatte.dragonGreen, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "VisualInverse", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "CmdLineInverse", { bg = palatte.springBlue, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "ReplaceInverse", { bg = palatte.autumnRed, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "TerminalInverse", { bg = palatte.samuraiRed, fg = palatte.dragonBlack0, bold = true, italic = true })
end
return M
