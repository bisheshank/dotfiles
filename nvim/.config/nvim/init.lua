-- init.lua

-- Install packer if not installed
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Load plugins
require('plugins')

-- Load settings
require('settings')

-- Load keymaps
require('keymaps')

-- Load LSP configurations
require('lsp')

-- Load custom filetype definitions
require('filetype')

-- Load custom colors
require('colors')

-- Load plugin configurations
require('plugins.gitsigns')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.lualine')
require('plugins.toggleterm')
require('plugins.vimtex')
require('plugins.cmp')

if is_bootstrap then
  require('packer').sync()
end

