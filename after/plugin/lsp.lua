local base_config = require('user.base_config')
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local function config(_config, func)
  return vim.tbl_deep_extend("force", {
    on_attach = function()
      base_config.keymap()
      if (type(func) == 'function') then
        func()
      end
    end
  }, _config or {})
end

require('lspconfig').jsonls.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').tailwindcss.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').cssls.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').html.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').bashls.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').yamlls.setup(config({ capabilities = capabilities }, nil))

require('symbols-outline').setup()
