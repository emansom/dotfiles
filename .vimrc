" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Make sure you use single quotes
Plug 'fgsch/vim-varnish'
Plug 'ap/vim-buftabline'
Plug 'fatih/vim-go'

" Initialize plugin system
call plug#end()

syntax on
colorscheme monokai
set t_Co=256 " vim-monokai now only support 256 colours in terminal.
let g:monokai_term_italic = 1
set number
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>
