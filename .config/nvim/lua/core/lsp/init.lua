--[[ vim.filetype.add({ ]]
--[[ 	extension = { ]]
--[[ 		templ = "templ", ]]
--[[ 	}, ]]
--[[ }) ]]

--[[ vim.api.nvim_create_autocmd("LspAttach", { ]]
--[[ 	callback = function(ev) ]]
--[[ 		local client = vim.lsp.get_client_by_id(ev.data.client_id) ]]
--[[ 		if client:supports_method("textDocument/completion") then ]]
--[[ 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true }) ]]
--[[ 		end ]]
--[[ 	end, ]]
--[[ }) ]]

require("core.lsp.lsp-config")
require("core.lsp.mason")
require("core.lsp.handlers").setup()
require("core.lsp.none_ls")
