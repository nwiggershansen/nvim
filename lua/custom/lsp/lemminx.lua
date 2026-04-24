local base_config = require("user.base_config")
local capabilities = require("blink.cmp").get_lsp_capabilities()

local cmd
if vim.fn.has("win32") == 1 then
  cmd = vim.fs.joinpath(base_config.mason_packages, "lemminx/lemminx-win32.exe")
else
  cmd = vim.fs.joinpath(base_config.mason_packages, "bin/lemminx")
end

vim.lsp.config("lemminx", {
  cmd = { cmd },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
})
vim.lsp.enable("lemminx")
