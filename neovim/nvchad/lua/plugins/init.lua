return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    init = function()
      require("nvim-tmux-navigation").setup {
        disable_when_zoomed = true,
      }
    end,
    cmd = { "NvimTmuxNavigateLeft", "NvimTmuxNavigateRight","NvimTmuxNavigateUp","NvimTmuxNavigateDown" },
  },

  -- Overrides
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      filters = {
        dotfiles = true,
      },
      actions = {
        open_file = {
          quit_on_open = true
        }
      },
    }
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "rust",
        "yaml",
        "query",
        "vim",
        "lua",
        "luadoc",
        "printf",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "markdown",
        "markdown_inline",
        "terraform",
        "vimdoc",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
    }
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
        "css-lsp",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "html-lsp",
        "lua-language-server",
        "stylua",
        "typescript-language-server",
        "terraform-ls",
        "rust-analyzer",
  			"prettier"
  		},
  	},
  },

}
