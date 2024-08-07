--------------------------------------------------------------------------------
--  Telescope

local telescope = require('telescope')

telescope.setup {

  defaults = {
      initial_mode = "insert",
      layout_strategy = "vertical",

    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- ..
      --mappings = {
      --    n = {
      --        ["<C-q>"] = require('telescope.actions').actions.smart_send_to_qflist,
      --    }
      --
      --}
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
      builtin = {
          initial_mode = "insert"
    }
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure

    --skeletty = {  }
  }
}

--------------------------------------------------------------------------------
-- 

local extensions = require('telescope').extensions


--------------------------------------------------------------------------------
--  Hoogle

telescope.load_extension('hoogle')

--------------------------------------------------------------------------------
--  vim-bookmarks

telescope.load_extension('vim_bookmarks')

-- set local actions (Picker)
local bookmark_actions = extensions.vim_bookmarks.actions
extensions.vim_bookmarks.all {
    attach_mappings = function(_, map) 
        map('n', 'dd', bookmark_actions.delete_selected_or_at_cursor)

        return true
    end
}


--------------------------------------------------------------------------------
--  emoji

require("telescope").load_extension("emoji")


--------------------------------------------------------------------------------
--  menu : create custom menus


local function make_menu(...)
    local is = { ... }
    local default_items = 
          { 
            { display = "jumplist", value = "Telescope jumplist" },
            { display = "keymap", value = "Telescope keymap" },
            { display = "highlights", value = "Telescope highlights" },
            { display = "man", value = "Telescope man" },
            { display = "quickfix", value = "Telescope quickfix" },
            { display = "symbols", value = "Telescope symbols" },
            { display = "registers", value = "Telescope registers" },
            { display = "helptags", value = "Telescope help_tags" },
            { display = "Checkhealth", value = "checkhealth" },
          }
    for _,v in pairs(default_items) do table.insert( is, v ) end
    return { items = is }
end

require("telescope").setup {
  extensions = {
    menu = { default  = make_menu(),
             -- custom menus here:
             -- (empty)
             -- custom menus for defines filetypes inside here:
             filetype = {
             markdown = make_menu({"Test", "WTF"}),
             haskell  = make_menu( 
                        { "Hello", "CMD" }
                      , { "GoodBye", "print('KOKO')" }
                    ),
             }
    }
  }
}


require("telescope").load_extension "menu"

--------------------------------------------------------------------------------
--  Telescope mappings


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tt', builtin.resume, {})
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ts', builtin.search_history, {})
vim.keymap.set('n', '<leader>to', builtin.vim_options, {})
vim.keymap.set('n', '<leader>tm', function() telescope.extensions.menu.menu({}) end)
vim.keymap.set('n', '<leader>te', function() telescope.extensions.emoji.emoji({}) end) 
vim.keymap.set('n', '<leader>th', function() telescope.extensions.hoogle.hoogle({}) end) 

