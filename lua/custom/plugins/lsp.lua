return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
    },
    dependencies = {
      "Saghen/blink.cmp",
      "b0o/schemastore.nvim",
      -- C# specific
      "OmniSharp/omnisharp-vim",
      "Hoffs/omnisharp-extended-lsp.nvim",
      "carlsmedstad/vim-bicep",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      require("custom.lsp")
      require("custom.lsp.lua_ls")
      require("custom.lsp.lemminx")
      require("custom.lsp.omnisharp")
      require("custom.lsp.tsserver")
      require("custom.lsp.golang")
      require("custom.lsp.python")
    end,
  },
}
