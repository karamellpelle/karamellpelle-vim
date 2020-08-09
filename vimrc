""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" karamellpelle-vim
"
" * https://vimawesome.com/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" lets be inspired by https://github.com/tpope/vim-sensible
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug

call plug#begin('~/.vim/plugged')
" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'kien/ctrlp.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'nelstrom/vim-visual-star-search'
Plug 'godlygeek/tabular'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Tabmerge'
Plug 'raimondi/delimitmate'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'kien/tabman.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'gastonsimone/vim-dokumentary'
Plug 'ludovicchabant/vim-gutentags'
Plug 'szw/vim-maximizer'
Plug 'terryma/vim-multiple-cursors'
Plug 'darfink/vim-plist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
call plug#end()


"let g:deoplete#enable_at_startup = 1
" instead, enable deoplete manually:
" call deoplete#enable()
cnoreabbr DeopleteEnable call deoplete#enable()
cnoreabbr DeopleteDisable call deoplete#disable()
" TODO: manual trigger of deoplete
" pathogen:
" TODO: remove and rely on vim-plug
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

" no highlight of searches
set nohlsearch

" prevent XXX in sessions
set sessionoptions-=options

" bottom ruler
set ruler
set laststatus=2
"set scrolloff=0   " minimum number of lines shown above cursor

" i'm lazy
:command WQ wq
:command Wq wq
:command W w
:command Q q

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

" let Ctrl-N only search current buffer and buffers in windows
set complete=.,w

" jump away from modified buffers silently
set hidden

" open splits at right or below
set splitright
set splitbelow

" modify macroregister with <Leader>m
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

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
map <Leader>e <Plug>(easymotion-e)
map <Leader>E <Plug>(easymotion-E)
map <Leader>ge <Plug>(easymotion-ge)
map <Leader>gE <Plug>(easymotion-gE)
" jump up and down
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)

nmap <Leader>W<Space>m   <Plug>VimwikiMakeTomorrowDiaryNote
nmap <Leader>W<Space>y   <Plug>VimwikiMakeYesterdayDiaryNote
nmap <Leader>W<Space>t   <Plug>VimwikiTabMakeDiaryNote
nmap <Leader>W<Space>w   <Plug>VimwikiMakeDiaryNote
nmap <Leader>W<Space>i   <Plug>VimwikiDiaryGenerateLinks
nmap <Leader>Wi     <Plug>VimwikiDiaryIndex
nmap <Leader>Ws     <Plug>VimwikiUISelect
" ^ TDDO: remove these
"nmap <Leader>Wt     <Plug>VimwikiTabIndex
nmap <Leader>WW     <Plug>VimwikiTabIndex
nmap <Leader>Ww     <Plug>VimwikiIndex
"nmap <Leader>Ww     <Plug>VimwikiIndex

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nnoremap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <leader>i :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabman
nmap <F4> :TMToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree 
nmap <F6> :UndotreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gutentags
let g:gutentags_cache_dir = '/tmp'
let g:gutentags_generate_on_empty_buffer = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tcomment
let g:tcomment#options = {'whitespace': 'no' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dokument
let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '' }
let g:dokumentary_open = 'rightbelow new' " open horizontally and below


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP

"let g:ctrlp_default_input = 0
" maximum height in items
let ctrlp_match_window = 'max:16'
let g:ctrlp_open_new_file= 't'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.a$\|\.o$\|\.dat$\|\.hi$\|\.dyn_hi$\|\.dyn_o$'
  \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabman
let g:tabman_number = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-maximizer
let g:maximizer_set_default_mapping = 0 
nnoremap <C-W>o     :MaximizerToggle<CR>
nnoremap <C-W><C-O> :MaximizerToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scratch
let g:scratch_persistence_file = "~/.vim/scratch.vim" " keep scratch file


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline_powerline_fonts = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabmerge
nnoremap tm :Tabmerge right<CR>
nnoremap tM <C-W>T


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  vim-bookmarks

" remove color of column
highlight SignColumn ctermbg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  vim-multiple-cursors

" Default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  nerdtree
" open nerdtree automatically if no files specified for vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" quit if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open if directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nmap <F9> :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delimitMate
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  hasktags : tag file for Haskell
let g:tagbar_type_haskell = {
    \ 'ctagsbin'  : 'hasktags',
    \ 'ctagsargs' : '-x -c -o-',
    \ 'kinds'     : [
        \  'm:modules:0:1',
        \  'd:data: 0:1',
        \  'd_gadt: data gadt:0:1',
        \  't:type names:0:1',
        \  'nt:new types:0:1',
        \  'c:classes:0:1',
        \  'cons:constructors:1:1',
        \  'c_gadt:constructor gadt:1:1',
        \  'c_a:constructor accessors:1:1',
        \  'ft:function types:1:1',
        \  'fi:function implementations:0:1',
        \  'o:others:0:1'
    \ ],
    \ 'sro'        : '.',
    \ 'kind2scope' : {
        \ 'm' : 'module',
        \ 'c' : 'class',
        \ 'd' : 'data',
        \ 't' : 'type'
    \ },
    \ 'scope2kind' : {
        \ 'module' : 'm',
        \ 'class'  : 'c',
        \ 'data'   : 'd',
        \ 'type'   : 't'
    \ }
\ }
