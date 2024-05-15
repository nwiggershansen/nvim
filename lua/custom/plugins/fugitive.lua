return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>zs", "<cmd>:Git<CR>", { desc = "Git Status" })
      vim.keymap.set("n", "<leader>za", "<cmd>:Git add .<CR>", { desc = "Git Add All" })
      vim.keymap.set("n", "<leader>zp", "<cmd>:Git push<CR>", { desc = "Git Push" })
    end
  }
}
