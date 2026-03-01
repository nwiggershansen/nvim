return {
  {
    -- LSP installer
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        PATH = "prepend",
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })
    end,
  },
}
