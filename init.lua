require("options")
require("user.packages")

require("keymaps")

require("ftdetect.filetypes")
require("statusline.colors").set_hl()
require("statusline")
require("user.autocmds")

vim.opt.wildignore:append({ "*.meta" })

vim.g.netrw_list_hide = ".*\\.meta$,.*\\.unity"
