return {
  -- Colorschemes
  "sainnhe/sonokai",
  "folke/tokyonight.nvim",
  "sainnhe/everforest",
  "rebelot/kanagawa.nvim",
  "rose-pine/neovim",

  --Essential
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",
  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",
  "mbbill/undotree",
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
  },
  "folke/trouble.nvim",

  --Optional
  "karb94/neoscroll.nvim",
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      {
        'kristijanhusak/vim-dadbod-completion',
        ft = { 'sql', 'mysql', 'plsql' },
        lazy = true
      },
    }
  },
  "nvim-tree/nvim-web-devicons",
  "folke/zen-mode.nvim",
  "ThePrimeagen/vim-be-good",
  "norcalli/nvim-colorizer.lua",
  "ap/vim-css-color",
  { "christoomey/vim-tmux-navigator", lazy = false },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
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


  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",
  "nvim-treesitter/nvim-treesitter-context",

  -- Git
  "lewis6991/gitsigns.nvim",

  --Dashboard
  "mhinz/vim-startify",
}
