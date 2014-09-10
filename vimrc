" pathogen:
execute pathogen#infect()

" '\t' to spaces:
set expandtab
" number of columns showing '\t':
set ts=8
" number of columns for reident-commands(<<,>>)
set sw=2
set sts=2

set backspace=indent,eol,start
set mouse=a
set autoindent
"set nowrap
"set textwidth=111

" syntax
filetype plugin on
syntax on

" haskell vim
"au Bufenter *.hs compiler ghc
"let g:haddock_browser = "firefox"


" imaps
"imap <Up> <Esc><Up>
"imap <Down> <Esc><Down>

" use mouse
set mouse=a

" Tagbar
nmap <F8> :TagbarToggle<CR>

" always show tab-bar
set showtabline=2

" my syntax
set nowrap
set tags=./tags;/


" tab completion
set wildmode=longest,longest,list

" omni
set nocompatible
filetype plugin on

" set path to current directory and recursive content
set path+=./**

