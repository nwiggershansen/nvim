local base_config = require("user.base_config")
local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local lspconfig = require("lspconfig")

if not status then
  return
end

local capabilities = cmp_nvim_lsp.default_capabilities()
local bicep_command = base_config.mason_path .. "bin/bicep-lsp"

local servers = { "tailwindcss", "cssls", "html", "bashls", "dockerls" }

local function config(_config, func)
  return vim.tbl_deep_extend("force", {
    on_attach = function(_, bufnr)
      base_config.keymap(bufnr)
      if type(func) == "function" then
        func()
      end
    end,
  }, _config or {})
end

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(config({ capabilities = capabilities }, nil))
end

lspconfig.jsonls.setup(config({
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
}, nil))

lspconfig.yamlls.setup(config({
  capabilities = capabilities,
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
        -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
      -- schemas = {
      --   ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "*azure-pipelines*.yml",
      --   ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      -- },
    },
  },
}, nil))

lspconfig.bicep.setup(config({ cmd = { bicep_command }, capabilities = capabilities }, nil))

lspconfig.rust_analyzer.setup(config({
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
    },
  },
}))
