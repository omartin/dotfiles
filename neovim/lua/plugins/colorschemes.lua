return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- config = function() vim.cmd("colorscheme catppuccin-mocha") end,
  },
  {
    "rose-pine/neovim",
    opts = {
      dark_variant = 'moon',
    },
    config = function() vim.cmd("colorscheme rose-pine") end,
  },
  --"projekt0n/github-nvim-theme",
  --"RRethy/nvim-base16", -- A bunch of color schemes based on base 16
  --"LunarVim/Colorschemes", -- LunarVim specific color schemes
  --"rafi/awesome-vim-colorschemes",
  --"luisiacc/gruvbox-baby",
  --"lewis6991/github_dark.nvim",
  --"EdenEast/nightfox.nvim",
}
