local capabilities = require('cmp_nvim_lsp').default_capabilities()
local base_config = require('user.base_config')
local util = require("lspconfig/util")

require('lspconfig').gopls.setup({
  on_attach    = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  cmd          = { "gopls" },
  filetypes    = {
    "go",
    "gomod",
    "gowork",
    "gotmpl"
  },
  root_dir     = util.root_pattern("go.work", "go.mod", ".git"),
  capabilities = capabilities,
})
