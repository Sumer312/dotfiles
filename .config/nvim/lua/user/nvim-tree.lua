-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end
--[[ local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config") ]]
--[[ if not config_status_ok then ]]
--[[ 	return ]]
--[[ end ]]
vim.opt.termguicolors = true
--[[ local tree_cb = nvim_tree_config.nvim_tree_callback ]]

nvim_tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_tab = false,
	hijack_cursor = true,
	update_cwd = true,
	hijack_directories = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "󰛨",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
		custom = { "^.git$" },
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		centralize_selection = false,
		cursorline = true,
		debounce_delay = 15,
		width = 55,
		side = "right",
		preserve_window_proportions = true,
		number = true,
		relativenumber = true,
		signcolumn = "yes",
		mappings = {
			custom_only = false,
		},
	},
	actions = {
		use_system_clipboard = true,
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		highlight_git = true,
		root_folder_modifier = ":t",
		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "-",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			},
		},
	},
})
