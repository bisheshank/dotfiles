-- lua/plugins/toggleterm.lua

require("toggleterm").setup({
  open_mapping=[[<leader>;]],
  direction='float',
  float_opts = { border = 'single' },
})
