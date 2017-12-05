" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Make sure you use single quotes
Plug 'fgsch/vim-varnish'
Plug 'ap/vim-buftabline'
Plug 'fatih/vim-go'
Plug 'Chiel92/vim-autoformat'
Plug 'chr4/nginx.vim'
Plug 'chr4/sslsecure.vim'
Plug 'ciaranm/securemodelines'
Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()

syntax on
colorscheme monokai
set t_Co=256 " vim-monokai now only support 256 colours in terminal.
let g:monokai_term_italic = 1
set number
set hidden
set nomodeline
set timeout timeoutlen=1500
filetype plugin on
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>
noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

let g:mapleader = ","

" disable vim-go auto-gofmt, because we use vim-autoformat
let g:go_fmt_autosave = 0

" Disable the fallback to vim's indent file
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" Default definition used tabs, I want my JavaScript to look the same for all
" my colleagues, so, we have to override it
let g:formatdef_jsbeautify_javascript = '"js-beautify"'


" trigger vim-autoformat on save
autocmd BufWrite * :Autoformat
autocmd BufEnter * :syntax sync fromstart
