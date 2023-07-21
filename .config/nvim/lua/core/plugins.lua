return {
	-- My plugins here
	-- colorschemes
	"https://gitlab.com/__tpb/monokai-pro.nvim",
	"sainnhe/sonokai",
	"folke/tokyonight.nvim",
	"sainnhe/everforest",
	{
		"rebelot/kanagawa.nvim",
		config = function()
			require("kanagawa").setup({
				compile = true, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = true,
			})
		end,
	},
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
	"nyoom-engineering/oxocarbon.nvim",
	{
		"nyngwang/nvimgelion",
		config = function()
			-- do whatever you want for further customization~
		end,
	},
	"Yazeed1s/oh-lucy.nvim",

	--essential
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim",
	"windwp/nvim-autopairs",
	"numToStr/Comment.nvim",
	"kyazdani42/nvim-tree.lua",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/tpope/vim-fugitive",
	"https://github.com/tpope/vim-surround",
	"https://github.com/tpope/vim-dadbod",
	"ThePrimeagen/harpoon",
	"ThePrimeagen/vim-be-good",
	"mbbill/undotree",
	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({
				color_icons = true,
				override_by_extension = {
					["sol"] = {
						icon = "󰡪",
						name = "ethereum",
					},
					["yml"] = {
						icon = "",
						name = "yaml",
					},
					["yaml"] = {
						icon = "",
						name = "yaml",
					},
					["exe"] = {
						icon = "",
						name = "exe",
					},
					["mod"] = {
						icon = "󰕳",
						name = "mod",
					},
					["d.ts"] = {
						icon = "󰛦",
						name = "definitionTypesctipt",
					},
				},
				override_by_filename = {
					["tailwind.config.js"] = {
						icon = "󱏿",
						name = "tailwind",
					},
					["yarn.lock"] = {
						icon = "",
						name = "yarnLocke",
					},
				},
			})
		end,
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	"moll/vim-bbye",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"akinsho/toggleterm.nvim",
	"ap/vim-css-color",

	--cmp plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",

	--snippet engine
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

	--Debugging
	"mfussenegger/nvim-dap",
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		ft = "go",
		config = function(_, opts)
			require("dap-go").setup(opts)
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
		ft = "python",
		config = function()
			local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3"
			require("dap-python").setup(path)
		end,
	},

	-- Telescope
	{ "nvim-telescope/telescope.nvim", version = "0.1.0" },
	{
		"nvim-telescope/telescope-media-files.nvim",
		dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},
	"JoosepAlviste/nvim-ts-context-commentstring",

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"https://gitlab.com/HiPhish/rainbow-delimiters.nvim",

	-- Image
	"https://github.com/edluffy/hologram.nvim",

	-- Git
	"lewis6991/gitsigns.nvim",

	--Dashboard
	"mhinz/vim-startify",
}
