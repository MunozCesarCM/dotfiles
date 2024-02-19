-- [[ Options ]]
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
vim.o.updatetime = 100                     -- Cursorhold timout
vim.o.completeopt = 'menuone,preview,noselect' -- Set completeopt for a better completion experience
vim.o.termguicolors = true                 -- Enable true colors if the terminal supports it
vim.g.vim_json_conceal = 0;

-- [[ Auto commands ]]
vim.api.nvim_create_autocmd('BufWinEnter', {
  desc = 'Return cursor to where it was last time closing the file',
  pattern = '*',
  command = 'silent! normal! g`"zv',
})

vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace on file save',
  pattern = '*',
  command = 'silent %s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd('TermOpen', {
  desc = 'Hide line number when opening a terminal buffer',
  pattern = '*',
  command = ':setlocal nonumber norelativenumber',
})

vim.api.nvim_create_autocmd('TermClose', {
  desc = 'Auto close the terminal when killed',
  pattern = '*',
  command = 'bdelete! ',
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight text on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require('lazy').setup({

  -- Editor colorscheme
  {
    'Luxed/ayu-vim',
    priority = 1000,
    config = function()
      vim.g.ayucolor = "dark"
      vim.g.ayu_italic_comment = 1
      vim.g.ayu_sign_contrast = 1
      vim.g.ayu_extended_palette = 1
      vim.cmd.colorscheme 'ayu'
    end
  },

  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = false,
        theme = 'ayu',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  -- Automatically close ()[]{}
  {
    'windwp/nvim-autopairs',
    -- Optional dependency
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require("nvim-autopairs").setup {}
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      local cmp = require('cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
  },

  -- Automatically close tags
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- Undo Tree
  { 'mbbill/undotree' },

  -- Highlight, edit, and navigate code
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- Line indentation
  {
    "Yggdroot/indentLine",
    config = function()
        vim.g.indentLine_char = '│'
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "debugloop/telescope-undo.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          undo = {
            saved_only = true,
          }
        }
      })
      require("telescope").load_extension("undo")
    end,
  },

  -- Include surround motions
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end,
  },

  -- Add Git functionality
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup({
        numhl = true,
      })
    end,
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require("nvim-tree").setup({
        sort = { sorter = "case_sensitive" },
        view = {
          width = 40,
          side = "left",
          number = true,
          relativenumber = true,
        },
        renderer = {
          group_empty = true,
          icons = {
            glyphs = {
              default = "-",
              symlink = "S",
              bookmark = "B",
              modified = "M",
              folder = {
                arrow_closed = "",
                arrow_open = "",
                default = "=",
                open = "#",
                empty = "E",
                empty_open = "E",
                symlink = "S",
                symlink_open = "O",
              },
              git = {
                unstaged = "M",
                staged = "+",
                unmerged = "U",
                renamed = "R",
                untracked = "N",
                deleted = "R",
                ignored = "I",
              },
            },
          }
        },
        filters = { dotfiles = true },
        actions = {
          open_file = {
            quit_on_open = true,
          }
        }
      })
    end
  },

  -- Prettier
  { 'jose-elias-alvarez/null-ls.nvim' },
  {
    'MunifTanjim/prettier.nvim',
    config = function()
      local prettier = require("prettier")
      prettier.setup({
        bin = 'prettier', -- or `'prettierd'` (v0.23.3+)
        filetypes = {
          "css",
          "graphql",
          "html",
          "javascript",
          "javascriptreact",
          "json",
          "less",
          "markdown",
          "scss",
          "typescript",
          "typescriptreact",
          "yaml",
        },
        cli_options = {
          tab_width = 4,
        }
      })
    end,
  },

  -- LSP Support
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
    }
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      {'L3MON4D3/LuaSnip'}
    },
  },
})

-- [[ LSP & Autocompletion ]]
local lsp_zero = require 'lsp-zero'
lsp_zero.on_attach(function(_, bufnr)
  -- see :help lsp-zero-keybindings
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp'},
    {name = 'buffer'},
    {name = 'luasnip'},
  },
  window = {
    documentation = cmp.config.window.bordered(),
    completion = cmp.config.window.bordered({
        winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None'
    }),
   lsp_zero
 },
}

-- Function to check if a floating dialog exists and if not
-- then check for diagnostics under the cursor
function OpenDiagnosticIfNoFloat()
  for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
    if vim.api.nvim_win_get_config(winid).zindex then
      return
    end
  end
  -- THIS IS FOR BUILTIN LSP
  vim.diagnostic.open_float(0, {
    scope = "cursor",
    focusable = false,
    close_events = {
      "CursorMoved",
      "CursorMovedI",
      "BufHidden",
      "InsertCharPre",
      "WinLeave",
    },
  })
end

-- Show diagnostics under the cursor when holding position
vim.api.nvim_create_augroup("lsp_diagnostics_hold", { clear = true })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  command = "lua OpenDiagnosticIfNoFloat()",
  group = "lsp_diagnostics_hold",
})
vim.diagnostic.config({ virtual_text = false })

-- [[ Configure Treesitter ]]
require('nvim-treesitter.configs').setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "css", "html", "javascript", "json", "tsx", "typescript", "markdown_inline" },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
}

-- [[ Keymaps ]]
-- Map <Space> in normal and visual mode to do nothing silently
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', 'gg', 'gg0')                          -- Go to start of line
vim.keymap.set('n', '<leader>a', '<C-^>')                 -- Swap between two files
vim.keymap.set('n', '<leader>c', ':tabnew +term<CR>i')    -- Open terminal
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)      -- Rename item
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>')   -- Toggle tree
vim.keymap.set('n', '<leader>p', ':Prettier<CR>')         -- Apply Prettier
vim.keymap.set('v', '<C-y>', '"+y')                       -- Copy to the system clipboard)
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

vim.keymap.set('n', '<leader>/', function()
  telescope.current_buffer_fuzzy_find(require('telescope.themes')
  .get_dropdown {
    previewer = false,
    layout_config = {
      width = 0.6,
      height = 0.6,
    },
  })
end, { desc = 'Fuzzily search in current buffer' })

-- [[ vim.cmd Commands ]]
vim.cmd [[ let g:indentLine_setConceal = 0 ]]
vim.cmd [[
  let g:undotree_WindowLayout = 4
  let g:undotree_SplitWidth = 35
]]
