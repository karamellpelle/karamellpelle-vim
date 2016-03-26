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
"set nowrap
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


" imaps
"imap <Up> <Esc><Up>
"imap <Down> <Esc><Down>

" use mouse
set mouse=a

" Tagbar
"nmap <F8> :TagbarToggle<CR>
nmap <F8> :TagbarOpenAutoClose<CR>

" always show tab-bar
set showtabline=2

" my syntax
set nowrap
set tags=./tags;/

" space as <Leader>
let mapleader = "\<Space>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion :)
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" overwin does not work yet :(
map <Leader>f <Plug>(easymotion-bd-f)
"nmap <Leader>f <Plug>(easymotion-overwin-f)
map <Leader>L <Plug>(easymotion-bd-jk)
"nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>w <Plug>(easymotion-bd-w)
"map <Leader>w <Plug>(easymotion-overwin-w)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion


" tab completion
set wildmode=longest,longest,list

filetype plugin on

" set path to current directory and recursive content
set path=.,,**

" let Ctrl-N only search current buffer
set complete=.

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatusLineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

" tcomment
let g:tcommentOptions = {'whitespace': 'no' }


" Dokument
let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '' }

" CtrlP
"let g:ctrlp_default_input = 0
let g:ctrlp_open_new_file= 't'

