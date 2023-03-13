return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      { 'williamboman/mason.nvim' }, -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-buffer' }, -- Optional
      { 'hrsh7th/cmp-path' }, -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' }, -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' }, -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    },

    config =
    function()
      local lsp = require('lsp-zero').preset({
        name = 'recommended',
        set_lsp_keymaps = false,
        manage_nvim_cmp = true,
        suggest_lsp_servers = true,
      })

      -- (Optional) Configure lua language server for neovim
      lsp.nvim_workspace()

      lsp.setup()
    end,

    keys = {
      { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Signature" },
      { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to definition" },
      { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to declaration" },
      { "gr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "Go to references" },
      { "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", desc = "Line diagnostics" },
      { "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Next diagnostics" },
      { "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Previous diagnostics" },
    },
  },
}
