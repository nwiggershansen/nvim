vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.inccommand = "split"

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true

vim.opt.wrap = true
-- vim.opt.linebreak = true
--
vim.g.mapleader = " "

vim.opt.updatetime = 50
vim.opt.termguicolors = true


-- Sets a screen-wide statusline, instead of per buffer
vim.opt.laststatus = 3

-- Hides the diagnostic event to the right of the issue
-- vim.diagnostic.config({ virtual_text = false, signs = true, float = { border = "single" }, })

-- Yank copies it to clipboard
vim.opt.clipboard:append('unnamedplus')

vim.cmd [[set mouse=a]]

-- c       Auto-wrap comments using textwidth, inserting the current comment
--         leader automatically.
-- r       Automatically insert the current comment leader after hitting
--         <Enter> in Insert mode.
-- o       Automatically insert the current comment leader after hitting 'o' or
--         'O' in Normal mode.

-- Have to use auto-command as it gets overwritten for every buffer if not
vim.api.nvim_create_autocmd("FileType", {
  callback = function() vim.opt_local.formatoptions:remove({ "o", "r", "c" }) end,
})
