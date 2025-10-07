local opts = {
	on_attach = require("core.lsp.handlers").on_attach,
	capabilities = require("core.lsp.handlers").capabilities,
	lua_ls_opts = require("core.lsp.settings.lua-ls").settings,
	jsonls_opts = require("core.lsp.settings.jsonls"),
}

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

vim.lsp.config("lua_ls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	settings = opts.lua_ls_opts,
})

vim.lsp.config("bashls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("gopls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("ts_ls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("tailwindcss", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("solidity_ls_nomicfoundation", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("dockerls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("html", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	filetypes = { "html", "templ" },
})

vim.lsp.config("cssls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("pyright", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("clangd", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("sqlls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("yamlls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("vimls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
})

vim.lsp.config("jsonls", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	opts = opts.jsonls_opts,
})

vim.lsp.config("templ", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	filetypes = { "templ" },
})

vim.lsp.config("htmx", {
	on_attach = opts.on_attach,
	capabilities = opts.capabilities,
	filetypes = { "html", "templ" },
	cmd = { "htmx-lsp" },
})
