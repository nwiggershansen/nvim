local builtin = require('telescope.builtin')
local nnoremap = require("keymap").nnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-p>", builtin.find_files)

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

