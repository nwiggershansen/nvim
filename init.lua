require("set")
require("remap")
require("user.packer")
require("user.telescope")
require("user.mason")
require("user.omnisharp")
require("diffview")
require('treesitter-context').setup()
require('symbols-outline').setup()
require("user.nvim-tree")

vim.opt.wildignore:append { '*.meta' }

vim.g.ale_linters = {
  cs = { "OmniSharp" }
}

vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_stylle_warning = '·'

vim.g.airline_powerline_fonts = 1

vim.g.netrw_list_hide = '.*\\.meta$,.*\\.unity'
vim.opt.termguicolors = true

