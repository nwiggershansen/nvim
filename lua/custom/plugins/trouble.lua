return {
  {
    'folke/trouble.nvim',
    config = function()
      vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>")
      vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>")
      vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>")
      vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>")
      vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>")
    end,
  },
}
