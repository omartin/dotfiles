return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  dependencies = { 'echasnovski/mini.icons' },
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
    wk.add({
      { "<Leader>f", group = "Find" },
      { "<Leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<Leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<Leader>fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<Leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<Leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old files" },
      { "<Leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "Find colorschemes" },
      { "<Leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<Leader>fW", desc = "Live grep in subfolder", function()
          vim.ui.input({ prompt = 'Subfolder: ', default = vim.fn.expand('%:p:h') .. '/' }, function(input)
            if input then
              vim.cmd('Telescope live_grep cwd=' .. input)
            end
          end)
        end
      },
      { "<Leader>fn", desc = "Live grep", function()
        require('telescope.builtin').find_files {
          cwd = vim.fn.stdpath('config')
        }
        end
      },
      { "<Leader>g", group = "Git" },
      { "<Leader>gb", "<cmd>Gitsigns blame_line<cr>", desc = "Blame line" },
      { "<Leader>gs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
      { "<Leader>b", group = "Buffer" },
      { "<Leader>a", group = "AI" },
    })
  end,
}
