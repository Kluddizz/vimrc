execute pathogen#infect()
syntax on
filetype plugin indent on

set number
set tabstop=2
set shiftwidth=2

" => colorscheme
"--------------------
colorscheme gruvbox
set background=dark

" => vim-airline
"--------------------
let g:airline_powerline_fonts = 1

" => vim-prettier
"--------------------
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" => ctrlp
"--------------------
let g:ctrlp_working_mode = 0
let g:ctrlp_map = '<C-f>'
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^.\coffee'
map <leader>j :CtrlP<cr>
map <C-b> :CtrlPBuffer<cr>

" => nerdtree
"--------------------
let g:NERDTreeWinPos = "right"
map <leader>nn :NERDTreeToggle<cr>
autocmd vimenter * NERDTree
