local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  print('toggleterm unavailable')
  return
end

toggleterm.setup {
  size = 20,
  open_mapping = [[<c-t>]],
  direction = 'float',
  float_opts = {
    border = 'curved'
  }
}
