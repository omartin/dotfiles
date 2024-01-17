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

    --require('lspconfig').lua_ls.setup({})
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
  end
}
