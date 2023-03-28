local map = vim.keymap.set

-- Change leader to the space
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Move between wrapped lines
map({'n', 'v'}, 'j', 'gj')
map({'n', 'v'}, 'k', 'gk')

-- Quickly navigate a line
map({'n', 'v'}, 'L', '$')
map({'n', 'v'}, 'H', '0^')

-- Swap with an alternate file
map('n', '<leader>a', '<c-^>')

-- Indent file while preserving cursor location
map('n', '<leader>=', "m'gg=G`'zz")

-- Toggle Wrap
map('n', '<leader>tw', ':set wrap!<CR>')

-----------------------------------------------------------
-- Built in spell-checker shortcuts
-----------------------------------------------------------

-- Use built in spell checker
map('n', 'tw', ':set wrap!<cr>', { silent = true })
map('n', 'ts', ':set spell!<cr>', { silent = true })

-- Move between misspelled words
map('n', '<leader>sn', ']S')
map('n', '<leader>sN', '[S')
map('n', '<leader>ss', 'z=')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Open a terminal
map('n', '<leader>c', ':call ToggleTerm()<CR>', { noremap = true })

-- Telescope shortcuts
map('n', '<leader>f', ':Telescope find_files<cr>')
map('n', '<leader>g', ':Telescope live_grep<cr>')

local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion
map("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- GoTo code navigation
map("n", "gd", "<Plug>(coc-definition)", {silent = true})

-- Symbol renaming
map("n", "<leader>r", "<Plug>(coc-rename)", {silent = true})
