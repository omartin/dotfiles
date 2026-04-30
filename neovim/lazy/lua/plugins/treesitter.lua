return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = function()
      require('nvim-treesitter').install({
        'c', 'lua', 'vim', 'vimdoc', 'query', 'rust', 'javascript', 'typescript', 'yaml',
        'markdown', 'markdown_inline',
      }):wait(300000)
    end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    },
    config = function()
      require('nvim-treesitter-textobjects').setup({
        select = {
          lookahead = true,
          selection_modes = {
            ['@parameter.outer'] = 'v',
            ['@function.outer'] = 'V',
            ['@class.outer'] = '<c-v>',
          },
          include_surrounding_whitespace = true,
        },
      })

      local select = require('nvim-treesitter-textobjects.select')
      vim.keymap.set({ 'x', 'o' }, 'af', function() select.select_textobject('@function.outer', 'textobjects') end)
      vim.keymap.set({ 'x', 'o' }, 'if', function() select.select_textobject('@function.inner', 'textobjects') end)
      vim.keymap.set({ 'x', 'o' }, 'ac', function() select.select_textobject('@class.outer', 'textobjects') end)
      vim.keymap.set({ 'x', 'o' }, 'ic', function() select.select_textobject('@class.inner', 'textobjects') end, { desc = 'Select inner part of a class region' })
      vim.keymap.set({ 'x', 'o' }, 'as', function() select.select_textobject('@local.scope', 'locals') end, { desc = 'Select language scope' })
    end,
  },
}
