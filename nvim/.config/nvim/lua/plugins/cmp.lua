-- Create a global variable to store the toggle state
_G.cmp_enabled = true

-- Function to toggle nvim-cmp on and off
function ToggleCmp()
  if _G.cmp_enabled then
    -- Disable nvim-cmp
    require('cmp').setup.buffer { enabled = false }
    print("Autocomplete OFF")
  else
    -- Enable nvim-cmp
    require('cmp').setup.buffer { enabled = true }
    print("Autocomplete ON")
  end
  _G.cmp_enabled = not _G.cmp_enabled
end

-- Keybinding to toggle autocomplete
vim.api.nvim_set_keymap('n', '<leader>tc', ':lua ToggleCmp()<CR>', { noremap = true, silent = true })

-- Setup nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup {
  enabled = function()
    return _G.cmp_enabled -- Check the toggle state before enabling
  end,
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
  })
}

