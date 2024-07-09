-- lua/plugins/lualine.lua

-- Function to get word count
local function getWords()
  if vim.fn.mode()=="v" or vim.fn.mode=="V" or vim.fn.mode()=="\x16" then
    return vim.fn.wordcount().visual_words .. " words"
  else
    return vim.fn.wordcount().words .. " words"
  end
end

require('lualine').setup {
  options = {
    icons_enabled = false,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {getWords, 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

