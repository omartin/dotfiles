require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- nvimtree
map("n", "<Leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "nvimtree toggle" })

-- tmux navigation
map("n", "<C-h>", "<cmd> NvimTmuxNavigateLeft <CR>", { desc = "Switch Window left" })
map("n", "<C-j>", "<cmd> NvimTmuxNavigateDown <CR>", { desc = "Switch Window down" })
map("n", "<C-k>", "<cmd> NvimTmuxNavigateUp <CR>", { desc = "Switch Window up" })
map("n", "<C-l>", "<cmd> NvimTmuxNavigateRight <CR>", { desc = "Switch Window right" })

-- buffef
map("n", "<Leader>-", "<C-W>s", { desc = "Buffer Split horizontal" })
map("n", "<Leader>|", "<C-W>v", { desc =  "Buffer Split vertical" })
map("n", "<Leader><Leader>", "<c-^>", { desc =  "Buffer Previous buffer" })
map("n", "<Up>", ":horizontal resize +2<CR>", { desc =  "Buffer Resize up" })
map("n", "<Down>", ":horizontal resize -2<CR>", { desc =  "Buffer Resize down" })
map("n", "<Left>", ":vertical resize +2<CR>", { desc =  "Buffer Resize left" })
map("n", "<Right>", ":vertical resize -2<CR>", { desc =  "Buffer Resize right" })

-- terminal
map({ "n", "t" }, "<C-t>", function() require("nvchad.term").toggle { pos = "float", id = "floatTerm", float_opts = { width = 0.8, height = 0.9, col = 0.1, row = 0.01 } } end, { desc = "Terminal Toggle floating term" })

-- lsp
map("n", "gl", function() vim.diagnostic.open_float { border = "rounded" } end, { desc = "Floating diagnostic" })

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
