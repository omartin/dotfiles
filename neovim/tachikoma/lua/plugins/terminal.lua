return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      size = 90,
      shading_factor = 2,
      direction = "vertical",
      start_in_insert = true,
    },
  },
  {
    "ryanmsnyder/toggleterm-manager.nvim",
    dependencies = {
      "akinsho/nvim-toggleterm.lua",
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- only needed because it's a dependency of telescope
    },
  },
}
