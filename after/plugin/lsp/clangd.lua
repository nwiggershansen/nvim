local base_config = require('user.base_config')
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not status then
  return
end

local clang_path = base_config.mason_path
local capabilities = cmp_nvim_lsp.default_capabilities()


if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  clang_path = clang_path .. "packages/clangd/clangd_16.0.2"
elseif vim.fn.has "win32" == 1 then
  clang_path = clang_path .. "clangd/clangd_16.0.2/bin/clangd.exe"
else
  clang_path = "omnisharp/omnisharp"
end

require('lspconfig').clangd.setup({
  cmd = { clang_path },
  on_attach = function(client, _)
    base_config.keymap()
    client.server_capabilities.signatureHelpProvider = false
  end,
  capabilities = capabilities,
})
