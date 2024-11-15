return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<C-l>'] = false,
          ['<C-k>'] = false,
          ['<C-j>'] = false,
          ['<M-h>'] = 'actions.select_split',
          ['gd'] = {
            desc = 'Toggle file detail view',
            callback = function()
              detail = not detail
              if detail then
                require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
              else
                require('oil').set_columns { 'icon' }
              end
            end,
          },
        },
        view_options = {
          show_hidden = true,
        },
      }
      -- open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'open parent directory' })
      -- open parent directory in current window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
