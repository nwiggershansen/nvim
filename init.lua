require('set')
require('user.packer')

require('remap')
require('user.nvim-tree')
require('user.telescope')
require('user.mason')
require('user.omnisharp')
require('user.snippets')
require('user.barbar')
require('user.dap')

require('statusline.colors').set_hl()
require('statusline')

vim.opt.wildignore:append { '*.meta' }

vim.g.ale_linters = {
  cs = { 'OmniSharp' },
  sh = { 'language_server' }
}

vim.g.ale_sign_error = '•'
vim.g.ale_sign_warning = '•'
vim.g.ale_sign_info = '·'
vim.g.ale_sign_style_error = '·'
vim.g.ale_sign_style_warning = '·'

vim.opt.updatetime = 50

vim.g.netrw_list_hide = '.*\\.meta$,.*\\.unity'
vim.opt.termguicolors = true

vim.opt.wrap = true
vim.opt.linebreak = true

-- Sets a screen-wide statusline, instead of per buffer
vim.opt.laststatus = 3
