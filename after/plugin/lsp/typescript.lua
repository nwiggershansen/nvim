local base_config = require('user.base_config')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').tsserver.setup({
  capabilities = capabilities,
  server = {
    on_attach = function()
      base_config.keymap()
    end
  }
})
