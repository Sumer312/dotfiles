local palatte = require("core.color_palatte")
local ColorMyLines = require("core.custom.statusline.theme").ColorMyLines

function ColorMyPencils(color)
	color = color or "kanagawa-wave"
	vim.cmd.colorscheme(color)
	local set = vim.api.nvim_set_hl

	set(0, "Normal", { bg = "none" })
	set(0, "StatusLine", { bg = palatte.waveAqua1, fg = palatte.dragonBlack0, bold = true, italic = true })
	set(0, "MsgArea", { bg = "none", fg = palatte.carpYellow, italic = true })
	set(0, "Visual", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, italic = true, bold = true })
	set(0, "FloatBorder", { fg = palatte.carpYellow })
	set(0, "Folded", { bg = palatte.lotusYellow4, fg = palatte.dragonBlack0, bold = true, italic = true })
	set(0, "IncSearch", { bg = palatte.lightBlue, fg = palatte.dragonBlack0, italic = true })
	set(0, "Substitute", { bg = palatte.sakuraPink, fg = palatte.dragonBlack0, italic = true })
	set(0, "CurSearch", { bg = palatte.lightBlue, fg = palatte.dragonBlack0, italic = true })
	set(0, "FloatTitle", { bg = "none", fg = palatte.dragonGreen, bold = true, italic = true })
	set(0, "NormalFloat", { bg = "none" })
	set(0, "Comment", { fg = palatte.katanaGray, italic = true })
	set(0, "TabLine", { bg = "none", fg = palatte.autumnYellow, bold = true })
	set(0, "TabLineFill", { bg = "none", bold = true })
	set(0, "TabLineSel", { bg = palatte.oniViolet2, fg = palatte.dragonBlack0, bold = true, italic = true })
	set(0, "WinBar", { bg = "none" })
	set(0, "EndOfBuffer", { fg = palatte.fujiWhite })
	set(0, "WinSeparator", { fg = palatte.carpYellow })
	set(0, "LineNr", { bg = "none", fg = palatte.fujiWhite })
	set(0, "CursorLineNr", { bg = "none", fg = palatte.carpYellow, bold = true, italic = true })
	set(0, "CursorLine", { bg = "none" })
	set(0, "SignColumn", { bg = "none" })
	set(0, "Pmenu", { bg = "none" })
	set(0, "PmenuSel", { bg = palatte.carpYellow, fg = palatte.dragonBlack0, bold = true, italic = true })
	set(0, "PmenuThumb", { bg = palatte.lotusCyan })
	set(0, "MatchParen", { fg = palatte.surimiOrange, bold = true, underline = true, italic = true })

	set(0, "DiagnosticWarn", { fg = palatte.roninYellow })
	set(0, "DiagnosticHint", { fg = palatte.lightBlue })
	set(0, "DiagnosticInfo", { fg = palatte.springBlue })
	set(0, "DiagnosticError", { fg = palatte.lotusRed3 })

	set(0, "DiagnosticSignError", { fg = palatte.lotusRed3, bg = "none", bold = true, italic = true })
	set(0, "DiagnosticSignWarn", { fg = palatte.roninYellow, bg = "none", bold = true, italic = true })
	set(0, "DiagnosticSignHint", { fg = palatte.lightBlue, bg = "none", bold = true, italic = true })
	set(0, "DiagnosticSignInfo", { fg = palatte.springBlue, bg = "none", bold = true, italic = true })

	set(0, "DiagnosticFloatingError", { fg = palatte.lotusRed3, bg = "none", italic = true })
	set(0, "DiagnosticFloatingWarn", { fg = palatte.roninYellow, bg = "none", italic = true })
	set(0, "DiagnosticFloatingHint", { fg = palatte.lightBlue, bg = "none", italic = true })
	set(0, "DiagnosticFloatingInfo", { fg = palatte.springBlue, bg = "none", italic = true })

	set(0, "DiagnosticVirtualTextError", { fg = palatte.lotusRed3, bg = "none", italic = true })
	set(0, "DiagnosticVirtualTextWarn", { fg = palatte.roninYellow, bg = "none", italic = true })
	set(0, "DiagnosticVirtualTextHint", { fg = palatte.lightBlue, bg = "none", italic = true })
	set(0, "DiagnosticVirtualTextInfo", { fg = palatte.springBlue, bg = "none", italic = true })

	set(0, "CmpItemAbbrMatch", { fg = palatte.lotusCyan, underdotted = true })
	set(0, "CmpItemAbbr", { fg = palatte.carpYellow })
	set(0, "CmpItemMenu", { fg = palatte.katanaGray })

	set(0, "TelescopeBorder", { bg = "none", fg = palatte.springGreen })
	set(0, "TelescopeMatching", { bg = "none", fg = palatte.lightBlue, italic = true, bold = true })
	set(0, "TelescopeSelectionCaret", { bg = "none", fg = palatte.sakuraPink, bold = true })
	set(0, "TelescopeTitle", { fg = palatte.fujiWhite })
	set(0, "TelescopePromptCounter", { fg = palatte.fujiWhite })
	set(0, "TelescopePromptBorder", { bg = "none", fg = palatte.carpYellow })
	set(0, "TelescopePreviewBorder", { bg = "none", fg = palatte.oniViolet })

	set(0, "TreesitterContext", { bg = "none", bold = true, italic = true, underdashed = true })
	set(
		0,
		"TreesitterContextLineNumber",
		{ bg = "none", fg = palatte.sakuraPink, bold = true, italic = true, underdashed = true }
	)

	set(0, "GitSignsAdd", { fg = palatte.springGreen, bg = "none" })
	set(0, "GitSignsChange", { fg = palatte.roninYellow, bg = "none" })
	set(0, "GitSignsDelete", { fg = palatte.lotusRed3, bg = "none" })
	set(0, "GitSignsUntracked", { fg = palatte.springBlue, bg = "none" })

	set(0, "NotificationInfo", { bg = palatte.springBlue, fg = palatte.dragonBlack0 })
	set(0, "NotificationWarning", { bg = palatte.roninYellow, fg = palatte.dragonBlack0 })
	set(0, "NotificationError", { bg = palatte.lotusRed3, fg = palatte.dragonBlack0 })

	set(0, "LspInfoBorder", { bg = "none", fg = palatte.carpYellow })

	set(0, "LazyProgressDone", { bg = "none", fg = palatte.lotusCyan })
	set(0, "LazyProgressTodo", { bg = "none", fg = palatte.carpYellow })
	ColorMyLines()
end

ColorMyPencils("kanagawa")
