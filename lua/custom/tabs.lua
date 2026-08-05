require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        highlight = "Directory",
        separator = true,
      },
    },
  },
})

vim.keymap.set("n", "<A-,>", "<cmd>BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", "<cmd>BufferNext<CR>")
vim.keymap.set("n", "<A-<>", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set("n", "<A->>", "<cmd>BufferMoveNext<CR>")
vim.keymap.set("n", "<A-w>", "<cmd>BufferClose<CR>")
