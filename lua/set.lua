vim.opt.nu = true
vim.opt.relativenumber = true

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
