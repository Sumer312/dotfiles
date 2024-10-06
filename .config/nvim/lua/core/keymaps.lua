local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "<A-Return>", "o<Esc>", opts)
keymap("n", "-", "<cmd>Explore<CR>", opts)

-- View
keymap("n", "<leader>mkv", "<cmd>mkview<CR>", opts)
keymap("n", "<leader>lv", "<cmd>loadview<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files theme=ivy<CR>", opts)
keymap("n", "<leader>fc", "<cmd>Telescope colorscheme theme=ivy<CR>", opts)
keymap("n", "<leader>lg", "<cmd>Telescope live_grep theme=ivy<CR>", opts)

-- Other plugins
keymap("n", "<leader>u", "<cmd>UndotreeToggle <bar> UndotreeFocus<CR>", opts)
keymap("n", "<leader>db", "<cmd>DBUIToggle<CR>", opts)
keymap("n", "<leader>md", "<cmd>MarkdownPreviewToggle<CR>", opts)
keymap("n", "<leader>ct", "<cmd>ColorizerToggle<CR>", opts)
keymap("n", "<leader>cr", "<cmd>ColorizerReloadAllBuffers<CR>", opts)

-- Lua commands
keymap("n", "<leader>son", '<cmd>lua ColorMyPencils("sonokai")<CR>', opts)
keymap("n", "<leader>lzg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)
keymap("n", "<leader>glo", "<cmd>lua _GLOW_TOGGLE()<CR>", opts)
keymap("n", "<leader>gpt", "<cmd>lua _GPT_TOGGLE()<CR>", opts)
keymap("n", "<A-k>", '<cmd>lua require("treesitter-context").go_to_context()<CR>', { silent = true })

keymap("i", "<C-c>", "<esc>", opts)

keymap("v", "<leader>p", [["_dP]], opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":move '>+1<CR>gv=gv", opts)
keymap("v", "K", ":move '<-2<CR>gv=gv", opts)
