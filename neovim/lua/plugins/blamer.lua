return {
  { 
    "APZelos/blamer.nvim",
    config = function()
      vim.cmd [[
      let g:blamer_enabled = 1
      let g:blamer_show_in_insert_modes = 0
      let g:blamer_show_in_visual_modes = 0
      let g:blamer_prefix = '    ■ '
      ]]
    end,
  }
}
