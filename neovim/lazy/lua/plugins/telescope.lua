return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = 'Telescope',
  config = function ()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup {
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = { prompt_position = 'top' },
        },
        mappings = {
          i = { ["<Esc>"] = actions.close },
        }
      },
      pickers = {
        find_files = { previewer = false },
        colorscheme = { previewer = false, enable_preview = true, layout_config = { width = 0.5 } },
      }
    }
  end,
}
