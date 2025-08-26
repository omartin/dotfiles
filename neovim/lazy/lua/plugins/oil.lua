return {
   'stevearc/oil.nvim',
   event = 'VeryLazy',
   dependencies = { { 'echasnovski/mini.icons', opts = {} } },
   opts = {
     columns = {
       'icon',
       'size',
     },
   },
  keys = {
    { '-', '<cmd>Oil<cr>', desc = 'File explorer' }
  }
 }
