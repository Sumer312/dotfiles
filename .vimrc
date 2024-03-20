set number
set rnu
set incsearch
highlight LineNr ctermfg=LightGreen

call plug#begin()
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts=1
