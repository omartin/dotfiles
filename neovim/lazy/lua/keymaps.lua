local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
-- Splits
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<Leader>-", "<C-W>s", opts)
keymap("n", "<Leader>|", "<C-W>v", opts)
keymap("n", "<Up>", ":horizontal resize +2<CR>", opts)
keymap("n", "<Down>", ":horizontal resize -2<CR>", opts)
keymap("n", "<Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<Right>", ":vertical resize -2<CR>", opts)

-- Hide search highlight
keymap("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", opts)

-- Navigate buffers
keymap("n", "<Leader><Leader>", "<c-^>", opts)

-- Tabs
--keymap("n", "<Tab>", ":tabnext<CR>", opts)
--keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)

-- TERMINAL --
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- FROM NVCHAD
--["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },
--["<C-x>"] = {"<cmd> TroubleToggle <CR>", "Trouble"},
--["<Leader><Tab>"] = {"<cmd> tabnext <CR>", "Next Tab"},
--["<Leader><S-Tab>"] = {"<cmd> tabprevious <CR>", "Previous Tab"},
--["T"] = {"<cmd> tabnew <CR>", "New Tab"},
--["<Esc><Esc>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "Escape terminal mode" },
--["<C-t>"] = { function() require("nvterm.terminal").toggle "float" end, "Toggle floating term" },
