""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" karamellpelle-vim
"
" * https://vimawesome.com/
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
Plug 'vim-scripts/matchit.zip'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/goyo.vim'
Plug 'jremmen/vim-ripgrep'
"Plug 'mbbill/undotree'
Plug  'mtth/scratch.vim'
Plug  'junegunn/vim-peekaboo'
Plug 'wellle/targets.vim'
"Plug 'junegunn/limelight.vim' " FIXME: configure this for Goyo
"Plug 'eagletmt/neco-ghc' " for deoplete. maybe use coc and hie instead: https://github.com/haskell/haskell-ide-engine#using-hie-with-vim-or-neovim
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" settings

" space is <Leader>
let mapleader = "\<Space>"

" tab to spaces
set expandtab
" number of columns to show a '\t':
set ts=8
" number of columns for indent keys < and >
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

" lasy write and quit
:command WQ wq
:command Wq wq
:command W w
:command Q q

" select the pasted text
noremap gV `[v`]

" jump to beginning and end of line (excluding spaces)
noremap H ^
noremap L g_

" Y yank to end of line, like D does
nnoremap Y y$

" prevent Ex mode
" TODO: find something useful for Q
nnoremap Q <Nop>

" use mouse
set mouse=a

" always show tab-bar
set showtabline=2

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif 

" detect if file has been changed outside vim, read it
"set autoread 

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
" easymotion

" disable default mappings
let g:EasyMotion_do_mapping = 0 

" searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"map  n <Plug>(easymotion-next)
"map  N <Plug>(easymotion-prev)
"
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki

" mappings. vimwiki will not overwrite mappings from other plugins 
nmap <Leader>WW     <Plug>VimwikiTabIndex
nmap <Leader>WS     <Plug>VimwikiUISelect

" define our Vim-wikis

" default wiki
let wiki_0 = {}
"let wiki_0.path = '~/my_docs/'
let wiki_0.syntax = 'markdown'
let wiki_0.ext = '.md'
let wiki_0.nested_syntaxes = { 'c++': 'cpp', 'haskell': 'haskell'} 

let g:vimwiki_list = [wiki_0]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nnoremap <silent> <F8> :TagbarToggle<CR>
nmap <silent> <leader>i :TagbarToggle<CR>

" open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabman

" F4: show/hide tab manager
nmap <F4> :TMToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undotree (not used at the moment)

" F6: show/hide undotree
nmap <F6> :UndotreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gutentags

let g:gutentags_cache_dir = '/tmp'
let g:gutentags_generate_on_empty_buffer = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tcomment

let g:tcomment#options = {'whitespace': 'no' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dokument

let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '' }
let g:dokumentary_open = 'rightbelow new' " open horizontally and below


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp

"let g:ctrlp_default_input = 0
" maximum height in items
let ctrlp_match_window = 'max:16'
let g:ctrlp_open_new_file= 't'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|\.stack-work$',
  \ 'file': '\.exe$\|\.so$\|\.a$\|\.o$\|\.dat$\|\.hi$\|\.dyn_hi$\|\.dyn_o$'
  \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" deoplete

"let g:deoplete#enable_at_startup = 1 
" manual enable/disable deoplete: `call deoplete#enable()` / `call deoplete#disable()`


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

" keep scratch file
let g:scratch_persistence_file = "~/.vim/scratch.vim" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#flags = 'f'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter

set updatetime=100
nmap <leader>g :GitGutterBufferToggle<CR>
nmap <leader>G :GitGutterLineHighlightsToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabmerge

nnoremap tm :Tabmerge right<CR>
nnoremap tM <C-W>T


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-bookmarks

" remove color of column
highlight SignColumn ctermbg=none


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-multiple-cursors

" default mapping
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-j>'
let g:multi_cursor_skip_key='<C-k>'
let g:multi_cursor_quit_key='<Esc>'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easy-align

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree

" open nerdtree automatically if no files specified for vim
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open if directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" quit if only nerdtree open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" F9 for nerd tree
nmap <F9> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" delimitmate

let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" goyo

nmap <silent> <F7> :Goyo<CR>

"augroup AutomaticGoyo
    "autocmd!
    "autocmd FileType * :Goyo!
    "autocmd FileType markdown :Goyo
    "autocmd FileType text :Goyo
"augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" peekaboo

let g:peekaboo_delay = 400
let g:peekaboo_compact = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ripgrep

let g:rg_highlight = 1
let g:rg_derive_root = 1
let g:rg_format = '%f:%l:%m'
"let g:rg_command = 'rg --vimgrep --heading'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  tagbar languages 

" hasktags : tag file for Haskell
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
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source settings from local file (if present)

let s:local_vimrc = expand('~/.vim/local.vim')  
if filereadable( s:local_vimrc )
    execute "source " . s:local_vimrc
endif
