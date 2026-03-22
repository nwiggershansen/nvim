return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    priority = 100,
    dependencies = {
      "nvim-mini/mini.icons",
    },
    config = function()
      require("custom.nvim-tree")
    end,
  },
}
