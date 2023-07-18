require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls" },
})

local opts = {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	lua_ls_opts = require("user.lsp.settings.lua-ls").settings,
}

require("lspconfig").lua_ls.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	settings = opts.lua_ls_opts,
})

require("lspconfig").gopls.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").tsserver.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").tailwindcss.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").solc.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").dockerls.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").html.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").cssls.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").pyright.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

require("lspconfig").clangd.setup({
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})
