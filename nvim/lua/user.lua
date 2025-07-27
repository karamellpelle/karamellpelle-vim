
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

--------------------------------------------------------------------------------
 -- nvim-cmp.
local cmp = require( 'cmp' )
cmp.setup( {
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
         require('snippy').expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    window = {
      --completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      --{ name = 'nvim_lsp' },
       { name = 'snippy' }, -- For snippy users.
    })
})
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

---- Set up lspconfig.
--local capabilities = require('cmp_nvim_lsp').default_capabilities()
---- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
--require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--capabilities = capabilities
--}
