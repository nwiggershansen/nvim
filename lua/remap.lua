local builtin = require('telescope.builtin')
local nnoremap = require("keymap").nnoremap
local inoremap = require("keymap").inoremap
local EXPR_NOERR = {expr = true, silent = true, nowait = true }

nnoremap("<leader>pv", "<cmd>Ex<CR>")
nnoremap("<C-p>", builtin.find_files)
nnoremap('<leader>ff', builtin.find_files)
nnoremap('<leader>fg', builtin.live_grep)
nnoremap('<leader>fb', builtin.buffers)
nnoremap('<leader>fh', builtin.help_tags)

nnoremap("<C-u>", "<C-u>zz")
nnoremap("<C-d>", "<C-d>zz")

inoremap('<CR>', 'pumvisible() ?  coc#_select_confirm() : "<CR>"', EXPR_NOERR)

nnoremap('<S-Tab>', '<<')

