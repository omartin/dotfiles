return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  keys = {
    { '<C-t>', '<cmd>ToggleTerm<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    { '<Leader>tf', '<cmd>ToggleTerm direction=float<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    { '<Leader>tv', '<cmd>ToggleTerm direction=vertical size=80<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
    { '<Leader>th', '<cmd>ToggleTerm direction=horizontal<cr>', mode = { 'n', 't' }, desc = 'Toggle Terminal' },
  },
  opts = {},
}
