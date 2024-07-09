-- lua/keymaps.lua

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Buffer navigation
vim.keymap.set('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>p', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', ':bdelete<CR>', { noremap = true, silent = true })

-- Easier vertical split with next buffer to the right
vim.keymap.set('n', '<leader>vsp', ':vsp | wincmd l | bnext<CR>', { noremap = true, silent = true })

-- Easier horizontal split with next buffer below
vim.keymap.set('n', '<leader>hsp', ':sp | wincmd j | bnext<CR>', { noremap = true, silent = true })

-- Easier navigation between splits
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
vim.keymap.set('n', '<C-n>', '<C-w>w', { noremap = true, silent = true })

-- Neo-tree
vim.keymap.set('n', 'J', '<Cmd>Neotree toggle<CR>')

-- Resource init.lua
vim.keymap.set('n', '<leader>so', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

