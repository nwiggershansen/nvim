local base_config = require('user.base_config')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local inlay_hints = {
  inlayHints = {
    includeInlayEnumMemberValueHints = true,
    includeInlayFunctionLikeReturnTypeHints = true,
    includeInlayFunctionParameterTypeHints = true,
    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
    includeInlayPropertyDeclarationTypeHints = true,
    includeInlayVariableTypeHints = false,
  },
}
require('lspconfig').tsserver.setup({
  on_attach    = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  capabilities = capabilities,
  settings = {
    javascript = inlay_hints,
    typescript = inlay_hints
  }
})

