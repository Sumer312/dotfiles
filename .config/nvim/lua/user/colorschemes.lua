function ColorMyPencils(color)
	color = color or "rose-pine-main"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "black" })
	vim.api.nvim_set_hl(0, "TelescopeBorder", { bg = "none", fg = "#98BB6C" })
	vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = "white" })
	vim.api.nvim_set_hl(0, "TelescopePromptCounter", { fg = "white" })
	vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none", fg = "#98BB6C" })
	vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none", fg = "#b8b4d0" })
	vim.api.nvim_set_hl(0, "Comment", { fg = "#727169", italic = true })
	vim.api.nvim_set_hl(0, "function", { fg = "#6A9589", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "#DCA561" })
	vim.api.nvim_set_hl(0, "Visual", { bg = "#49443C" })
	vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0d0c0c" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })

	vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "red", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "orange", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "teal", bg = "none" })
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "cyan", bg = "none" })

	vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "green", bg = "none" })
	vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "orange", bg = "none" })
	vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "red", bg = "none" })

	vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#98BB6C", bold = true })
	vim.api.nvim_set_hl(0, "Pmenu", { bg = "#000820" })
	vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#201800", fg = "#ffdc91", bold = true })
	vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#ffdc91" })
	vim.api.nvim_set_hl(0, "Error", { fg = "red", undercurl = true })
end

ColorMyPencils("kanagawa-wave")
