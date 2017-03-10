set t_Co=256

" COLOURS
set background=dark
let g:badwolf_css_props_highlight = 1
colorscheme badwolf

" Set the highlight colours for spelling mistakes
hi SpellBad ctermfg=161
syntax enable;

" Set folds to auto, but auto-open
set foldmethod=indent
set nofoldenable

set guifont=Inconsolta:h14

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
set lazyredraw
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Swap setting" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Use r to replace selection with buffer
vmap r "_dP

" Map ctrl return to normal tag expanding
imap <C-Return> <CR><CR><C-o>ki<tab>
imap <C-k> <CR><CR><Esc>ki<tab>

" Map colon key to semi-colon
nmap ; :

" Split navigation mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map space to fold toggle
nnoremap <space> za

tnoremap <Esc> <C-\><C-n>

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
set shiftwidth=2
set expandtab
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Automatic commands
if has("autocmd")
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  autocmd BufRead,BufNewFile *.md setlocal spell " Turn on spellcheck for markdownfiles
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro' " Display line numbers in netrw

" Markdown settings
autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist

" Open new splits in bottom right
set splitbelow
set splitright

set omnifunc=csscomplete#CompleteCSS " CSS completion
set ft=scss.css

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

" Plugin settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|addons\|libs' " Ignores dirs when fuzzy file searching
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

" JS settings
let g:javascript_enable_domhtmlcss=1

let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'SCSS': ['scss-lint'],
\   'css': ['scss-lint'],
\   'cpp': ['cppcheck'],
\   'python': ['flake8'],
\}

" Multiple cursors
let g:multi_cursor_exit_from_insert_mode=0

let g:jsx_ext_required = 0 " Allow JSX in normal JS file
set completeopt-=preview " Hide the preview box
