return {
	-- Colorschemes
	"sainnhe/sonokai",
	"sainnhe/everforest",
	"rose-pine/neovim",
	"rebelot/kanagawa.nvim",
	"folke/tokyonight.nvim",

	--Essential
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim",
	"numToStr/Comment.nvim",
	"akinsho/toggleterm.nvim",
	"mbbill/undotree",
	"norcalli/nvim-colorizer.lua",
	"nvim-tree/nvim-web-devicons",
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{
				"kristijanhusak/vim-dadbod-completion",
				ft = { "sql", "mysql", "plsql" },
				lazy = true,
			},
		},
	},

	--Cmp plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"saadparwaiz1/cmp_luasnip",

	--Snippet engine
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Formating
	"nvimtools/none-ls.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Treesitter
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/nvim-treesitter-context",
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	-- Git
  "lewis6991/gitsigns.nvim",

	--Optional
	"folke/zen-mode.nvim",
	"mhinz/vim-startify",
	"ThePrimeagen/vim-be-good",
}
