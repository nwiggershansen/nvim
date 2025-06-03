local base_config = require("user.base_config")
local capabilities = require("blink.cmp").get_lsp_capabilities()

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

local vue_typescript_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"

require("lspconfig").ts_ls.setup({
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  capabilities = capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_typescript_server_path,
        languages = { "vue" },
      },
    },
  },
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    javascript = inlay_hints,
    typescript = inlay_hints,
  },
})

require("lspconfig").volar.setup({})
