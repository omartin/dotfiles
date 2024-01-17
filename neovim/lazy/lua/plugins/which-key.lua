return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts = {
    icons = { group = '', separator = '' },
    disable = { filetypes = { 'TelescopePrompt' } },
  },
  config = function(_, opts)
    local wk = require('which-key')
    wk.setup(opts)
    wk.register({
      ['<Leader>f'] = {
        name = '+ Find',
        f = { '<cmd>Telescope find_files<cr>', 'Find files' },
        w = { '<cmd>Telescope live_grep<cr>', 'Live grep' },
        t = { '<cmd>Telescope colorscheme<cr>', 'Find colorschemes' },
        o = { '<cmd>Telescope oldfiles<cr>', 'Old files' },
      },
    })
  end,
}
