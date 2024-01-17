return {
  'VonHeikemen/lsp-zero.nvim', 
  branch = 'v3.x',
  event = 'VeryLazy',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
  },

  config = function()
    local lsp = require('lsp-zero')
    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    lsp.set_sign_icons({
      error = '󰅙',
      warn = '',
      hint = '⚑',
      info = '»'
    })

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        'eslint',
        'lua_ls',
        'html',
        'rust_analyzer',
        'terraformls',
        'tsserver'
      },
      handlers = { lsp.default_setup },
    })
  end,

  keys = {
    { 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', desc = '(LSP) Go to definition' },
    { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = '(LSP) Go to declaration' },
    { 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', desc = '(LSP) Go to references' },
    { 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', desc = '(LSP) Line diagnostics' },
    { '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', desc = '(LSP) Next diagnostics' },
    { ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', desc = '(LSP) Previous diagnostics' },
  },
}
