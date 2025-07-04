local options = {
	fileencoding = "utf-8",
	hlsearch = false,
	ignorecase = true,
	incsearch = true,
	mouse = "",
	pumheight = 10,
	showmode = false,
	smartcase = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	swapfile = false,
	termguicolors = true,
	softtabstop = 2,
	cursorline = true,
	number = true,
	relativenumber = true,
	numberwidth = 4,
	scrolloff = 8,
	sidescrolloff = 9,
	guifont = "JetBrainsMono Nerd Font:h8",
	backup = false,
	cmdheight = 1,
	signcolumn = "yes",
	wrap = false,
	guicursor = "",
	undofile = true,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" }, -- mostly just for cmp
	conceallevel = 0, -- so that `` is visible in markdown files
	timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
	updatetime = 50, -- faster completion (4000ms default)
	writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	expandtab = true, -- convert tabs to spaces
	shiftwidth = 2, -- the number of spaces inserted for each indentation
	tabstop = 2, -- insert 2 spaces for a tab
	linebreak = true, -- companion to wrap, don't split words
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_window_blurred = true
	vim.g.neovide_fullscreen = true
	vim.g.neovide_transparency = 0.8
end

vim.cmd([[set iskeyword+=-]])
vim.g.skip_ts_context_commentstring_module = true
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[
let g:startify_fortune_use_unicode = 1
let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
let g:startify_bookmarks = [{"B" : "/home/sumer/.bashrc"}, {"A": "/home/sumer/.zshrc"}, {"S" : "/home/sumer/.config/starship.toml"}, {"I": "/home/sumer/.config/nvim/init.lua"}, {"K": "/home/sumer/.config/alacritty/alacritty.toml"}, {"J": "/home/sumer/dwm/config.h"}]

let g:sonokai_style = 'shusia'
let g:sonokai_better_performance = 0
let g:sonokai_transparent_background = 2
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_virtual_text = 'highlighted'

let g:everforest_background = 'hard'
let g:everforest_better_performance = 0

let g:undotree_WindowLayout = 4
let g:undotree_SplitWidth = 40
]])

vim.cmd([[
  let g:python3_host_prog = '/usr/bin/python3'
  let g:loaded_python3_provider = 0
]])

vim.cmd([[
  augroup filetypedetect
    autocmd!
    autocmd BufRead,BufNewFile *.txt setfiletype markdown
  augroup END
]])

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlighting when yanking text",
	callback = function()
		vim.highlight.on_yank({ higroup = "Substitute", timeout = 60 })
	end,
})
