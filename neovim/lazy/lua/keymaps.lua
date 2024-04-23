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

-- Buffers & Tabs
keymap("n", "<Leader><Leader>", "<c-^>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Leader><Tab>", ":tabnext<CR>", opts)
keymap("n", "<Leader><S-Tab>", ":tabprevious<CR>", opts)
keymap("n", "<Leader>x", ":bdelete<CR>", opts)

-- Comments
keymap("n", "<Leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("v", "<Leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", opts)


-- TERMINAL --
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", opts)
