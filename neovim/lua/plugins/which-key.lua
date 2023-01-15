return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",

    opts = {
      plugins = { spelling = true },
      key_labels = { ["<leader>"] = "SPC" },
    },

    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register({
        mode = { "n", "v" },
        ["<leader>s"] = { name = "+Search" },
        --["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
        --["w"] = { "<cmd>w!<CR>", "Save" },
        --["Q"] = { "<cmd>qa!<CR>", "Quit all" },
        --["c"] = { "<cmd>q<CR>", "Close window" },
        --[[
        ["f"] = {
          "<cmd>NvimTreeClose<cr><cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
          "Find files",
        },
        ["t"] = { "<cmd>tabnew<CR>", "New Tab" },
        ["="] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },

        g = {
          name = "Git",
          j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
          l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
          s = { "<cmd>Telescope git_status<cr>", "Status" },
          d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        },

        x = {
          name = "Trouble",
          x = { "<cmd>TroubleToggle<cr>", "Toggle" },
          w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics" },
          d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics" },
        }
        --]]
      })
    end,
  }}
