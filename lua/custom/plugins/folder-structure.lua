return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 100,
    dependencies = {
      "echasnovski/mini.icons",
    },
    config = function()
      require("custom.nvim-tree")
    end,
  },
}
