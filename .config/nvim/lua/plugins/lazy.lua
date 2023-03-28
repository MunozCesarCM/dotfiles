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
      "olimorris/onedarkpro.nvim",
      priority = 1000 -- Ensure it loads first
    },

    -- Telescope
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup{}
      end
    },

    -- Treesitter
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

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

    -- COC Completion
    { 'neoclide/coc.nvim', branch = 'release' },
  }
})
