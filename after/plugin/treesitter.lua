require'nvim-treesitter.configs'.setup {
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'bash', 'dockerfile', 'lua' },
  highlight = {
    enable = true,
  },
}
