local status_ok, formatter = pcall(require, "formatter")
if not status_ok then
  print('formatter unavailable')
  return
end

formatter.setup({
  filetype = {
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    go = {
      -- Rustfmt
      function()
        return {
          exe = "gofmt",
          args = {},
          stdin = true
        }
      end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
  }
})

vim.cmd('nnoremap <silent> <Leader>= :Format<CR>')
