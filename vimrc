set nocompatible

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
set nowrap
"set textwidth=111

" syntax
filetype plugin on
syntax on

" prevent XXX in sessions
set sessionoptions-=options

" bottom ruler
set ruler

" haskell vim
"au Bufenter *.hs compiler ghc
"let g:haddock_browser = "firefox"

" select pasted text
noremap gV `[v`]

" Y yank to end of line, like D does
nnoremap Y y$

" prevent Ex mode
" TODO: find something useful for Q
nnoremap Q <Nop>


" begin and end of line (non-space)
noremap H ^
noremap L g_

" use mouse
set mouse=a

" always show tab-bar
set showtabline=2

" my syntax
set tags=./tags;/

" space as <Leader>
let mapleader = "\<Space>"

set wildmode=longest,longest,list

filetype plugin on

" set path to current directory and recursive content
set path=.,,**

" let Ctrl-N only search current buffer
set complete=.


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion :)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
" searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" moving up and down colums
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
" jump to any character
nmap s <Plug>(easymotion-overwin-f)
" jump to character on line 
map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
" jump to any word
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>w <Plug>(easymotion-overwin-w)
" jump up and down
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
nmap <F8> :TagbarOpenAutoClose<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tcomment
let g:tcommentOptions = {'whitespace': 'no' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dokument
let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP

"let g:ctrlp_default_input = 0
let g:ctrlp_open_new_file= 't'

