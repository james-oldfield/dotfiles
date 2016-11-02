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
autocmd Filetype markdown setlocal columns=80

" Open new splits in bottom right
set splitbelow
set splitright

set omnifunc=csscomplete#CompleteCSS " CSS completion
set ft=scss.css

" PLUGINS
call plug#begin('~/.vim/plugged')

Plug 'w0rp/ale'

Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'Valloric/YouCompleteMe', { 'on': [] }
Plug 'rdnetto/YCM-Generator', { 'for': 'cpp' }

Plug 'sheerun/vim-polyglot'
Plug 'James-Oldfield/badwolf'

augroup load_insert_plugs
  autocmd!
  autocmd InsertEnter * call plug#load('YouCompleteMe')
    \| autocmd! load_insert_plugs
augroup END

call plug#end()

" Plugin settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|addons\|libs' " Ignores dirs when fuzzy file searching
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

" JS settings
let g:javascript_enable_domhtmlcss=1

let g:ale_sign_column_always = 1

let g:ale_linters = {
\   'scss': ['scss-lint'],
\}

" Multiple cursors
let g:multi_cursor_exit_from_insert_mode=0

let g:jsx_ext_required = 0 " Allow JSX in normal JS file
set completeopt-=preview " Hide the preview box

" You complete me settings
let g:ycm_confirm_extra_conf = 0 " Turn off extra confirmations for loding c++ configs
let g:ycm_path_to_python_interpreter = '/usr/bin/python' " Change the interpreter from Anaconda
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1

let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SuperTabCrMapping = 0

let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
