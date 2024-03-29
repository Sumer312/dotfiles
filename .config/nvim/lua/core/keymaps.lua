local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme theme=ivy<CR>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep theme=ivy<CR>", opts)

keymap("n", "<leader>dl", "<cmd>TroubleToggle<CR>", opts)

keymap("n", "<leader>son", "<cmd>lua ColorMyPencils('sonokai')<CR>", opts)
keymap("n", "<leader>kan", "<cmd>lua ColorMyPencils('kanagawa-wave')<CR>", opts)
keymap("n", "<leader>u", "<cmd>UndotreeToggle <bar> UndotreeFocus<CR>", opts)

keymap("n", "<leader>lzg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>db", "<cmd>DBUIToggle<CR>", opts)
keymap("n", "<A-Return>", "o<Esc>", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "-", "<cmd>Explore<CR>", opts)

keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

keymap("i", "<C-c>", "<esc>", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

keymap("n", "<A-k>", "<cmd>lua require('treesitter-context').go_to_context()<CR>", { silent = true })
