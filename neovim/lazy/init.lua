-- Lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require 'options'
require 'keymaps'
require('lazy').setup('plugins', {
  defaults = { lazy = true },
  change_detection = { enabled = false },
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufNewFile' }, {
  pattern = '.env*',
  command = 'set filetype=conf',
})

-- vim.cmd('colorscheme hybrid')
vim.cmd('colorscheme nightfox')

vim.g.tmux_navigator_disable_when_zoomed = 1
