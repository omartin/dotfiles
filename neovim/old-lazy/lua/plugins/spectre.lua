return {
  {
    "windwp/nvim-spectre",
    keys = {
      { "<leader>S", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
    },
  },
}
