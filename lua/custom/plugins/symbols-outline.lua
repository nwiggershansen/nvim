return {
  {
    'simrat39/symbols-outline.nvim',
    config = function()
      local symbols_outline = require('symbols-outline')

      symbols_outline.setup()
      vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>')
    end,
  },
}
