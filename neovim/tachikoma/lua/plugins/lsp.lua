return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- This turns off hints by default, but they're still available
      -- by hitting SPC u h
      inlay_hints = { enabled = false },
    },
  },
}
