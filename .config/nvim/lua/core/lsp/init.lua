local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
require('lspconfig.ui.windows').default_options.border = 'single'
require("core.lsp.lsp-config")
require("core.lsp.filetypes").setup()
require("core.lsp.mason")
require("core.lsp.handlers").setup()
