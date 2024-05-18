require("tokyonight").setup({
  styles = {
    keywords = { italic = false },
    comments = { italic = false }
  }
})

vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_transparent = true

vim.cmd.colorscheme("tokyonight")

vim.cmd([[ highlight NvimTreeGitFileDirtyHL guifg=#E0AF68 ]])
vim.cmd([[ highlight NvimTreeGitFileRenamedHL guifg=#E0AF68 ]])
vim.cmd([[ highlight NvimTreeGitFileNewHL guifg=#77C960 ]])
vim.cmd([[ highlight NvimTreeGitFileDeletedHL guifg=#F7768E ]])
vim.cmd([[ highlight NvimTreeGitFileIgnoredHL guifg=#565F89 ]])
