-- lua/plugins/vimtex.lua

-- Check the operating system and set the PDF viewer accordingly
local is_mac = vim.fn.has("macunix") == 1
local is_linux = vim.fn.has("linux") == 1

if is_linux then
  vim.api.nvim_set_var("vimtex_view_method", "zathura")
elseif is_mac then
  vim.api.nvim_set_var("vimtex_view_method", "sioyek")
end

-- Common Vimtex settings
vim.api.nvim_set_var("tex_flavor", "latex")
vim.api.nvim_set_var("vimtex_quickfix_mode", 0)
vim.api.nvim_set_var("vimtex_syntax_enabled", 0)

