require("set")
require("_packer")
require("remap")
require("_telescope")
require("_mason")
require("diffview")

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

vim.g.OmniSharp_highlight_groups = {
  EnumMemberName = 'EnumMemberField',
  Operator = "OperatorPunctuation",
  Keyword = "CsKeyword"
}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

require('nvim-tree').setup({
  filters = {
    custom = { ".meta$" }
  }
})

