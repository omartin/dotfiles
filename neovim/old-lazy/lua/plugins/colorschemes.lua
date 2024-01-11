return {
  --[[
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function() vim.cmd("colorscheme catppuccin-mocha") end,
  },
  --]]
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        --dark_variant = 'moon',
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
  --"projekt0n/github-nvim-theme",
  --"RRethy/nvim-base16", -- A bunch of color schemes based on base 16
  --[[
  { 
    "LunarVim/Colorschemes", -- LunarVim specific color schemes
    config = function() vim.cmd("colorscheme ferrum") end,
  },
  --]]
  --"LunarVim/horizon.nvim",
  --"rafi/awesome-vim-colorschemes",
  --"luisiacc/gruvbox-baby",
  --"lewis6991/github_dark.nvim",
  --"EdenEast/nightfox.nvim",
  --[[
  { 
    "folke/tokyonight.nvim",
    config = function() vim.cmd("colorscheme tokyonight-moon") end,
  },
  --]]
  --"rebelot/kanagawa.nvim",
  --[[
  {
    "cocopon/iceberg.vim",
    config = function() vim.cmd("colorscheme iceberg") end,
  },
  --]]
}
