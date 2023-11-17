local M = {}
M.ui = {
  theme = 'catppuccin',
  statusline = {
    theme = "default",
    separator_style = "block",
  },
  hl_override = {
    Visual = { bg = "#444444" },
  },
}
M.plugins = 'custom.plugins'
M.mappings = require 'custom.mappings'
return M
