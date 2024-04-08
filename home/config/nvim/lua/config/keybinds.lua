-- Map <Space> in normal and visual mode to do nothing silently
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'gg', 'gg0')                                                    -- Go to start of line
vim.keymap.set('n', '<leader>c', ':tabnew +term<CR>i')        -- Open terminal
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)            -- Rename item
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')     -- Toggle tree
vim.keymap.set('n', '<leader>p', ':Prettier<CR>')                 -- Apply Prettier
vim.keymap.set('n', '<leader>a', '<C-^>')                                 -- Swap between two files
vim.keymap.set('v', '<C-y>', '"+y')                                             -- Copy to the system clipboard)
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>5<C-w>l') -- Open UndoTree

local telescope = require('telescope.builtin')
local telescope_config = {
    layout_config = {
        preview_width = 0.6,
        width = 0.8,
        height = 0.8,
        prompt_position = "top",
    },
    file_ignore_patterns = {
        "node_modules",
        "dist",
    },
}

vim.keymap.set('n', '<leader>f', function()
    telescope.find_files( telescope_config )
end, {})
vim.keymap.set('n', '<leader>g', function()
    telescope.live_grep( telescope_config )
end, {})
vim.keymap.set('n', '<leader>h', function()
    telescope.help_tags( telescope_config )
end, {})

-- Harpoon Keybinds
local harpoon = require("harpoon")
harpoon:setup()

vim.keymap.set("n", "<leader>A", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end)

