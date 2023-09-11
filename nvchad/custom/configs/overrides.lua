local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "terraform",
  },
}


M.mason = {
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
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        row = 0.02,
        col = 0.05,
        width = 0.9,
        height = 0.9,
        border = "rounded",
      },
      horizontal = {
        split_ratio = 0.3
      },
      vertical = {
        split_ratio = 0.5
      }
    }
  }
}

M.nvimtree = {
  git = {
    enable = true,
  },
  filters = {
    dotfiles = true,
  }
}

return M
