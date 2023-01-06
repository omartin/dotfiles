require "plugins.whichkey"
require "plugins.nvim-tree"
require "plugins.telescope"
require "plugins.trouble"
require "plugins.gitsigns"
require "plugins.git-messenger"
require "plugins.blamer"
require "plugins.lualine"
require "plugins.indentline"
require "plugins.colorizer"
require "plugins.treesitter"
require "plugins.lsp"
require "plugins.luatab"

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "tpope/vim-fugitive"
  use "tpope/vim-surround"
  use "christoomey/vim-tmux-navigator"

  -- colorscheme
  use "RRethy/nvim-base16" -- A bunch of color schemes based on base 16
  use "LunarVim/Colorschemes" -- LunarVim specific color schemes
  use "rafi/awesome-vim-colorschemes"
  use "luisiacc/gruvbox-baby"  
  use "lewis6991/github_dark.nvim"
  use "EdenEast/nightfox.nvim"

  -- which-key
  use "folke/which-key.nvim"

  -- nvim-tree
  use {
    "kyazdani42/nvim-tree.lua",
    requires = {
      "kyazdani42/nvim-web-devicons", -- optional, for file icon
    }
  }

  -- telescope
  use "nvim-telescope/telescope.nvim"
  use "folke/trouble.nvim"
  
  -- git
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  use "rhysd/git-messenger.vim"
  use "APZelos/blamer.nvim"

  -- lualine
  use "nvim-lualine/lualine.nvim"

  -- indentline
  use "lukas-reineke/indent-blankline.nvim"

  -- colorizer
  use "norcalli/nvim-colorizer.lua"

  -- treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- lsp
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
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
  }

  -- tab
  use "alvarosevilla95/luatab.nvim"

  -- term
  use {
    "akinsho/toggleterm.nvim", tag = '*',
    config = function()
      require("toggleterm").setup()
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

