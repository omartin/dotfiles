return {
  { 'williamboman/mason.nvim', build = ':MasonUpdate', opts = {} },
  { 'neovim/nvim-lspconfig' },
  {
    'williamboman/mason-lspconfig.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
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
        float = { border = 'rounded' },
      })

      vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Line diagnostics' })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          vim.keymap.set('n', 'K', function()
            vim.lsp.buf.hover({ border = 'rounded', max_width = 80 })
          end, { buffer = event.buf })
          vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>',
            { buffer = event.buf, desc = '(LSP) Go to definition' })
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration,
            { buffer = event.buf, desc = '(LSP) Go to declaration' })
        end,
      })

      vim.lsp.config('*', {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      })

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            diagnostics = { globals = { 'vim' } },
          },
        },
      })

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
      })
    end,
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
