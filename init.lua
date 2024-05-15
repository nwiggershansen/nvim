require('settings')
require('user.packages')

require('remap')

require('ftdetect.filetypes')
require('statusline.colors').set_hl()
require('statusline')

vim.opt.wildignore:append { '*.meta' }

vim.g.netrw_list_hide = '.*\\.meta$,.*\\.unity'

