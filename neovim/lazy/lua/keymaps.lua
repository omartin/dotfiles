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

-- Misc
keymap("n", "<leader>e", ":Lex 30<cr>", opts)

-- Hide search highlight
keymap("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize +2<CR>", opts)
keymap("n", "<S-Down>", ":resize -2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Leader><Leader>", "<c-^>", opts)

-- Tabs
--keymap("n", "<Tab>", ":tabnext<CR>", opts)
--keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)

-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- TERMINAL --
keymap("t", "<Esc>", "<C-\\><C-n>", opts)
