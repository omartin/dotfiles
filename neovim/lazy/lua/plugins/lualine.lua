return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",

    opts = function()

      local diagnostics = {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = " ", warn = " " },
        colored = false,
        update_in_insert = false,
        always_visible = true,
      }
      local branch = {
        "branch",
        icons_enabled = true,
        icon = "",
      }

      return {
        options = {
          icons_enabled = true,
          --theme = theme(),
          section_separators = '',
          component_separators = '',
          disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
          always_divide_middle = true,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { branch, diagnostics },
          lualine_c = { { "filename", path = 1 } },
          lualine_x = {},
          lualine_y = { "progress" },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_z = {},
        },
        tabline = {},
        extensions = {},
      }
    end,
  },
}
