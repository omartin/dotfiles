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
        ["<leader>g"] = { name = "+Git" },
        ["<leader>x"] = { name = "+Diagnostics" },
        ["<leader>T"] = { name = "+Terminal" },
        ["<leader>t"] = { "<cmd>tabnew<CR>", "New Tab" },
        ["<leader>w"] = { "<cmd>w!<CR>", "Save" },
        ["<leader>Q"] = { "<cmd>qa!<CR>", "Quit all" },
        ["<leader>c"] = { "<cmd>q<CR>", "Close window" },
        ["<leader>="] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
        ["<leader>Tv"] = { "<cmd>ToggleTerm direction=vertical<CR>", "Terminal vertical" },
        ["<leader>Th"] = { "<cmd>ToggleTerm direction=horizontal<CR>", "Terminal vertical" },
      })
    end,
  }}
