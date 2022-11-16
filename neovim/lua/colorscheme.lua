local colorscheme = "nightfox" -- nightfox ferrum alduin base16-atelier-savanna base16-default-dark nord tomorrow, iceberg, hybrid, sierra
-- aurora.vim darkplus.vim onedarker.vim spacedark.vim system76.vim tomorrow.vim gruvbox-baby

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd [[
autocmd BufEnter * hi Normal guibg=#181818
autocmd BufEnter * hi LineNr guibg=#181818
autocmd BufEnter * hi SignColumn guibg=#181818

autocmd BufEnter * hi TabLine guibg=#181818
autocmd BufEnter * hi TabLineSel guifg=#FFFFFF guibg=#181818
autocmd BufEnter * hi TabLineFill guibg=#181818

autocmd BufEnter * hi Pmenu guibg=#181818
autocmd BufEnter * hi FloatBorder guibg=#181818

autocmd BufEnter * hi VertSplit guifg=#242424 guibg=#242424
autocmd BufEnter * hi NvimTreeNormal guibg=#242424

autocmd BufEnter * hi WhichKeyFloat guibg=#181818

]]

--[[
vim.cmd [[
autocmd BufEnter * hi TabLine guibg=#181818
autocmd BufEnter * hi TabLineSel guifg=#FFFFFF guibg=#181818
autocmd BufEnter * hi TabLineFill guibg=#181818
autocmd BufEnter * hi Normal guibg=#181818
autocmd BufEnter * hi LineNr guibg=#181818
autocmd BufEnter * hi SignColumn guibg=#181818
autocmd BufEnter * hi Pmenu guibg=#181818
autocmd BufEnter * hi PmenuThumb guibg=#181818
]]
--]]
