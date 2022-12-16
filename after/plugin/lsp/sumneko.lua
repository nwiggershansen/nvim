local base_config = require('user.base_config')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local sumneko_path = base_config.mason_path .. "lua-language-server/extension/server/bin/lua-language-server.exe"

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
