set background=dark
set t_Co=256

colorscheme badwolf
hi SpellBad ctermfg=161

set omnifunc=syntaxcomplete#Complete

set foldmethod=indent
set nofoldenable


set nocompatible
set clipboard=unnamedplus
set wildmenu
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set encoding=utf8
set binary
set noeol

set backupdir=~/.vim/backups
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim/swaps

if exists("&undodir")
	set undodir=~/.vim/undo
endif

set modeline
set modelines=4
set linebreak
set exrc
set secure
set number
set cursorline
set relativenumber

set tabstop=2
set shiftwidth=2
set expandtab

set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set hlsearch
set ignorecase
set incsearch
set laststatus=2

set noerrorbells
set nostartofline
set ruler
set shortmess=atI
set showmode
set title
set showcmd
set scrolloff=3
set completeopt-=preview

set splitbelow
set splitright

"let mapleader="\"
let maplocalleader="\\"

let g:tex_flavor="latex"

vmap r "_dP
nmap ; :

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za
nnoremap <C-space> zA

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'airblade/vim-gitgutter'
Plug 'vimwiki/vimwiki', { 'for': ['markdown'] }
Plug 'w0rp/ale'

Plug 'junegunn/goyo.vim', { 'for': ['markdown', 'tex'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'lervag/vimtex'
Plug 'sheerun/vim-polyglot'
"
Plug 'neoclide/coc.nvim', {'branch': 'release'}


call plug#end()


" System-dependent interp. paths
let g:python_host_prog = '/home/james/miniconda3/envs/py27/bin/python'
let g:python3_host_prog = '/home/james/miniconda3/bin/python'

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

let g:mkdp_auto_start = 1

let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'SCSS': ['scss-lint'],
\   'javascript': ['standard'],
\   'css': ['scss-lint'],
\   'cpp': ['cppcheck'],
\   'python': ['flake8'],
\   'tex': ['lacheck'],
\}
let g:ale_fixers = {'javascript': ['standard']}

let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_enabled = 0

if has("autocmd")
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufRead,BufNewFile *.md,*.tex setlocal spell

  autocmd Filetype markdown setlocal wrap
  autocmd Filetype markdown setlocal linebreak
  autocmd Filetype markdown setlocal nolist
endif

if empty(v:servername) && exists('*remote_startserver')
  call remote_startserver('VIM')
endif