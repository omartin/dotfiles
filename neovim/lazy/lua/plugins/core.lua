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
}
