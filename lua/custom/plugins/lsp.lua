return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      inlay_hints = { enabled = true }
    },
    dependencies = {
      'b0o/schemastore.nvim',
      -- C# specific
      'OmniSharp/omnisharp-vim',
      'Hoffs/omnisharp-extended-lsp.nvim',
      'carlsmedstad/vim-bicep',
    },
    config = function()
      require "custom.lsp"
      require "custom.lsp.lua_ls"
      require "custom.lsp.lemminx"
      require "custom.lsp.omnisharp"
      require "custom.lsp.tsserver"
    end,
  },
}
