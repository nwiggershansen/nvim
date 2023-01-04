local status, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then
  return
end

nvim_treesitter.setup {
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'bash', 'dockerfile', 'lua' },
  highlight = {
    enable = true
  },
}
