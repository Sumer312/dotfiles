vim.keymap.set("n", "<leader>zz", function()
	require("zen-mode").setup({
		window = {
			width = 240,
			height = 1,
			options = {
				signcolumn = "no",
				number = false,
				relativenumber = false,
				cursorline = false,
				cursorcolumn = false,
				foldcolumn = "0",
				list = false,
			},
			plugins = {
				options = {
					enabled = true,
          ruler = false,
          showcmd = false,
					laststatus = 0,
				},
				tmux = { enabled = false },
			},
		},
	})
	require("zen-mode").toggle()
end)
