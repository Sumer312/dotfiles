local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

--Commands in normal mode
keymap("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<CR>", opts)
keymap("n", "<leader>fm", "<cmd>Telescope media_files theme=ivy<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme theme=ivy<CR>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep theme=ivy<CR>", opts)
keymap("n", "<leader>lzg", "<cmd>LazyGit<CR>", opts)
keymap("n", "<leader>lit", "<cmd>lua ColorMyPencils('rose-pine-dawn')<CR>", opts)
keymap("n", "<leader>dak", "<cmd>lua ColorMyPencils('kanagawa-wave')<CR>", opts)
keymap("n", "<A-Return>", "o<Esc>", opts)
keymap("n", "<leader>e", "<cmd>:Oil<CR>", opts)
keymap("n", "<leader>u", "<cmd>UndotreeToggle <bar> UndotreeFocus<CR>", opts)
keymap("n", "J", "mzJ`z", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "-", "i<Space><Esc>w", opts)
--[[ keymap("n", "<C-d>", "<C-d>zz", opts) ]]
--[[ keymap("n", "<C-u>", "<C-u>zz", opts) ]]
--[[ keymap("n", "<leader>e", "<cmd>lua require('oil').toggle_float('./')<CR>", opts) ]]

-- Resize with arrows
keymap("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
keymap("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Context --
keymap("n", "<A-k>", ":lua require('treesitter-context').go_to_context()<CR>", { silent = true })


--Debugging
--[[ keymap("n", "<leader>db", "<cmd>DapToggleBreakpoint <CR>", opts) ]]
--[[ keymap("n", "<leader>dpy", "<cmd>lua require('dap-python').test_method()<CR>", opts) ]]
--
--[[ keymap("n", "<leader>y", '"+y', opts) ]]
--[[ keymap("n", "<leader>Y", '"+Y', opts) ]]
--[[ keymap("v", "<leader>y", '"+y', opts) ]]
