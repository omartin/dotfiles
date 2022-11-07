local status_ok, luatab = pcall(require, "luatab")
if not status_ok then
  print("luatab unavailable")
  return
end

luatab.setup {
}

vim.cmd('hi TabLine cterm=none gui=none guifg=#555555')
vim.cmd('hi TabLineSel cterm=bold gui=bold')
vim.cmd('hi TabLineFill cterm=none gui=none')
