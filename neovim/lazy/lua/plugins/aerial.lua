return {
  'stevearc/aerial.nvim',
  event = 'VeryLazy',
  opts = {},
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
  keys = {
    { '<Leader>a', '<cmd>AerialToggle<cr>', desc = 'Aerial toggle' }
  }
}
