local status_ok, none_ls = pcall(require, "null-ls")
if not status_ok then
	print("error loading none ls")
	return
end

none_ls.setup({
	debug = true,
	sources = {
		none_ls.builtins.formatting.stylua,
		none_ls.builtins.formatting.gofmt,
		none_ls.builtins.formatting.prettier.with({
			filetypes = { "json", "jsonc", "javascript", "typescript", "html", "css", "yaml", "markdown" },
		}),
		none_ls.builtins.formatting.cbfmt,
		none_ls.builtins.formatting.shfmt,
		none_ls.builtins.formatting.sqlfmt,
	},
})

vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
vim.lsp.buf.format({ timeout_ms = 2000 })
