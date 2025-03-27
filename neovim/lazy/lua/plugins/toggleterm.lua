return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { '<C-t>', '<cmd>ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    { '<Leader>tr', '<cmd>ToggleTerm direction=vertical size=80<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    { '<Leader>tb', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
  },
  opts = {},
}
