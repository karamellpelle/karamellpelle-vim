""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" karamellpelle-vim
"
" * https://vimawesome.com/
" * https://neovimcraft.com/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug

call plug#begin('~/.vim/plugged')
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
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
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
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
"Plug 'junegunn/limelight.vim' " FIXME: configure this for Goyo
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'monkoose/fzf-hoogle.vim'
"Plug 'https://github.com/voldikss/vim-floaterm'
Plug 'uptech/vim-ping-cursor'
Plug 'vim-pandoc/vim-pandoc-syntax' 
Plug 'vim-pandoc/vim-pandoc'
Plug 'junegunn/gv.vim' " needs vim-fugitive
Plug 'junegunn/vim-emoji'
Plug 'nordtheme/vim', { 'as': 'nord-vim' }
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'connorholyday/vim-snazzy'

" don't fire startify if vimpager
" FIXME: this does not work
if !exists("g:vimpager")
Plug 'mhinz/vim-startify'
endif

" NeoVim exclusive plugins
if has('nvim')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
Plug 'dcampos/nvim-snippy' 
Plug 'karamellpelle/nvim-skeletty'
Plug 'ii14/neorepl.nvim' 
Plug 'luc-tielen/telescope_hoogle'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'xiyaowong/telescope-emoji.nvim'
Plug 'octarect/telescope-menu.nvim'
Plug 'akinsho/toggleterm.nvim'
Plug 'rcarriga/nvim-notify'
endif

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
set noruler
set laststatus=2

" minimum number of lines shown above cursor
"set scrolloff=0   

" select the pasted text
nnoremap gV `[v`]

" jump to beginning and end of line (excluding spaces)
nnoremap H ^
nnoremap L g_

" Y yank to end of line, like D does
nnoremap Y y$

" prevent Ex mode
" TODO: find something useful for Q
nnoremap Q <Nop>

" use mouse
set mouse=n

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

" map international keyboard to US-keyboard (non-insert mode)
set nolangremap " don't map after a mapping
set langmap=ø[,æ],å\\,Ø{,Æ},Å\|

" efficient write to file
nnoremap <Leader><Space> :w<CR>

