return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { '<C-t>', '<cmd>ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
  },
  opts = {},
}
