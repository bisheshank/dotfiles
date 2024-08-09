-- lua/plugins.lua

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP Configuration & Plugins
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'j-hui/fidget.nvim',
      'folke/neodev.nvim',
    },
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- UI enhancements
  use 'navarasu/onedark.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'numToStr/Comment.nvim'
  use 'tpope/vim-sleuth'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
    cond = vim.fn.executable('make') == 1
  }

  -- Additional themes
  use 'rebelot/kanagawa.nvim'
  use 'zefei/cake16'
  use 'NLKNguyen/papercolor-theme'
  use 'mswift42/vim-themes'

  -- Copilot
  use 'github/copilot.vim'

  -- LaTeX support
  use 'lervag/vimtex'

  -- Neo-tree
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  }

  -- Toggle terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end}

  -- Racket support
  use 'benknoble/vim-racket'

  -- Surround 
  use 'tpope/vim-surround'

  -- Custom plugins from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end
end)

