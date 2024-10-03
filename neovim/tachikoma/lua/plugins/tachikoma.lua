return {
  -- { "ellisonleao/gruvbox.nvim" },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  {
    "projekt0n/github-nvim-theme",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_dimmed",
    },
  },
  {
    "nvimdev/dashboard-nvim",
    enabled = false,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        -- component_separators = { "|", "|" },
        -- section_separators = { "|", "|" },
        component_separators = { left = "\\", right = "/" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function()
      local blc = require("bufferline.constants")
      blc.sep_names["none"] = "none"
      blc.sep_chars["none"] = { "", "" }

      local bl = require("bufferline")
      local bg = "#22272E"
      local bg_visible = "#22272E"
      local bg_selected = "#2C3E56"
      local fg = "#3D77BE"
      local fg_visible = "#3D77BE"
      local fg_selected = "#539BF5"
      bl.setup({
        highlights = {
          background = { bg = bg, fg = fg },
          fill = { bg = bg, fg = fg },
          trunc_marker = { bg = bg, fg = fg },
          offset_separator = { bg = bg, fg = fg },

          buffer = { bg = bg, fg = fg },
          buffer_visible = { bg = bg_visible, fg = fg_visible },
          buffer_selected = { bg = bg_selected, fg = fg_selected },
          modified = { bg = bg, fg = fg },
          modified_visible = { bg = bg_visible, fg = fg_visible },
          modified_selected = { bg = bg_selected, fg = fg_selected },
          separator = { bg = bg, fg = fg },
          separator_visible = { bg = bg_visible, fg = fg_visible },
          separator_selected = { bg = bg_selected, fg = fg_selected },
          numbers = { bg = bg, fg = fg },
          numbers_visible = { bg = bg_visible, fg = fg_visible },
          numbers_selected = { bg = bg_selected, fg = fg_selected },
          close_button = { bg = bg, fg = fg },
          close_button_visible = { bg = bg_visible, fg = fg_visible },
          close_button_selected = { bg = bg_selected, fg = fg_selected },
          diagnostic = { bg = bg, fg = fg },
          diagnostic_visible = { bg = bg_visible, fg = fg_visible },
          diagnostic_selected = { bg = bg_selected, fg = fg_selected },

          indicator_visible = { bg = bg_visible, fg = fg_visible },
          indicator_selected = { bg = bg_selected, fg = fg_selected },

          group_separator = { bg = bg, fg = fg },
          group_label = { bg = bg, fg = fg },
          tab = { bg = bg, fg = fg },
          tab_selected = { bg = bg, fg = fg },
          tab_separator = { bg = bg, fg = fg },
          tab_separator_selected = { bg = bg, fg = fg },
          tab_close = { bg = bg, fg = fg },
          duplicate = { bg = bg, fg = fg },
          duplicate_visible = { bg = bg_visible, fg = fg_visible },
          duplicate_selected = { bg = bg_selected, fg = fg_selected },
        },
        options = {
          themable = true,
          separator_style = "none",
          indicator = { style = "none" },
          --numbers = "buffer_id",
          --show_buffer_icons = false,
          --show_buffer_close_icons = false,
          --show_close_icon = false,
          show_tab_indicators = false,
          --tab_size = 5,
        },
      })
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    opts = {
      close_if_last_window = true,
      buffers = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
      },
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = false,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        position = "left",
        mappings = {
          ["<tab>"] = function(state)
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end,
        },
      },
      source_selector = {
        winbar = false,
        statusline = true,
      },
    },
  },
}
