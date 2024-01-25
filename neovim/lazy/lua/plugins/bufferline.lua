return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  config = function()
    local bufferline = require('bufferline')
    bufferline.setup({
      options = {
        --separator_style = 'slant',
        --indicator = { style = 'underline' },
      }
    })
  end
}
