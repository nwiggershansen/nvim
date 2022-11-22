vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true

vim.g.airline_theme = "deus"

vim.cmd("colorscheme tokyonight-storm")

vim.cmd([[ highlight NvimTreeGitDirty guifg=#E0AF68 ]])
-- vim.cmd([[ highlight NvimTreeGitStaged guifg=#FFFFFF ]])
-- vim.cmd([[ highlight NvimTreeGitMerge guifg=#FFFFFF ]])
vim.cmd([[ highlight NvimTreeGitRenamed guifg=#E0AF68 ]])
vim.cmd([[ highlight NvimTreeGitNew guifg=#77C960 ]])
vim.cmd([[ highlight NvimTreeGitDeleted guifg=#F7768E ]])
vim.cmd([[ highlight NvimTreeGitIgnored guifg=#565F89 ]])
