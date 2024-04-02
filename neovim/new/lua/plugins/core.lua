return {
  {
    'christoomey/vim-tmux-navigator',
    event = 'VeryLazy',
    keys = { "<C-h>", "<C-j>", "<C-j>", "<C-l>" }
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufReadPre',
    opts = {},
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    event = 'VeryLazy',
    opts = {
      indent = { char = "▏" },
      scope = { enabled = false },
    },
  },
  {
    'tiagovla/scope.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'numToStr/Comment.nvim',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup()
    end
  },
}
