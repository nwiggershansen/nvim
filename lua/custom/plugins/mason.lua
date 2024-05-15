return {
  {
    -- LSP installer
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        PATH = "prepend"
      })
    end,
  },
}
