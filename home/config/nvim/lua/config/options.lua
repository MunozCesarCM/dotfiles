-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set default tab sizes
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true

-- General options
vim.o.cursorline = true                    -- Highlight the current line
vim.o.colorcolumn = "80"                   -- Draw a line at column 80
vim.o.scrolloff = 10                       -- Scroll offset before reaching the end of the screen
vim.o.hlsearch = false                     -- Turn off highlighting while searching
vim.wo.number = true                       -- Display line numbers
vim.o.relativenumber = true                -- Use relative line numbers
vim.o.mouse = 'a'                          -- Enable mouse mode
vim.o.breakindent = true                   -- Enable break indent
vim.o.undofile = true                      -- Save undo history
vim.o.ignorecase = true                    -- Case-insensitive searching unless \C or capital in search
vim.o.smartcase = true                     -- Smart case sensitivity in searching
vim.o.wrap = false                         -- Wrap lines longer than window width
vim.wo.signcolumn = 'auto'                 -- Keep sign column
vim.o.updatetime = 100                     -- Cursorhold timeout
vim.o.termguicolors = true                 -- Enable true colors if the terminal supports it
vim.opt.swapfile = false                   -- Disable swapfiles
vim.o.completeopt = 'menuone,preview,noselect'  -- Set completeopt for a better completion experience

