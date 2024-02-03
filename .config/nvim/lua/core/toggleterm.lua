local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end
local palatte = require("core.theme_colors")
toggleterm.setup({
  size = 40,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 100,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "double",
    width = 190,
    height = 35,
    zindex = 10,
    winblend = 0,
  },
  highlights = {
    FloatBorder = {
      guifg = palatte.springBlue,
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local node = Terminal:new({ cmd = "node", hidden = true })
local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
local htop = Terminal:new({ cmd = "htop", hidden = true })
local python = Terminal:new({ cmd = "python3", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _NODE_TOGGLE()
  node:toggle()
end

function _NCDU_TOGGLE()
  ncdu:toggle()
end

function _HTOP_TOGGLE()
  htop:toggle()
end

function _PYTHON_TOGGLE()
  python:toggle()
end
