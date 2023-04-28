-- run :help option-list
-- or  :help E355
-- for a list of all options

vim.opt.number = true          -- Show the line number if front of each line
vim.opt.relativenumber = true  -- Show the relative number on each line
vim.opt.laststatus = 3         -- Only the last window will have a status line
vim.opt.tabstop = 2            -- Number of spaces that a tab uses
vim.opt.softtabstop = 2        -- Number of spaces that a tab uses while editing
vim.opt.shiftwidth = 2         -- Number of spaces to use for the autoindent
vim.opt.expandtab = true       -- Use spaces when a tab is inserted
vim.opt.colorcolumn = '80'    -- Column to hightlight
vim.opt.cursorline = true      -- Highlight the line where the cursor is placed
vim.opt.swapfile = false       -- Don't use a swapfile for a buffer
vim.opt.wrap = true            -- Wrap text on overflow
vim.opt.scrolloff = 10         -- Minimum number of lines above and below the cursor
vim.opt.ignorecase = true      -- Case insensitive search patterns
vim.opt.smartcase = true       -- Don't ignore case when the pattern has uppercase
vim.opt.lazyredraw = true      -- Don't redraw while executing macros
vim.opt.lazyredraw = true      -- Don't redraw while executing macros
vim.opt.wrap = false           -- Don't wrap lines when opening vim
vim.opt.splitbelow = true      -- Open new window below current one
vim.opt.splitright = true      -- Open new window to the right of current one
vim.opt.termguicolors = true   -- Enables true colors support
vim.opt.undofile = true        -- Save undo history to a file
vim.opt.undodir = vim.fn.expand('~/config/.nvim/undodir')
vim.cmd('colorscheme ayu')     -- Set the colorscheme
