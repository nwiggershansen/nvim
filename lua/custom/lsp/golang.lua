local capabilities = require("blink.cmp").get_lsp_capabilities()
local base_config = require("user.base_config")

local cmd
if vim.fn.has("win32") == 1 then
  cmd = base_config.mason_path .. "gopls/gopls.exe"
else
  cmd = "gopls"
end

vim.lsp.config("gopls", {
  cmd = { cmd },
  capabilities = capabilities,
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
})
vim.lsp.enable("gopls")
