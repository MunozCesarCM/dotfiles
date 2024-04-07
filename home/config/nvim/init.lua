local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git', 'clone', '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', lazypath,
    }
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- Editor colorscheme
    {
        'Luxed/ayu-vim',
        priority = 1000,
        config = function()
            vim.g.ayucolor = 'dark'
            vim.g.ayu_italic_comment = 1
            vim.g.ayu_sign_contrast = 1
            vim.g.ayu_extended_palette = 1
            vim.cmd.colorscheme 'ayu'
        end
    },

    -- Set lualine as statusline
    { 'nvim-lualine/lualine.nvim',
        config = function() require('plugins.lualine') end },

    -- Automatically close ()[]{}
    { 'windwp/nvim-autopairs',
        dependencies = { 'hrsh7th/nvim-cmp' },
        config = function() require('plugins.autopairs') end },

    -- Automatically close tags
    { 'windwp/nvim-ts-autotag',
        config = function() require('nvim-ts-autotag').setup() end },

    -- Highlight, edit, and navigate code
    { 'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        build = ':TSUpdate',
        config = function() require('plugins.treesitter') end },

    -- Include surround motions
    { 'kylechui/nvim-surround',
        version = '*',
        event = 'VeryLazy',
        config = function() require('nvim-surround').setup() end },

    -- Add Git functionality
    { 'lewis6991/gitsigns.nvim',
        config = function() require('gitsigns').setup() end },

    -- Hotkey navigation
    { 'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        dependencies = { 'nvim-lua/plenary.nvim' } },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp',
        dependencies = { 'L3MON4D3/LuaSnip' } },

    -- File explorer
    { 'nvim-tree/nvim-tree.lua',
        config = function() require('plugins.nvimtree') end },

    -- Prettier
    { 'jose-elias-alvarez/null-ls.nvim' },
    { 'MunifTanjim/prettier.nvim',
        config = function() require('plugins.prettier') end },

    -- LSP Support
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x', lazy = true, config = false },
    { 'neovim/nvim-lspconfig',
        dependencies = { 'hrsh7th/cmp-nvim-lsp' } },

    -- Undo Tree
    { 'mbbill/undotree',
        config = function()
            vim.cmd [[
                let g:undotree_SplitWidth = 35
                let g:undotree_WindowLayout = 4
            ]]
        end
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'debugloop/telescope-undo.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    undo = {
                        saved_only = true,
                    }
                }
            })
            require('telescope').load_extension('undo')
        end,
    },
})

require('config.options')
require('config.keybinds')
require('config.autocommands')
require('config.lsp')

