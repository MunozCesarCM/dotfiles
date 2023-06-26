-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Start setup
lazy.setup({
  spec = {
    -- Colorscheme:
    -- The colorscheme should be available when starting Neovim.
    {
      'Luxed/ayu-vim',
      priority = 1000 -- Ensure it loads first
    },

    -- Telescope
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },

    -- Language Support
    {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'}, -- Required
      }
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      config = function ()
        require('nvim-treesitter.configs').setup {
          indent = { enable = true }
        }
      end
    },

    -- Autopair
    {
      'windwp/nvim-autopairs',
      event = 'InsertEnter',
      config = function()
        require('nvim-autopairs').setup{}
      end
    },

    -- Statusline
    { 'nvim-lualine/lualine.nvim' },

    -- Undo Tree
    { 'mbbill/undotree' },

    -- Floating Terminal
    { 'voldikss/vim-floaterm' },

    -- Blank Line Indentaion
    { "lukas-reineke/indent-blankline.nvim" },
  }
})
