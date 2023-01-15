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
        ["<leader>s"] = { name = "+search" },
        --["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
        --["w"] = { "<cmd>w!<CR>", "Save" },
        --["Q"] = { "<cmd>qa!<CR>", "Quit all" },
        --["c"] = { "<cmd>q<CR>", "Close window" },
        --[[
        ["f"] = {
          "<cmd>NvimTreeClose<cr><cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
          "Find files",
        },
        ["F"] = { "<cmd>NvimTreeClose<cr><cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
        ["t"] = { "<cmd>tabnew<CR>", "New Tab" },
        ["="] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },

        p = {
          name = "Packer",
          s = { "<cmd>PackerSync<cr>", "Sync" },
          S = { "<cmd>PackerStatus<cr>", "Status" },
          u = { "<cmd>PackerUpdate<cr>", "Update" },
        },

        g = {
          name = "Git",
          j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
          k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
          l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
          s = { "<cmd>Telescope git_status<cr>", "Status" },
          d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
        },

        l = {
          name = "LSP",
          I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
          r = { "<cmd>Telescope lsp_references<cr>", "References" },
          d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
        },

        s = {
          name = "Telescope",
          c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
          h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
          r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
          C = { "<cmd>Telescope commands<cr>", "Commands" },
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
