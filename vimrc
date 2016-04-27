" lets be inspired by https://github.com/tpope/vim-sensible
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
set nrformats-=octal

" syntax
filetype plugin on
syntax on

" prevent XXX in sessions
set sessionoptions-=options

" bottom ruler
set ruler
set laststatus=2
"set scrolloff=0   " minimum number of lines shown above cursor

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

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif 

" detect if file has been changed outside vim, read it
"set autoread 

" space as <Leader>
let mapleader = "\<Space>"

set wildmode=longest,longest,list


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
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
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
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nnoremap <silent> <F8> :TagbarToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabman
nmap <F4> :TMToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
nmap <F5> :GundoToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tcomment
let g:tcommentOptions = {'whitespace': 'no' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dokument
let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '' }
let g:dokumentary_open = 'rightbelow new' " open horizontally and below


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP

"let g:ctrlp_default_input = 0
let g:ctrlp_open_new_file= 't'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabman
let g:tabman_number = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-maximizer
let g:maximizer_set_default_mapping = 0 
nnoremap <C-W>o     :MaximizerToggle<CR>
nnoremap <C-W><C-O> :MaximizerToggle<CR>
