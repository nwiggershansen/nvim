return {
  {
    'hedyhli/outline.nvim',
    config = function()
      require('outline').setup()
      vim.keymap.set('n', '<leader>so', '<cmd>Outline<CR>')
    end,
  },
}
