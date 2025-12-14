local M = {}

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
	return
end

local tmp = vim.lsp.protocol.make_client_capabilities()
tmp.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(tmp)

M.setup = function()
	local config = {
		--[[ virtual_text = true, ]]
    virtual_lines = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = "",
				[vim.diagnostic.severity.WARN] = "",
				[vim.diagnostic.severity.HINT] = "󰌵",
				[vim.diagnostic.severity.INFO] = "",
			},
			numhl = {
				[vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
				[vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
				[vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
				[vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
			},
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = true,
			style = "minimal",
			border = "single",
			source = "always",
			header = "",
			prefix = "",
		},
	}
	vim.diagnostic.config(config)
end

vim.lsp.config("*", {
  capabilities = M.capabilities
})

return M
