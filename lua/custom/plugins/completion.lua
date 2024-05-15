return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      'onsails/lspkind.nvim',
      { 'L3MON4D3/LuaSnip', dependencies = { "rafamadriz/friendly-snippets" } },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      require("custom.completion")
      require('custom.snippets')
      require('custom.snippets.unity')
    end,
  },
}
