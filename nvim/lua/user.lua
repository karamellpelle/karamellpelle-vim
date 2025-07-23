
--------------------------------------------------------------------------------
-- Telescope with friends

require( "user.telescope" )

--------------------------------------------------------------------------------
--  Snippy

require( 'snippy' ).setup({
        local_snippet_dir = '.snippets',
        hl_group = 'SnippyHighlight',
        virtual_markers = {
            enabled = true,
            empty = '%n:␣',
            default = '%n:',
        },
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

--------------------------------------------------------------------------------
--  toggleterm

require("toggleterm").setup{
      open_mapping = [[<c-\>]]
    , direction = "float"
    --, on_create = fun
    --, on_exit = fun
    --, on_open = fun
    --, on_close = fun
    --, float_opts = {
    --      -- The border key is *almost* the same as 'nvim_open_win'
    --      -- see :h nvim_open_win for details on borders however
    --      -- the 'curved' border is a custom border type
    --      -- not natively supported but implemented in this plugin.
    --      border =  'curved' ,
    --      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
    --      --width = <value>,
    --      --height = <value>,
    --      --row = <value>,
    --      --col = <value>,
    --      winblend = 3,
    --      --title_pos = 'left' | 'center' | 'right', position of the title of the floating window
    --}
}

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  -- for horizontal or vertical directions:
  --vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  --vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  --vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  --vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  --vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

