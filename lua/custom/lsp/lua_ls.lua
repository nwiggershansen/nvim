local base_config = require("user.base_config")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lua_bin_path = base_config.mason_path
if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  lua_bin_path = lua_bin_path .. "bin/lua-language-server"
elseif vim.fn.has("win32") == 1 then
  lua_bin_path = lua_bin_path .. "lua-language-server/bin/lua-language-server.exe"
else
  return
end

require("lspconfig").lua_ls.setup({
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  cmd = { lua_bin_path },
  capabilities = capabilities,
  settings = {
    Lua = {
      hint = { enable = true },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
