local M = {}

local base_keymaps = function(bufnr)
  local opts = { remap = false, buffer = bufnr }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('n', '[e', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set('n', ']e', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR }) end, opts)
  vim.keymap.set('n', '[w', function() vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING }) end, opts)
  vim.keymap.set('n', ']w', function() vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING }) end, opts)
  vim.keymap.set('n', '<C-m>', function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set('n', '<C-f>', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', '<leader>fm', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', '<leader>sh', function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<C-n>', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', 'gi', function() vim.lsp.buf.go_to_implementation() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
end

M.keymap = base_keymaps

local home = os.getenv "HOME"

if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  M.mason_path = home .. "/.local/share/nvim/mason/"
elseif vim.fn.has "win32" == 1 then
  if home ~= nil then
    M.mason_path = home:gsub("\\", "/") .. "/AppData/Local/nvim-data/mason/packages/"
  else
    M.mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
  end
else
  M.mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
end

return M
