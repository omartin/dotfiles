require "nvchad.options"

-- add yours here!

 local o = vim.o

-- general
o.completeopt = "menuone,noinsert,noselect" -- Autocomplete options
o.cursorlineopt = "both"
o.undofile = true                           -- Enable persistent undo

-- ui
o.showmatch = true        -- Highlight matching parenthesis
o.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
o.splitbelow = true       -- Horizontal split to the bottom
o.splitright = true       -- Vertical split to the right
o.splitright = true       -- Vertical split to the right
o.ignorecase = true       -- Ignore case letters when search
o.smartcase = true        -- Ignore lowercase for the whole pattern
o.linebreak = true        -- Wrap on word boundary
o.cmdheight = 0           -- Cmd line height
o.pumheight = 15          -- Pop up menu maximum height
o.cursorline = true       -- Highlight the current line
o.wrap = false            -- Display lines as one long line
o.scrolloff = 999
o.virtualedit = 'block'
o.inccommand = 'split'

-- tabs, indent
o.expandtab = true        -- Use spaces instead of tabs
o.shiftwidth = 2          -- Shift 2 spaces when tab
o.tabstop = 2             -- 1 tab == 2 spaces
o.smartindent = true      -- Autoindent new lines
