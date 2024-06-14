set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" fix a bug for msys2 on windows, https://github.com/neovim/neovim/issues/21148
if has('win32') || has('win64')
  set shell=$COMSPEC
endif
"let &shellcmdflag='-c'
"let &shellquote="\""


source ~/.vimrc


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup vim-snippy
"
" see `:h snippy-setup-options`
" TIPS: 
"     * snipmate syntax :`:h snippy-snipmate-syntax`
"     * examples  gThttps://github.com/dcampos/nvim-snippy#adding-snippets
"     * use `!lua <CMD>` for lua commands in snippets (or !vim which is default),
"       see `:h snippy-snipmate-eval`
"     * `${<stop or variable>/<replacement>/<flags>}` to tranform using regex
"     * SnitMate has variables $TM_XXX for use, see https://macromates.com/manual/en/environment_variables
"     * `${1:`system("<shellcommand>")}` for inserting shell command
imap <expr> <Tab> snippy#can_expand_or_advance() ? '<Plug>(snippy-expand-or-advance)' : '<Tab>'
imap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
smap <expr> <Tab> snippy#can_jump(1) ? '<Plug>(snippy-next)' : '<Tab>'
smap <expr> <S-Tab> snippy#can_jump(-1) ? '<Plug>(snippy-previous)' : '<S-Tab>'
xmap <Tab> <Plug>(snippy-cut-text)

highlight SnippyHighlight cterm=underline,bold ctermfg=11 gui=bold guifg=Yellow 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoVim lua

lua << EOF

--------------------------------------------------------------------------------
-- Telescope with friends

require( "user.telescope" )


--------------------------------------------------------------------------------
--  Snippy

require( 'snippy' ).setup({
        local_snippet_dir = '.snippets',
        hl_group = 'SnippyHighlight'
})



--------------------------------------------------------------------------------
--  Skeletty


require( 'skeletty' ).setup( {
      dirs = { '~/.vim/skeletons' },
      localdir = '.skeletons',
      localdir_project = true,
      localdir_exclusive = true,
      auto = true,
      auto_single = true,
      apply_at_top = true,
      override = true,
      --selector_native_force = false,
      apply_syntax = true,
      telescope = 
      {
          --skeletty_hl_group = "Search",
      }
  } )

require("telescope").load_extension('skeletty')

EOF
