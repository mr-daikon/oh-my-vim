set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'python-mode/python-mode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'sjl/badwolf'
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'Yggdroot/indentLine'
Plugin 'davidhalter/jedi-vim'


call vundle#end()            " required

filetype plugin indent on    " required

set nocompatible
syntax enable
colorscheme space-vim-dark
"hi Comment guifg=#5C6370 ctermfg=59

set ruler
set nu
set encoding=utf-8
set ls=2
set visualbell t_vb= 
set novisualbell
" turn off backups and swaps 
set nobackup 	     " no backup files
set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile 	     " no swap files

" hide panels 
set guioptions-=m   " menu 
set guioptions-=T    " toolbar
set guioptions-=r   " scrolls

" настройка на Tab
set smarttab
set tabstop=4
set background=dark

" NerdTree settings  *************
map <F3> :NERDTreeToggle<CR> " Ignore files with extentions:
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
autocmd vimenter * NERDTree " Opend tree as vim start up

" Tagbar settings *****************
autocmd vimenter * TagbarToggle
let g:tagbar_autofocus = 0
map <F4> :TagbarToggle<CR>

" Airline settigs
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Indents


"=====================================================
" Python-mode settings
"=====================================================
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0

" документация
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'

" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"

" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 0

" возможность запускать код
let g:pymode_run = 0


