local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
  print('lsp-zero unavailable')
  return
end

lsp.preset('recommended')
lsp.setup()
