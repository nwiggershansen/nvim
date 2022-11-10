require("set")
require("_packer")
require("remap")
require("_telescope")
require("_mason")

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
