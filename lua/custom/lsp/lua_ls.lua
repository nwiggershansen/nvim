local base_config = require("user.base_config")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local cmd
if vim.fn.has("win32") == 1 then
  cmd = vim.fs.joinpath(base_config.mason_packages, "lua-language-server/bin/lua-language-server.exe")
elseif vim.fn.has("unix") == 1 or vim.fn.has("mac") == 1 then
  cmd = vim.fs.joinpath(base_config.mason_packages, "bin/lua-language-server")
else
  return
end

vim.lsp.config("lua_ls", {
  cmd = { cmd },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  settings = {
    Lua = {
      hint = { enable = true },
      diagnostics = { globals = { "vim" } },
    },
  },
})
vim.lsp.enable("lua_ls")
