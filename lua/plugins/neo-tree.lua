-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  lazy = false,
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },

  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    close_if_last_window = true,
    enable_git_status = true,
    enable_diagnostics = true,

    filesystem = {
      window = {
        position = 'left',
        width = 30,

        mappings = {
          ['\\'] = 'close_window',
          ['E'] = 'expand_all_nodes',

          ['<cr>'] = 'open',
          ['l'] = 'open',
          ['h'] = 'close_node',

          ['s'] = 'open_vsplit',
          ['S'] = 'open_split',
          ['t'] = 'open_tabnew',

          ['r'] = 'refresh',
          ['a'] = 'add',
          ['A'] = 'add_directory',
          ['d'] = 'delete',
          ['R'] = 'rename',
        },
      },
    },

    event_handlers = {
      {
        event = 'file_opened',
        handler = function() require('neo-tree.command').execute { action = 'close' } end,
      },
    },
  },
}
