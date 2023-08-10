local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "alexghergh/nvim-tmux-navigation",
    init = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true, -- defaults to false
      }
    end,
    cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight","NvimTmuxNavigateUp","NvimTmuxNavigateDown" },
  },

  -- override plugin configs
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm
  },
}
return plugins
