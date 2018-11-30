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
"Plug 'morhetz/gruvbox'
Plug 'crusoexia/vim-monokai'

" Initialize plugin system
call plug#end()

syntax on
"set background=dark    " Setting dark mode
"let g:gruvbox_italic = 1
"let g:gruvbox_contrast_light = 'soft'
"let g:gruvbox_contrast_dark = 'soft'
"colorscheme gruvbox
set termguicolors
colorscheme monokai
"set t_Co=256 " vim-monokai now only support 256 colours in terminal.
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


" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
