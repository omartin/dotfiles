local lsp_format_status_ok, lsp_format = pcall(require, "lsp-format")
if not lsp_format_status_ok then
  print('lsp-format unavailable')
	return
end

lsp_format.setup({
  order = {
    "tsserver",
    "eslint",
  }
})

