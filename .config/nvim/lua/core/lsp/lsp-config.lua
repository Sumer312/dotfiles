vim.lsp.config.lua_ls = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
}

vim.lsp.config.bashls = {
	cmd = { "bashls" },
	root_markers = { ".git" },
	filetypes = { "sh" },
}

vim.lsp.config.gopls = {
	cmd = { "gopls" },
	root_markers = { ".git" },
	filetypes = { "go", "templ" },
}

vim.lsp.config.ts_ls = {
	cmd = { "typescript-language-server" },
	root_markers = { ".git" },
	filetypes = { "ts", "tsx" },
}

vim.lsp.config.tailwindcss = {
	cmd = { "tailwindcss-language-server" },
	root_markers = { ".git" },
	filetypes = { "templ" },
}

vim.lsp.config.dockerls = {
	cmd = { "dockerfile-language-server" },
	root_markers = { ".git" },
	filetypes = { "Dockerfile" },
}

vim.lsp.config.html = {
	cmd = { "vscode-html-language-server" },
	root_markers = { ".git" },
	filetypes = { "html", "templ" },
}

vim.lsp.config.clangd = {
	cmd = { "clangd" },
	root_markers = { ".git" },
	filetypes = { "c", "cpp" },
}

vim.lsp.config.sqlls = {
	cmd = { "sql-language-server" },
	root_markers = { ".git" },
	filetypes = { "sql" },
}

vim.lsp.config.templ = {
	cmd = { "templ" },
	root_markers = { ".git" },
	filetypes = { "templ" },
}

vim.lsp.config.htmx = {
	cmd = { "htmx-lsp" },
	root_markers = { ".git" },
	filetypes = { "html", "templ" },
}

vim.lsp.enable({ "lua_ls", "gopls", "clangd", "htmx", "dockerls", "bashls", "ts_ls", "html", "sqlls", "templ" })
