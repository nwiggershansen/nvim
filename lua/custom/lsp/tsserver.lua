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
require('lspconfig').lua_ls.setup({
  on_attach    = function()
    base_config.keymap()
  end,
  capabilities = capabilities,
  settings = {
    javascript = inlay_hints,
    typescript = inlay_hints
  }
})

