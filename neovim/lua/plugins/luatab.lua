return {
   "alvarosevilla95/luatab.nvim",
    config = function()
      require("luatab").setup()
      vim.cmd([[
      hi TabLineSel cterm=bold gui=bold
      hi TabLineFill cterm=none gui=none
      ]])
    end,
}
