local M = {}

M.disabled = {
  n = {
      ["<C-n>"] = "",
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
  },
  t = {
      ["<A-i>"] = "",
      ["<A-h>"] = "",
      ["<A-v>"] = "",
  },
}

M.nvimtree = {
  n = {
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
  },
}

M.navigation = {
  n = {
     ["<C-h>"] = {"<cmd> NvimTmuxNavigateLeft <CR>", "Window left"},
     ["<C-j>"] = {"<cmd> NvimTmuxNavigateDown <CR>", "Window down"},
     ["<C-k>"] = {"<cmd> NvimTmuxNavigateUp <CR>", "Window up"},
     ["<C-l>"] = {"<cmd> NvimTmuxNavigateRight <CR>", "Window right"},
     ["<C-x>"] = {"<cmd> TroubleToggle <CR>", "Trouble"},
  },
  i = {
     ["<C-h>"] = {"<cmd> NvimTmuxNavigateLeft <CR>", "Window left"},
     ["<C-j>"] = {"<cmd> NvimTmuxNavigateDown <CR>", "Window down"},
     ["<C-k>"] = {"<cmd> NvimTmuxNavigateUp <CR>", "Window up"},
     ["<C-l>"] = {"<cmd> NvimTmuxNavigateRight <CR>", "Window right"},
  },
  t = {
     ["<Esc><Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
     ["<C-h>"] = {"<cmd> NvimTmuxNavigateLeft <CR>", "Window left"},
     ["<C-j>"] = {"<cmd> NvimTmuxNavigateDown <CR>", "Window down"},
     ["<C-k>"] = {"<cmd> NvimTmuxNavigateUp <CR>", "Window up"},
     ["<C-l>"] = {"<cmd> NvimTmuxNavigateRight <CR>", "Window right"},
  },
}

M.buffer = {
  n = {
     ["<Leader>-"] = {"<C-W>s", "Split horizontal"},
     ["<Leader>|"] = {"<C-W>v", "Split vertical"},
     ["<Leader><Leader>"] = {"<c-^>", "Previous buffer"},
     ["<Up>"] = {":horizontal resize +2<CR>", "Resize up"},
     ["<Down>"] = {":horizontal resize -2<CR>", "Resize down"},
     ["<Left>"] = {":vertical resize +2<CR>", "Resize left"},
     ["<Right>"] = {":vertical resize -2<CR>", "Resize right"},
  }
}

M.nvterm = {
  t = {
    ["<C-t>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term" },
    ["<leader>h"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal term" },
    ["<leader>v"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical term" },
  },
  n = {
    ["<C-t>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term" },
    ["<leader>h"] = { function() require("nvterm.terminal").toggle "horizontal" end, "Toggle horizontal term" },
    ["<leader>v"] = { function() require("nvterm.terminal").toggle "vertical" end, "Toggle vertical term" },
  },
}

M.lspconfig = {
  n = {
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
  },
}


return M
