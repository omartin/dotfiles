return {
  { 
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "latte", -- latte, frappe, macchiato, mocha
    },
    --config = function() vim.cmd([[colorscheme catppuccin]]) end,
  },
  { 
    "projekt0n/github-nvim-theme",
    config = function() vim.cmd([[colorscheme github_dark]]) end,
  }
}
