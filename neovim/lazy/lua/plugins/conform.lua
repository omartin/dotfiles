return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  keys = {
    { '<Leader>lf', function()
      require('conform').format({ async = true, lsp_fallback = true })
    end, desc = '(LSP) Format document' },
  },
  opts = {
    formatters_by_ft = {
      typescript = { 'prettier' },
      typescriptreact = { 'prettier' },
      javascript = { 'prettier' },
      javascriptreact = { 'prettier' },
      json = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
    },
  },
}
