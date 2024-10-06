local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end
local palatte = require("core.color_palatte")
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
    border = "single",
    width = 200,
    height = 36,
    zindex = 10,
    winblend = 0,
  },
  highlights = {
    FloatBorder = {
      guifg = palatte.carpYellow,
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(0, "t", "<ESC>", [[<C-\><C-n>]], opts)
  keymap(0, "t", "<C-k>", "<C-k>", opts)
  keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
local glow = Terminal:new({ cmd = "glow", hidden = true })
local gpt = Terminal:new({ cmd = "ollama run llama3.2", hidden = true })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

function _GLOW_TOGGLE()
  glow:toggle()
end

function _GPT_TOGGLE()
  gpt:toggle()
end
