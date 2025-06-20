local base_config = require("user.base_config")
local capabilities = require("blink.cmp").get_lsp_capabilities()
local lemminx_path = base_config.mason_path

if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  lemminx_path = lemminx_path .. "bin/lemminx"
elseif vim.fn.has("win32") == 1 then
  lemminx_path = lemminx_path .. "lemminx/lemminx-win32.exe"
else
  lemminx_path = "lemminx/lemminx"
end

require("lspconfig").lemminx.setup({
  cmd = { lemminx_path },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
})
