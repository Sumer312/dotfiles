local servers = {
	"lua_ls",
	"pyright",
	"sqlls",
	"bashls",
	"jsonls",
	"solidity_ls_nomicfoundation",
	"clangd",
	"gopls",
  "templ",
	"html",
}

local settings = {
	ui = {
		border = "single",
		width = 0.9,
		height = 0.9,
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = servers,
	automatic_installation = true,
})
