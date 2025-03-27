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
    -- LSP
    local lsp = require('lsp-zero')
    lsp.on_attach(function(_, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)
    lsp.set_sign_icons({
      error = '󰅙',
      warn = '',
      hint = '',
      info = '»',
    })
    lsp.configure('lua_ls', {
      cmd = { 'lua-language-server' },
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
            path = vim.split(package.path, ';'),
          },
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    -- MASON
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = {
        'cssls',
        'docker_compose_language_service',
        'dockerls',
        --'eslint',
        'lua_ls',
        'html',
        'rust_analyzer',
        'terraformls',
        'ts_ls'
      },
      handlers = { lsp.default_setup },
    })

    -- CMP
    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.luasnip_supertab(),
        ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
      })
    })

  end,

  keys = {
    { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = '(LSP) Go to definition' },
    { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', desc = '(LSP) Go to declaration' },
    { 'gr', '<cmd>Telescope lsp_references<cr>', desc = '(LSP) Go to references' },
    { 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', desc = '(LSP) Line diagnostics' },
    { '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', desc = '(LSP) Next diagnostics' },
    { ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', desc = '(LSP) Previous diagnostics' },
    { 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', desc = '(LSP) Rename' },
    { '<Leader>lf', '<cmd>lua vim.lsp.buf.format()<cr>', desc = '(LSP) Format document' },
  },
}
