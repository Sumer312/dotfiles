vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").setup({
		window = {
			width = 240,
			options = {
				signcolumn = "yes",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
			plugins = {
				tmux = { enabled = false },
			},
		},
	})
	require("zen-mode").toggle()
end)
