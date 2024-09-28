local capabilities = require('cmp_nvim_lsp').default_capabilities()
local base_config = require('user.base_config')
local util = require("lspconfig/util")

local cmd = ""

if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  cmd = "gopls"
elseif vim.fn.has "win32" == 1 then
  local mason_path = base_config.mason_path
  cmd = mason_path .. "gopls/gopls.exe"
else
  cmd = "gopls"
end

require('lspconfig').gopls.setup({
  on_attach    = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  cmd          = { cmd },
  filetypes    = {
    "go",
    "gomod",
    "gowork",
    "gotmpl"
  },
  root_dir     = util.root_pattern("go.work", "go.mod", ".git"),
  capabilities = capabilities,
})
