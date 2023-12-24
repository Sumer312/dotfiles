local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

vim.filetype.add({
 extension = {
  templ = "templ",
 },
})

require("core.lsp.lsp-config")
require("core.lsp.mason")
require("core.lsp.handlers").setup()
