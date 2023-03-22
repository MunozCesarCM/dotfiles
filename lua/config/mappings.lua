local map = vim.keymap.set

map({'n', 'v'}, 'j', 'gj')
map({'n', 'v'}, 'k', 'gk')

map('n', 'tw', ':set wrap!<cr>', { silent = true })
map('n', 'ts', ':set spell!<cr>', { silent = true })

map('n', '<leader>sn', ']S')
map('n', '<leader>sN', '[S')
map('n', '<leader>ss', 'z=')

map({'n', 'v'}, 'L', '$')
map({'n', 'v'}, 'H', '0^')

-- map('n', '<leader>w', ':w<cr>')
