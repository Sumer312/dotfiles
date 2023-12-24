local palatte = require("core.theme_colors")
M = {}
local set = vim.api.nvim_set_hl
M.ColorMyLines = function()
  set(0, "StatuslineAccent", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineNormalAccent", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineInsertAccent", { bg = palatte.springGreen, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineVisualAccent", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineCmdLineAccent", { bg = palatte.springBlue, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineReplaceAccent", { bg = palatte.autumnRed, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineTerminalAccent", { bg = palatte.samuraiRed, fg = palatte.dragonBlack0, bold = true })

  set(0, "StatuslineExtra", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineNormalExtra", { bg = palatte.autumnYellow, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineInsertExtra", { bg = palatte.springGreen, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineVisualExtra", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineCmdLineExtra", { bg = palatte.springBlue, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineReplaceExtra", { bg = palatte.autumnRed, fg = palatte.dragonBlack0, bold = true })
  set(0, "StatuslineTerminalExtra", { bg = palatte.samuraiRed, fg = palatte.dragonBlack0, bold = true })

  set(0, "StatuslineFile", { bg = "none", fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "StatuslineNormalFile", { bg = "none", fg = palatte.autumnYellow, bold = true, italic = true })
  set(0, "StatuslineInsertFile", { bg = palatte.springGreen, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "StatuslineVisualFile", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "StatuslineCmdLineFile", { bg = palatte.springBlue, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "StatuslineReplaceFile", { bg = palatte.autumnRed, fg = palatte.dragonBlack0, bold = true, italic = true })
  set(0, "StatuslineTerminalFile", { bg = palatte.samuraiRed, fg = palatte.dragonBlack0, bold = true, italic = true })
end
return M
