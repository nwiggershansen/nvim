require("set")
require("_packer")
require("remap")
require("csharp_remap")
require("_telescope")

vim.opt.wildignore:append { '*.meta' }

vim.g.ale_linters = {
    cs = { "OmniSharp" }
}

vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_stylle_warning = '·'

