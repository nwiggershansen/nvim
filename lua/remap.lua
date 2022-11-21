local builtin = require('telescope.builtin')
local keymap = require('keymap')
local nnoremap = keymap.nnoremap
local inoremap = keymap.inoremap
local xnoremap = keymap.xnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-p>", builtin.find_files)
nnoremap('<leader>ff', builtin.find_files)
nnoremap('<leader>fg', builtin.live_grep)
nnoremap('<leader>fb', builtin.buffers)
nnoremap('<leader>fh', builtin.help_tags)

nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

inoremap('{', '{}<Esc>ha')
inoremap('[', '[]<Esc>ha')
inoremap('(', '()<Esc>ha')
inoremap('"', '""<Esc>ha')
inoremap('\'', '\'\'<Esc>ha')
inoremap('`', '``<Esc>ha')

nnoremap('<S-Tab>', '<<')

xnoremap("<leader>p", "\"_dP")

-- Deletes everything between quotes and goes directly into insert mode
nnoremap('di\"', 'di\"i')
nnoremap('di\'', 'di\'i')

-- Closes current file & nvim-tree
nnoremap('qq', '<cmd>q<CR><cmd>q<CR>')

-- Navigate between splits
nnoremap('<C-h>', '<C-W>h')
nnoremap('<C-l>', '<C-W>l')
