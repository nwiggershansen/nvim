local base_config = require('user.base_config')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local sumneko_path = base_config.mason_path
if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  sumneko_path = sumneko_path .. "bin/lua-language-server"
elseif vim.fn.has "win32" == 1 then
  sumneko_path = sumneko_path .. "lua-language-server/extension/server/bin/lua-language-server.exe"
else
  return
end

require('lspconfig').sumneko_lua.setup({
  on_attach    = function()
    base_config.keymap()
  end,
  cmd          = { sumneko_path },
  capabilities = capabilities,
  settings     = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
