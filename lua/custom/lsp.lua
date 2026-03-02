local base_config = require("user.base_config")
local capabilities = require("blink.cmp").get_lsp_capabilities()
local bicep_command = base_config.mason_path .. "bin/bicep-lsp"

local function make_config(cfg)
  return vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = function(_, bufnr)
      base_config.keymap(bufnr)
    end,
  }, cfg or {})
end

-- Simple servers with no extra config
for _, lsp in ipairs({ "tailwindcss", "cssls", "html", "bashls", "dockerls" }) do
  vim.lsp.config(lsp, make_config({}))
  vim.lsp.enable(lsp)
end

vim.lsp.config(
  "jsonls",
  make_config({
    settings = {
      json = {
        schemas = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  })
)
vim.lsp.enable("jsonls")

vim.lsp.config(
  "yamlls",
  make_config({
    settings = {
      yaml = {
        schemaStore = {
          enable = false,
          url = "",
        },
        schemas = require("schemastore").yaml.schemas(),
      },
    },
  })
)
vim.lsp.enable("yamlls")

vim.lsp.config(
  "bicep",
  make_config({
    cmd = { bicep_command },
  })
)
vim.lsp.enable("bicep")

vim.lsp.config(
  "rust_analyzer",
  make_config({
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allFeatures = true,
        },
      },
    },
  })
)
vim.lsp.enable("rust_analyzer")
