local nnoremap = require('keymap').nnoremap

local M = {}
local base_keymaps = function()
  nnoremap("gd", function() vim.lsp.buf.definition() end)
  nnoremap("<F2>", function() vim.lsp.buf.rename() end)
  nnoremap("[d", function() vim.diagnostic.goto_next() end)
  nnoremap("]d", function() vim.diagnostic.goto_prev() end)
  nnoremap("<C-m>", function() vim.lsp.buf.code_action() end)
  nnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)
  nnoremap('<C-k>', function() vim.lsp.buf.signature_help() end)
  nnoremap('<C-n>', function() vim.lsp.buf.references() end)
end

M.keymap = base_keymaps
M.mason_path = "C:/Users/Kaptajnen/AppData/Local/nvim-data/mason/packages/"

return M