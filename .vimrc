
" .VIMRC configuration file for Golang programming
" Written by mr.daikon Mar, 2020


set nocompatible
filetype off
filetype plugin on
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
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'preservim/nerdcommenter'
Plugin 'morhetz/gruvbox' 
Plugin 'wikitopian/hardmode'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'fatih/vim-go'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'tpope/vim-surround'
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
set cursorline			" show a visual line under the cursor's current line

set guioptions-=m		" hide menu bar 
set guioptions-=T		" hide toolbar
set guioptions-=r		" hide scrolls

set nobackup			" no backup files
set nowritebackup		" only in case you don't want a backup file while editing
set noswapfile			" no swap files

"Russian support
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set spelllang=ru_yo, en_us


"--------------------------------------
" Identathion options
"--------------------------------------
set smarttab
set tabstop=4
set shiftwidth=4

"--------------------------------------
" Appereance settings 
"--------------------------------------
set termguicolors
set background=dark

colorscheme gruvbox		" use gruvbox color scheme, cuz I like it
let g:airline_theme='gruvbox'	"the same theme for airline 



"--------------------------------------
" Hardmode - hardcore mode is on!!
" Please don't cry!!! x_x
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
" NERD Commenter settings
"--------------------------------------
"let g:NERDSpaceDelims = 1 			" Add spaces after comment delimiters
"let g:NERDCommentEmptyLines = 1 	" Allow commenting empty lines
"let g:NERDTrimTrailingWhitespaces = 1 	"Enable trimming whitespaces when uncommenting
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }


"--------------------------------------
" Mapings
"--------------------------------------
let mapleader = ","
map Y y$
noremap <C-Q> :nohl<CR>
map <F3> :NERDTreeToggle<CR> 
map <F4> :TagbarToggle<CR>
noremap <C-h> <C-W>h
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
"map <silent> <C-h> :call WinMove('h')<CR>
"map <silent> <C-j> :call WinMove('j')<CR>
"map <silent> <C-k> :call WinMove('k')<CR>
"map <silent> <C-l> :call WinMove('l')<CR>


"--------------------------------------
" Custom fucntions section
"--------------------------------------

function! WinMove(key)
		let t:curwin = winnr()
		exec "wincmd ".a:key
		if (t:curwin == winnr())
			if (match(a:key, '[jk]'))
				wincmd v
			else
				wincmd s
			endif
			exec "wincmd ".a.key
		endif
endfunction


" Use tab for trigger completion with characters ahead and navigate.
" " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" " other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
       \ pumvisible() ? "\<C-n>" :
       \ <SID>check_back_space() ? "\<TAB>" :
       \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
