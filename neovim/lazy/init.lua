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

-- Custom tabline function showing only filenames
function _G.custom_tabline()
  local s = ''
  for i = 1, vim.fn.tabpagenr('$') do
    -- Select the highlighting
    if i == vim.fn.tabpagenr() then
      s = s .. '%#TabLineSel#'
    else
      s = s .. '%#TabLine#'
    end
    -- Add the tab number
    s = s .. ' ' .. i .. ' '
    -- Get the filename only of the first window in the tab
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = buflist[winnr]
    local filename = vim.fn.fnamemodify(vim.fn.bufname(bufnr), ':t')
    -- Add the filename
    s = s .. (filename ~= '' and filename or '[No Name]') .. ' '
  end
  -- Fill the rest of the tabline with TabLineFill and reset tab page nr
  return s .. '%#TabLineFill#%T'
end
vim.o.tabline = '%!v:lua.custom_tabline()'

require("options")
require("keymaps")
require("lazy").setup("plugins", {
	defaults = { lazy = true },
	change_detection = { enabled = false },
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufNewFile" }, {
	pattern = ".env*",
	command = "set filetype=conf",
})

vim.cmd('colorscheme nordic')
-- vim.cmd('colorscheme material-darker')
-- vim.cmd('colorscheme nightfox')
--vim.cmd("colorscheme hybrid")
-- vim.cmd('colorscheme kanagawa-paper')
--vim.cmd('colorscheme github_dark_dimmed')
--vim.cmd('colorscheme rose-pine')
--vim.cmd("colorscheme catppuccin-macchiato")
--vim.cmd("colorscheme lunar")
--vim.cmd('colorscheme tokyonight-storm')

vim.g.tmux_navigator_disable_when_zoomed = 1
