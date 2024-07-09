-- init.lua

-- Install packer if not installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Load settings
require('settings')

-- Load keymaps
require('keymaps')

-- Load plugins
require('plugins')

-- Load LSP configurations
require('lsp')

-- Load custom filetype definitions
require('filetype')

-- Load plugin configurations
require('plugins.gitsigns')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.toggleterm')

if is_bootstrap then
  require('packer').sync()
end

