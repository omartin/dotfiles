-- Shorten function name
local function keymap (mode, lhs, rhs, desc)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>")
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
keymap("n", "<C-h>", "<C-w>h", 'Left')
keymap("n", "<C-j>", "<C-w>j", 'Down')
keymap("n", "<C-k>", "<C-w>k", 'Up')
keymap("n", "<C-l>", "<C-w>l", 'Right')
keymap("n", "<Leader>-", "<C-W>s", 'Split vertical')
keymap("n", "<Leader>|", "<C-W>v", 'Split horizontal')
keymap("n", "<Up>", ":horizontal resize +2<CR>", 'Resize horizontal +')
keymap("n", "<Down>", ":horizontal resize -2<CR>", 'Resize horizontal -')
keymap("n", "<Left>", ":vertical resize +2<CR>", 'Resize vertical +')
keymap("n", "<Right>", ":vertical resize -2<CR>", 'Resize vertical -')

-- Hide search highlight
keymap("n", "<Esc><Esc>", "<Esc>:nohlsearch<CR><Esc>", 'Hide highlight')

-- Buffers & Tabs
keymap("n", "<S-h>", ":bprevious<CR>", 'Previous buffer')
keymap("n", "<S-l>", ":bnext<CR>", 'Next buffer')
keymap("n", "<Leader><Leader>", "<c-^>", 'Previous buffer')
keymap("n", "<Leader><Tab>", ":tabnew<CR>", 'New tab')
keymap("n", "<Tab>", ":tabnext<CR>", 'Next tab')
keymap("n", "<S-Tab>", ":tabprevious<CR>", 'Previous tab')
keymap("n", "<Leader>x", ":bdelete<CR>", 'Delete buffer')

-- Comments
keymap("n", "<Leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", 'Comment')
keymap("v", "<Leader>/", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>", 'Comment')

-- TERMINAL --
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", 'Echap')
