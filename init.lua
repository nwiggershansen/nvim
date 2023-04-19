require("set")
require("user.packer")

require('remap')
require("user.nvim-tree")
require("user.telescope")
require("user.mason")
require("user.omnisharp")
require("user.snippets")
require("user.barbar")

vim.opt.wildignore:append { '*.meta' }

vim.g.ale_linters = {
  cs = { "OmniSharp" },
  sh = { 'language_server' }
}

vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_stylle_warning = '·'

vim.g.airline_powerline_fonts = 1

vim.g.netrw_list_hide = '.*\\.meta$,.*\\.unity'
vim.opt.termguicolors = true
