--------------------------------------------------------------------------------
--  Telescope

local telescope = require('telescope')

telescope.setup {

  defaults = {
      initial_mode = "normal",
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
--  Commands

-- | :T 
local create_command = vim.api.nvim_create_user_command
create_command("T", function(arg) 
    vim.cmd( "Telescope " .. (unpack( arg.fargs or {} )  or "" ) )
end, { nargs="*", desc = ":Telescope" })

-- | :Tg
local create_command = vim.api.nvim_create_user_command
create_command("Tg", function(arg) 
    vim.cmd( "Telescope live_grep " .. (unpack( arg.fargs or {} ) or "" ) )
end, { nargs="*", desc = ":Telescope live_grep" })

-- | :Tq
local create_command = vim.api.nvim_create_user_command
create_command("Tq", function(arg) 
    vim.cmd( "Telescope quickfix " .. (unpack( arg.fargs or {} ) or "") ) 
end, { nargs="*", desc = ":Telescope quickfix" })


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>tg', builtin.live_grep, {})
--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>th', builtin.help_tags, {})
--vim.keymap.set('n', '<leader>tb', .extensions.vim_bookmarks, {})
--vim.keymap.set('n', '<leader>tm', .extensions.menu, {})

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
