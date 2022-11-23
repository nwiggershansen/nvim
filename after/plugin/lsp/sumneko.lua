local base_config = require('user.base_config')
local sumneko_path = base_config.mason_path .. "lua-language-server/extension/server/bin/lua-language-server.exe"

require('lspconfig').sumneko_lua.setup({
  on_attach = function()
    base_config.keymap()
  end,
  cmd = { sumneko_path },
  settings  = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})
