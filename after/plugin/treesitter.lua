local status, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')

if not status then
  return
end

local MAX_FILE_SIZE = 100 * 1024

nvim_treesitter.setup {
  ensure_installed = { 'javascript', 'typescript', 'tsx', 'bash', 'dockerfile', 'lua', 'bicep' },
  highlight = {
    enable = true,
    disable = function(_, bufnr)
      local buf_name = vim.api.nvim_buf_get_name(bufnr)
      local file_size = vim.api.nvim_call_function("getfsize", { buf_name })

      return file_size > MAX_FILE_SIZE or vim.api.nvim_buf_line_count(bufnr) > 50000
    end
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
