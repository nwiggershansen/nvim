return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    priority = 100,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require "custom.nvim-tree"
    end,
  },
}
