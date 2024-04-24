set number
set relativenumber
set incsearch
set cursorline
syntax on
nnoremap Q <nop>
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
imap <C-c> <esc>
highlight LineNr ctermfg=15
highlight CursorLineNr cterm=bold,italic ctermbg=NONE ctermfg=190
highlight CursorLine cterm=NONE
highlight ModeMsg cterm=bold ctermbg=NONE ctermfg=87
highlight MessageWindow cterm=bold ctermbg=NONE ctermfg=87
highlight IncSearch cterm=italic ctermbg=217 ctermfg=0
highlight VertSplit cterm=bold ctermbg=NONE ctermfg=190
highlight EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=15
highlight Visual cterm=italic ctermfg=0 ctermbg=190
highlight Folded cterm=bold,italic ctermbg=123 ctermfg=0
