local status, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then
  return
end

nvim_treesitter.setup {
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'bash', 'dockerfile', 'lua', 'bicep' },
  highlight = {
    enable = true
  },
  sync_install = false,
}

local context_status, treesitter_context = pcall(require, 'treesitter-context')

if not context_status then
  return
end

treesitter_context.setup()

if vim.fn.has "win32" == 1 then
  require 'nvim-treesitter.install'.compilers = { "zig" }
end
