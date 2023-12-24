return {
  -- My plugins here
  -- Colorschemes
  "sainnhe/sonokai",
  "folke/tokyonight.nvim",
  "sainnhe/everforest",
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        compile = true,
        undercurl = true,
        transparent = true,
      })
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine"
  },

  --Essential
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim",
  "numToStr/Comment.nvim",
  "https://github.com/stevearc/oil.nvim",
  "ThePrimeagen/harpoon",
  "/folke/zen-mode.nvim",
  "https://github.com/kdheepak/lazygit.nvim",
  "akinsho/toggleterm.nvim",
  "ThePrimeagen/vim-be-good",
  "https://github.com/gelguy/wilder.nvim",
  "mbbill/undotree",
  "karb94/neoscroll.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  { "christoomey/vim-tmux-navigator", lazy = false },
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
          ["templ"] = {
            icon = "",
            name = "goTempl",
          },
          ["vim"] = {
            icon = "",
            name = "vim",
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
          [".vimrc"] = {
            icon = "",
            name = "vimrc",
          },
          ["makefile"] = {
            icon = "",
            name = "make",
          },
        },
      })
    end,
  },
  "ap/vim-css-color",
  "nvim-lualine/lualine.nvim",

  --Cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  --Snippet engine
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",


  -- Telescope
  { "nvim-telescope/telescope.nvim",  version = "0.1.0" },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Git
  "lewis6991/gitsigns.nvim",

  --Dashboard
  "mhinz/vim-startify",
}

-- Commented
--[[ "moll/vim-bbye", ]]
--[[ "https://github.com/tpope/vim-surround", ]]
--[[ "https://github.com/tpope/vim-dadbod", ]]
--[[ "https://github.com/kristijanhusak/vim-dadbod-ui", ]]
--[[ "https://github.com/tpope/vim-fugitive", ]]
--[[ "https://github.com/gen740/SmoothCursor.nvim", ]]
--[[ "windwp/nvim-autopairs", ]]
--[[ "nvim-telescope/telescope-media-files.nvim", ]]
