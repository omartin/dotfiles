-- BOOTSTRAP LAZY
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
return require('lazy').setup({

  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "tpope/vim-fugitive",
  "tpope/vim-surround",
  "christoomey/vim-tmux-navigator",

  -- colorscheme
  "RRethy/nvim-base16", -- A bunch of color schemes based on base 16
  "LunarVim/Colorschemes", -- LunarVim specific color schemes
  "rafi/awesome-vim-colorschemes",
  "luisiacc/gruvbox-baby",
  "lewis6991/github_dark.nvim",
  "EdenEast/nightfox.nvim",

  -- which-key
  "folke/which-key.nvim",

  -- nvim-tree
  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

  -- telescope
  "nvim-telescope/telescope.nvim",
  "folke/trouble.nvim",
  
  -- git
  { 'lewis6991/gitsigns.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
  "rhysd/git-messenger.vim",
  "APZelos/blamer.nvim",

  -- lualine
  "nvim-lualine/lualine.nvim",

  -- indentline
  "lukas-reineke/indent-blankline.nvim",

  -- colorizer
  "norcalli/nvim-colorizer.lua",

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- lsp
  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  },

  -- tab
  "alvarosevilla95/luatab.nvim",

  -- term
  { "akinsho/toggleterm.nvim", version = '*' },

})