" jump to text blocks
nnoremap <silent> ]] /\v(^$\n\|%^)@<=^.<CR>
nnoremap <silent> [[ ?\v(^$\n\|%^)@<=^.<CR>

" insert newlines without leaving normal mode
nnoremap o o<Esc>
nnoremap O O<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors

" prevent gray background on concealed characters (vim-pandoc-syntax)
au Colorscheme * hi! link Conceal Number

set background=dark
" I like this colorscheme
"colorscheme torte
"colorscheme codedark
"colorscheme codedark
"colorscheme catppuccin_mocha
"colorscheme iceberg
colorscheme snazzy
"colorscheme dracula

set termguicolors

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-startify
"
if !exists("g:vimpager")

" cd to git root
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

" update file items upon start
let g:startify_update_oldfiles = 1

" ignore files from patterns
"let g:startify_skiplist = 

" centered header
" pick random quote and cowsay with random figure
" using current cowsay-apj, we must remove cows with names beginning with
" uppercase since such cow files are not implemented yet
let s:header_cmd = 
  \ 'fortune | cowsay -W 80 -f $(cowsay -l | sed "/[A-Z].*$/d" | shuf -n 1)'
let g:startify_custom_header =
  \ startify#center(split(system(s:header_cmd), '\n'))

" centered footer TODO: add some fun :)
let g:startify_custom_footer = 
    \ startify#center(split(system('git status --short'), '\n'))
"let g:startify_custom_footer = 
"   \ startify#center(split("lines"), '\n')) " split :: String -> [String]
"let s:ascii = [
"   \ '    ',
"   \ ' O o',
"   \ '  -',
"   \ ' ' 
"   \]
"let g:startify_custom_footer = 
"   \ startify#center(s:ascii)

" start menu: files in current project + custom commands
let g:startify_lists = [
      "\ { 'type': 'files',     'header': ['   MRU']            },
      "\ { 'type': 'dir',       'header': ['   Previous files in current project '. fnamemodify(getcwd(), ':t')] },
      \ { 'type': 'dir',       'header': ['   Recent files in current folder '. getcwd()] },
      "\ { 'type': 'sessions',  'header': ['   Sessions']       },
      "\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" see :h startify-mappings for map characters to avoid: q, e, e, b, s, v, t
let g:startify_commands = [
    "\ ':help reference',
    "\ ['Vim Reference', 'h ref'],
    "\ {'h': 'h ref'},
    "\ {'m': ['My magical function', 'call Magic()']},
    "\ {'g': ['git status', '! git status']},
    \ ]

highlight StartifyBracket ctermfg=240
highlight StartifyFooter  ctermfg=240
highlight StartifyHeader  ctermfg=114
highlight StartifyNumber  ctermfg=215
highlight StartifyPath    ctermfg=245
highlight StartifySlash   ctermfg=240
highlight StartifySpecial ctermfg=240

endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion

" disable default mappings
let g:EasyMotion_do_mapping = 0 

" Uppercase as targets
"let g:EasyMotion_use_upper = 1 
"let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" no increment search
"let g:EasyMotion_move_highlight = 0

" jump to any character
nmap s <Plug>(easymotion-overwin-f)

" jump to any word
"nmap <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>e <Plug>(easymotion-e)
nmap <Leader>E <Plug>(easymotion-E)
nmap <Leader>ge <Plug>(easymotion-ge)
nmap <Leader>gE <Plug>(easymotion-gE)
xmap <Leader>w <Plug>(easymotion-overwin-w)
xmap <Leader>e <Plug>(easymotion-e)
xmap <Leader>E <Plug>(easymotion-E)
xmap <Leader>ge <Plug>(easymotion-ge)
xmap <Leader>gE <Plug>(easymotion-gE)

" jump up and down
let g:EasyMotion_startofline = 1 " ignore cursor column?
nmap <Leader>j <Plug>(easymotion-j)
nmap <Leader>k <Plug>(easymotion-k)
xmap <Leader>j <Plug>(easymotion-j)
xmap <Leader>k <Plug>(easymotion-k)
"map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)
xmap <Leader>L <Plug>(easymotion-overwin-line)
nmap <Leader>l <Plug>(easymotion-lineanywhere)
xmap <Leader>l <Plug>(easymotion-lineanywhere)

"map <Leader>h <Plug>(easymotion-linebackward)
"map <Leader><space> <Plug>(easymotion-lineanywhere)
"map <Leader>h <Plug>(easymotion-lineanywhere) " gitgutter uses <leader>h?


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

" don't use local markdowns as a wiki, only 'vimwiki_list'
let g:vimwiki_global_ext = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar

let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
nnoremap <silent> <F8> :TagbarToggle<CR>
nnoremap <silent> <leader>i :TagbarToggle<CR>

" open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabman

" F4: show/hide tab manager
nmap <F4> :TMToggle<CR>

" show special buffers too, not only files
let g:tabman_specials = 1


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
" dokumentary

let g:dokumentary_docprgs = {'cpp': 'cppman {0}', 'python': '','go': '', 'haskell': '' }
let g:dokumentary_open = 'rightbelow new' " open horizontally and below


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf

" set colors 
" FIXME: instead configure native overlay colors?
"let g:fzf_colors =
"\ { 'fg':      ['fg', 'Normal'],
"  \ 'bg':      ['bg', 'Normal'],
"  \ 'hl':      ['fg', 'Comment'],
"  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"  \ 'hl+':     ['fg', 'Statement'],
"  \ 'info':    ['fg', 'PreProc'],
"  \ 'border':  ['fg', 'Ignore'],
"  \ 'prompt':  ['fg', 'Conditional'],
"  \ 'pointer': ['fg', 'Exception'],
"  \ 'marker':  ['fg', 'Keyword'],
"  \ 'spinner': ['fg', 'Label'],
"  \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf-hoogle

" let K search hoogle at below (does not work when vim-dokumentary, yet!)
augroup HoogleMaps
  autocmd!
  autocmd FileType haskell setlocal keywordprg=:Hoogle
augroup END

if has('macos')
  g:hoogle_open_link = 'open'
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp

" maximum height, in items
let ctrlp_match_window = 'max:16'

" new file in new tab
let g:ctrlp_open_new_file= 't'

" set search root
let g:ctrlp_working_path_mode = '' " current working directory
"let g:ctrlp_working_path_mode = 'ra' project folder of current file

" ignore these files and directories from search results
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|stack-work)$',
  \ 'file': '\v\.(exe|so|dll|a|o|dat|hi|dyn_hi|dyn_o|aux)$'
  \ }

" search filenames, not filepath (folders)
"let g:ctrlp_by_filename = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabman

let g:tabman_number = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-maximizer

let g:maximizer_set_default_mapping = 0 
nnoremap <C-W>o     :MaximizerToggle!<CR>
nnoremap <C-W><C-O> :MaximizerToggle!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scratch 

" keep scratch file
let g:scratch_persistence_file = "~/.vim/scratch.vim" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline

let g:airline_powerline_fonts = 1
let g:airline#extensions#tagbar#flags = 'f'
let g:airline_theme='icebergDark'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gitgutter

set updatetime=500
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
" vim-visual-multi



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

" Goyo from F7
nnoremap <silent> <F7> :Goyo<CR>
inoremap <silent> <F7> <C-o>:Goyo<CR>


" special actions for help files
function! s:at_help()
    if &buftype == 'help'
        " enable 'q' = quit
        "nnoremap <buffer> q <C-w>q
        "Goyo
        " ^ does not work!
    endif
endfunction

augroup AutomaticGoyo
    autocmd!
    autocmd BufEnter *.txt call s:at_help()
augroup END


function! s:goyo_enter()
    if has('gui_running')
      "set fullscreen
      "set background=light
      "set linespace=7
    endif
    set wrap
    set linebreak

endfunction

function! s:goyo_leave()
    if has('gui_running')
        "set nofullscreen
        "set background=dark
        "set linespace=0
    endif

endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" peekaboo

let g:peekaboo_delay = 300
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
" vim-ping-cursor
nnoremap <leader>p :PingCursor<cr>

" This is the default
"let g:ping_cursor_flash_milliseconds = 250


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-pandoc

" no annoying spell highlight
let g:pandoc#spell#enabled = 0

" remove folding
let g:pandoc#modules#disabled = ["folding", "bibliographies"]

" linebreak (hard and smart auto)
"let g:pandoc#formatting#mode = 'hA'

" templates location
" ('PandocTemplate get' did not work with real templates)
"let g:pandoc#command#templates_file = "~/.local/share/pandoc/templates"

" no default mappings
let g:pandoc#keyboard#use_default_mappings = 0

"let g:pandoc#hypertext#use_default_mappings = 0

" specific Pandoc autocommands
" run pandoc & open pdf when writing a pandoc file (i.e. markdown)
"let #autocmd FileType pandoc let g:pandoc#command#autoexec_command = "Pandoc! pdf"
"let g:pandoc#command#autoexec_on_writes = 1
augroup Pandoc
  autocmd!
  "autocmd FileType pandoc setlocal keywordprg=:Hoogle
  "autocmd Pandoc FileType pandoc 
  "autocmd Pandoc WinEnter 
augroup END




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" source settings from local file (if present)

let s:local_vimrc = expand('~/.vim/local.vim')  
if filereadable( s:local_vimrc )
    execute "source " . s:local_vimrc
endif
