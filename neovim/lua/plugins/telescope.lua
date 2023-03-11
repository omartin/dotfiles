return {
  "nvim-telescope/telescope.nvim",

  opts = {
    defaults = {
      prompt_prefix = "  ",
      selection_caret = "❯ ",
      path_display = { "smart" },
      sorting_strategy = "ascending",
    },
    mappings = {
      i = {
        ["<c-t>"] = function(...)
          return require("trouble.providers.telescope").open_with_trouble(...)
        end,
      },
    },
    pickers = {
      colorscheme = { enable_preview = true },
    },
  },

  keys = {
    { "<leader>f", "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>", desc = "Find files" },
    { "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Live grep files" },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>sd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
  },
}
