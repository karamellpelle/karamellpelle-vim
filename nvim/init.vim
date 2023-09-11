set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" TODO: use init.lua and source therefrom?

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

" execute settings in Lua
lua << EOF


--------------------------------------------------------------------------------
--  Snippy

require( 'snippy' ).setup({
        local_snippet_dir = '.snippets',
        hl_group = 'SnippyHighlight'
})


--------------------------------------------------------------------------------
--  Telescope

local telescope = require('telescope')

telescope.setup {

  defaults = {
      initial_mode = "normal"
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure

    --skeletty = {  }
  }
}

--------------------------------------------------------------------------------
--  Hoogle

telescope.load_extension('hoogle')

--------------------------------------------------------------------------------
--  vim-bookmarks

telescope.load_extension('vim_bookmarks')

-- set local actions (Picker)
local bookmark_actions = require('telescope').extensions.vim_bookmarks.actions
require('telescope').extensions.vim_bookmarks.all {
    attach_mappings = function(_, map) 
        map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)

        return true
    end
}

--------------------------------------------------------------------------------
--  Skeletty


require( 'skeletty' ).setup( {
      dirs = { '~/.vim/skeletons', '~/.config/nvim/skeletons' },
      localdir = '.skeletons',
      localdir_project = true,
      --auto = true,
      --apply_at_top = true,
      --localdir_exclusive = true,
      --override = true,
      --selector_native_force = false,
      telescope = 
      {
          --skeletty_higroup = "Search",
      }
  } )

telescope.load_extension('skeletty')

EOF
