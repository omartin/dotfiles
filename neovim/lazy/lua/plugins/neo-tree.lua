return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  opts = {
    filesystem = {
      hijack_netrw_behavior = 'open_default'
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_file_path)
          require("neo-tree.command").execute({ action = "close" })
        end
      },
    },
    window = {
      width = 30
    }
  },
  keys = {
    { '<Leader>e', '<cmd>Neotree reveal toggle float<cr>', desc = 'File explorer' }
  }
}
