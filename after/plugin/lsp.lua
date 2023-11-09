local base_config = require('user.base_config')
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')

if not status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local bicep_command = base_config.mason_path .. "bin/bicep-lsp"

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

require('lspconfig').jsonls.setup(config({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  }
}, nil))

require('lspconfig').tailwindcss.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').cssls.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').html.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').bashls.setup(config({ capabilities = capabilities }, nil))

require('lspconfig').yamlls.setup(config({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "*azure-pipelines*.yml",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
      }
    }
  }
}, nil))

require('lspconfig').bicep.setup(config({ cmd = { bicep_command }, capabilities = capabilities }, nil))

require('symbols-outline').setup()
