" .VIMRC CONFIG FILE
" Written by mr.daikon in Feb, 2020
" So here we go...


set nocompatible
filetype off
filetype plugin indent on
syntax on


"-----------------------------------------------
" Plugin List
"-----------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'python-mode/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'
Plugin 'preservim/nerdcommenter'
Plugin 'morhetz/gruvbox' 
Plugin 'wikitopian/hardmode'

call vundle#end()


"--------------------------------------
" Main settings
" -------------------------------------
set encoding=utf-8		" always use utf-8 encoding
set hidden				" allows switch from an unsaved buffer without saving it first
set wildmenu 			" better command line completion
set showcmd				" shows partial commads in the last line of the screen
set hlsearch			" highlight searches
set incsearch			" search while typing
set ignorecase 			" case insesitive search...
set smartcase 			" ...except when using capital letters
set autoindent 			" when opening new line use the same indent as the line you're currently on
set nostartofline		" Stop certain movements from always going to the first character of a line
set ruler				" display cursor position in status line
set laststatus=2		" allways display status line
set visualbell			" use visual bell instead beeping when doing something wrong
set t_vb=				" and reset terminal code for the visual bell
set cmdheight=2
set number 				" display line number on the left
set rnu 				" display related row numbers
set sm 					" show matching braces

set guioptions-=m		" hide menu bar 
set guioptions-=T		" hide toolbar
set guioptions-=r		" hide scrolls

set nobackup			" no backup files
set nowritebackup		" only in case you don't want a backup file while editing
set noswapfile			" no swap files


"--------------------------------------
" Identathion options
"--------------------------------------
set smarttab
set tabstop=4


"--------------------------------------
" Appereance settings 
"--------------------------------------
set termguicolors
set background=dark

colorscheme gruvbox		" use gruvbox color scheme, it's very good looking
let g:airline_theme='gruvbox'	"the same theme for airline 


"--------------------------------------
" Mapings
"--------------------------------------
map Y y$
noremap <C-L> :nohl<CR><C-L>
map <F3> :NERDTreeToggle<CR> 
map <F4> :TagbarToggle<CR>


"--------------------------------------
" Hardmode - hardcore mode on!!
" Please don't cry baby!!! T_T
"--------------------------------------
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
let g:HardMode_level = 'wannabe'
let g:HardMode_hardmode_msg = 'Never give up, never surrender!'


"--------------------------------------
" NerdTree settings
"--------------------------------------
" Ignore files with extentions:
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


"--------------------------------------
" Tagbar settings
"--------------------------------------
autocmd vimenter * TagbarToggle
let g:tagbar_autofocus = 0


"--------------------------------------
" Airline settigs
"--------------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


"--------------------------------------
" Python-mode settings
"--------------------------------------
" Python-mode is a vim plugin that allows you to use the pylint, rope, and pydoc
" libraries in vim to provide features like python code bug checking,
" refactoring, and some other useful things.

let g:pymode = 1
let g:pymode_warnings = 0 			" Turn off plugin warnings
let g:pymode_trim_whitespaces = 1	" Trim unused whitespaces on save
let g:pymode_options = 1			" Turn on default python options
let g:pymode_python = 'python3'		" Use python ver.3 
let g_pymode_folding = 1			" Enable folding
let g:pymode_motion = 1				" Enable pymode motions

let g:pymode_rope = 0				" Turn off auto complete completly because of using jedi-vim	
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0

let g:pymode_doc = 1				" Turn on documentation
let g:pymode_doc_bind = 'K'			" Bind key for current word documentation show

let g:pymode_virtualenv = 1			" Turn on virtualenv detection

let g:pymode_lint = 1				" Enable pylint 
let g:pymode_lint_write = 1			" Enable checkings on file save
let g:pymode_lint_on_fly = 0		" Disable check code when editing (on the fly)
let g:pymode_lint_message = 1		" Show error message if cursor placed at the error line
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']	" Default code checkers
let g:pymode_lint_ignore = "[E501,W601,C0110]"
let g:pymode_lint_cwindow = 1		" Auto open cwindow (quickfix) if any errors have been found
let g:pymode_lint_signs = 1			" Place error |signs| (WW, CC, RR and so on)

let g:pymode_breakpoint = 1 		" Enable pymode breakpoints
let g:pymode_breakpoint_bind = '<leader>b' 	" Bind key for breakpoint set

let g:pymode_syntax = 1 			" Turn on pymode syntax
let g:pymode_syntax_all = 1			" Enable all python highligths
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

let g:pymode_run = 0 				" Disable program run


