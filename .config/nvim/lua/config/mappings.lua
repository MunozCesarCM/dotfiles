local map = vim.keymap.set
local options = { silent = true }

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
map('n', '<leader>tw', ':set wrap!<CR>', options)

-- Select next in built in code completion
map('i', '<Tab>', '<C-n>');

-- Select previous in built in code completion
map('i', '<S-Tab>', '<C-p>');

-- Rename variable in buffer
map('n', '<leader>r', ':lua vim.lsp.buf.rename()<CR>', options)

-- Hide highlight after search
map('n', '<ESC>', ':noh<CR>', options)

-----------------------------------------------------------
-- Built in spell-checker shortcuts
-----------------------------------------------------------

-- Use built in spell checker
map('n', '<leader>ts', ':set spell!<cr>', options)

-- Move between misspelled words
map('n', '<leader>sn', ']S')
map('n', '<leader>sp', '[S')
map('n', '<leader>ss', 'z=')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Open a terminal
-- map('n', '<leader>c', ':call ToggleTerm()<CR>', { noremap = true })
map('n', '<leader>c', ':FloatermToggle --autoclose=2<CR>', { noremap = true })

-- Telescope shortcuts
map('n', '<leader>f', ':Telescope find_files<cr>')
map('n', '<leader>g', ':Telescope live_grep<cr>')

-- Undodir toggle
map('n', '<leader>u', ':UndotreeToggle<cr>', options)
