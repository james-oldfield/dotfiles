set background=dark
set t_Co=256

colorscheme badwolf
hi SpellBad ctermfg=161
syntax on

set foldmethod=indent
set guifont=Inconsolta:h14

set nocompatible
set clipboard=unnamed
set wildmenu
set esckeys
set backspace=indent,eol,start
set ttyfast
set lazyredraw
set encoding=utf-8 nobomb
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
set exrc
set secure
set number
set cursorline

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

set omnifunc=csscomplete#CompleteCSS
set ft=scss.css

if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

let mapleader=","

vmap r "_dP
nmap ; :

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <space> za
tnoremap <Esc> <C-\><C-n>

if has("autocmd")
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufRead,BufNewFile *.md setlocal spell
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

  autocmd Filetype markdown setlocal wrap
  autocmd Filetype markdown setlocal linebreak
  autocmd Filetype markdown setlocal nolist
endif

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'vimwiki/vimwiki'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'w0rp/ale'

Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

Plug 'clojure-vim/nvim-parinfer.js', { 'for': 'clojure' }
Plug 'neovim/node-host', { 'for': 'clojure' }
Plug 'kien/rainbow_parentheses.vim', { 'for': 'clojure' }

Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern', 'for': 'js' }
Plug 'zchee/deoplete-clang', { 'for': 'cpp' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/3.9.1/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang'

let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]

let g:vim_markdown_folding_style_pythonic = 1

let g:badwolf_css_props_highlight = 1

let g:javascript_enable_domhtmlcss=1

let g:ale_sign_column_always = 1
let g:ale_linters = {
\   'SCSS': ['scss-lint'],
\   'css': ['scss-lint'],
\   'cpp': ['cppcheck'],
\   'python': ['flake8'],
\}

let g:multi_cursor_exit_from_insert_mode=0

let g:jsx_ext_required = 0
