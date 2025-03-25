return {
  {
    "Saghen/blink.cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      { "L3MON4D3/LuaSnip", dependencies = { "rafamadriz/friendly-snippets" } },
    },
    config = function()
      require("custom.completion")
      require("custom.snippets")
      require("custom.snippets.unity")
    end,
  },
}
