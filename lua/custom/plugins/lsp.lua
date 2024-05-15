return {
  {
    'neovim/nvim-lspconfig',
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
    end,
  },
}
