return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-context',
    },
    lazy = false,
    config = function()
      require("custom.treesitter")
    end,
  },
}
