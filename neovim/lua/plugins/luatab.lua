return {
   "alvarosevilla95/luatab.nvim",
    config = function()
      vim.cmd([[
      hi TabLine cterm=none gui=none guifg=#555555
      hi TabLineSel cterm=bold gui=bold
      hi TabLineFill cterm=none gui=none
      ]])
    end,
}
