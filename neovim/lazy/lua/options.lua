-- Inspired from https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/core/options.lua
-- Neovim options
local opt = vim.opt         -- Set options (global/buffer/windows-scoped)

-- General
opt.mouse = 'a'                               -- Enable mouse support
opt.clipboard = "unnamedplus"                 -- Access to system clipboard
opt.swapfile = false                          -- Don't create swapfile
opt.completeopt = 'menuone,noinsert,noselect' -- Autocomplete options
opt.undofile = true                           -- Enable persistent undo
opt.shortmess:append "sI"                     -- Hide default message
opt.fillchars:append { eob = ' ' }

-- Neovim UI
opt.number = true           -- Show line number
opt.showmatch = true        -- Highlight matching parenthesis
opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
opt.splitbelow = true       -- Horizontal split to the bottom
opt.splitright = true       -- Vertical split to the right
opt.ignorecase = true       -- Ignore case letters when search
opt.smartcase = true        -- Ignore lowercase for the whole pattern
opt.linebreak = true        -- Wrap on word boundary
opt.termguicolors = true    -- Enable 24-bit RGB colors
opt.laststatus=3            -- Set global statusline
opt.cmdheight = 0           -- Cmd line height
opt.pumheight = 15          -- Pop up menu maximum height
opt.cursorline = true       -- Highlight the current line
opt.wrap = false            -- Display lines as one long line
opt.signcolumn = 'yes'      -- Always show the sign column to avoid flickering
opt.scrolloff = 999
opt.virtualedit = 'block'
opt.conceallevel = 0
--opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
--opt.showmode = false      -- Hide current edition mode ex. -- INSERT
--opt.showtabline = 2       -- Always show tabs
--opt.scrolloff = 8         -- lines of context
--opt.sidescrolloff = 8

-- Tabs, indent
opt.expandtab = true        -- Use spaces instead of tabs
opt.shiftwidth = 2          -- Shift 2 spaces when tab
opt.tabstop = 2             -- 1 tab == 2 spaces
opt.smartindent = true      -- Autoindent new lines

-- Memory, CPU
opt.lazyredraw = true       -- Faster scrolling
opt.synmaxcol = 240         -- Max column for syntax highlight
opt.updatetime = 250        -- ms to wait for trigger an event
opt.timeoutlen = 800        -- ms to wait for a mapped sequence to complete
