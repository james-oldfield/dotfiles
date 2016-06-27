set t_Co=256
set background=dark
colorscheme badwolf
" Set the highlight colours for spelling mistakes
hi SpellBad ctermfg=161
syntax enable;

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

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype off
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

" Split navigation mapping
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Map colon key to semi-colon
nmap ; :
" Open new splits in bottom right
set splitbelow
set splitright

set omnifunc=csscomplete#CompleteCSS " CSS completion
set ft=scss.css

" PLUGINS

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins go here
Plugin 'airblade/vim-gitgutter' " Git-diffing inline
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file searching
Plugin 'scrooloose/syntastic' " Syntax highlighter
Plugin 'mattn/emmet-vim' " Emmet!
Plugin 'Valloric/YouCompleteMe' " Intelligent completion
Plugin 'jiangmiao/auto-pairs' " bracket closing etc
Plugin 'ternjs/tern_for_vim' " JS code completion
Plugin 'rdnetto/YCM-Generator' " ycm settings generator
Plugin 'sophacles/vim-processing' " Processing plugin
Plugin 'pangloss/vim-javascript'  " Better JS definitions for syntax/indent
Plugin 'jelera/vim-javascript-syntax' " more syntax
Plugin 'mxw/vim-jsx' " JSX highlighting
Plugin 'tikhomirov/vim-glsl' " GLSL syntax highlighting definitions
Plugin 'junegunn/goyo.vim' " Full screen writing
Plugin 'cakebaker/scss-syntax.vim' " SCSS
Plugin 'terryma/vim-multiple-cursors' " multiple cursors
Plugin 'octol/vim-cpp-enhanced-highlight' " c++ 11/14 syntax defintions

call vundle#end()
filetype plugin indent on

" Plugin settings
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|bower_components\|addons\|libs' " Ignores dirs when fuzzy file searching
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = ''

" JS settings
let g:javascript_enable_domhtmlcss=1

" Syntastic
let g:syntastic_enable_signs=1 " Mark syntax errors with :signs
let g:syntastic_auto_jump=0 " Do not automatically jump to the error when saving the file
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d' " Use eslint_d for faster linting

let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_no_include_search = 0
let g:syntastic_cpp_compiler = 'gcc'
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler_options = '-std=c++14'
" let g:syntastic_cpp_include_dirs = ['/Users/james/DEV/openFrameworks/libs/FreeImage/include','/Users/james/DEV/openFrameworks/libs/boost/include','/Users/james/DEV/openFrameworks/libs/boost/include/boost','/Users/james/DEV/openFrameworks/libs/cairo/include','/Users/james/DEV/openFrameworks/libs/cairo/include/cairo','/Users/james/DEV/openFrameworks/libs/fmodex/include','/Users/james/DEV/openFrameworks/libs/freetype/include','/Users/james/DEV/openFrameworks/libs/freetype/include/freetype2','/Users/james/DEV/openFrameworks/libs/freetype/include/freetype2/config','/Users/james/DEV/openFrameworks/libs/freetype/include/freetype2/internal','/Users/james/DEV/openFrameworks/libs/freetype/include/freetype2/internal/services','/Users/james/DEV/openFrameworks/libs/glew/include','/Users/james/DEV/openFrameworks/libs/glew/include/GL','/Users/james/DEV/openFrameworks/libs/glfw/include','/Users/james/DEV/openFrameworks/libs/glfw/include/GLFW','/Users/james/DEV/openFrameworks/libs/glu/include','/Users/james/DEV/openFrameworks/libs/glut/include','/Users/james/DEV/openFrameworks/libs/kiss/include','/Users/james/DEV/openFrameworks/libs/openFrameworks','/Users/james/DEV/openFrameworks/libs/openFrameworks/3d','/Users/james/DEV/openFrameworks/libs/openFrameworks/app','/Users/james/DEV/openFrameworks/libs/openFrameworks/communication','/Users/james/DEV/openFrameworks/libs/openFrameworks/events','/Users/james/DEV/openFrameworks/libs/openFrameworks/gl','/Users/james/DEV/openFrameworks/libs/openFrameworks/graphics','/Users/james/DEV/openFrameworks/libs/openFrameworks/math','/Users/james/DEV/openFrameworks/libs/openFrameworks/sound','/Users/james/DEV/openFrameworks/libs/openFrameworks/types','/Users/james/DEV/openFrameworks/libs/openFrameworks/utils','/Users/james/DEV/openFrameworks/libs/openFrameworks/video','/Users/james/DEV/openFrameworks/libs/openssl/include','/Users/james/DEV/openFrameworks/libs/openssl/include/openssl','/Users/james/DEV/openFrameworks/libs/poco/include','/Users/james/DEV/openFrameworks/libs/rtAudio/include','/Users/james/DEV/openFrameworks/libs/tess2/include','/Users/james/DEV/openFrameworks/libs/utf8cpp/include','/Users/james/DEV/openFrameworks/libs/utf8cpp/include/utf8']

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['javascript'], 'passive_filetypes': ['cpp'] }

let g:jsx_ext_required = 0 " Allow JSX in normal JS file
set completeopt-=preview " Hide the preview box

" You complete me settings
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_confirm_extra_conf = 0 " Turn off extra confirmations for loding c++ configs
let g:ycm_path_to_python_interpreter = '/usr/bin/python' " Change the interpreter from Anaconda
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1

" Emmet settings
" Map ctrl + y + , to ,,
let g:user_emmet_leader_key=','
" Map ctrl return to normal tag expanding
imap <C-Return> <CR><CR><C-o>ki<tab>
imap <C-k> <CR><CR><Esc>ki<tab>
