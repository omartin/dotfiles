return {
  { 'williamboman/mason.nvim', build = ':MasonUpdate', opts = {} },
  { 'williamboman/mason-lspconfig.nvim' },
  {
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅙',
            [vim.diagnostic.severity.WARN]  = '',
            [vim.diagnostic.severity.HINT]  = '',
            [vim.diagnostic.severity.INFO]  = '»',
          },
        },
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'rounded', max_width = 80 })
          end, { buffer = event.buf })
        end,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

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
          'ts_ls',
        },
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({ capabilities = capabilities })
          end,
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
                  diagnostics = { globals = { 'vim' } },
                },
              },
            })
          end,
        },
      })
    end,

    keys = {
      { 'gd', '<cmd>Telescope lsp_definitions<cr>',           desc = '(LSP) Go to definition' },
      { 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',       desc = '(LSP) Go to declaration' },
      { 'gr', '<cmd>Telescope lsp_references<cr>',            desc = '(LSP) Go to references' },
      { 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>',     desc = '(LSP) Line diagnostics' },
      { '[d', '<cmd>lua vim.diagnostic.jump({count=-1})<cr>', desc = '(LSP) Previous diagnostic' },
      { ']d', '<cmd>lua vim.diagnostic.jump({count=1})<cr>',  desc = '(LSP) Next diagnostic' },
      { 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>',            desc = '(LSP) Rename' },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        window = {
          completion    = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<CR>']    = cmp.mapping.confirm({ select = true }),
          ['<Tab>']   = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            else fallback() end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            else fallback() end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }),
      })
    end,
  },
}
