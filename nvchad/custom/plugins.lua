local overrides = require("custom.configs.overrides")

local plugins = {
  {
    "alexghergh/nvim-tmux-navigation",
    init = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true,
      }
    end,
    cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight","NvimTmuxNavigateUp","NvimTmuxNavigateDown" },
  },

  {
    "folke/trouble.nvim",
    init = function()
      require("trouble").setup {}
    end,
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
    opts = overrides.mason,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  }
}
return plugins
