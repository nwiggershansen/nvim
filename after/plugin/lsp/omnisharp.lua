local capabilities = require('cmp_nvim_lsp').default_capabilities()
local base_config = require('user.base_config')
local omnisharp_config = require("omnisharp_config")
local mason_path = base_config.mason_path
local omnisharp_path = mason_path .. "omnisharp/OmniSharp.exe"
local opts = { remap = false, silent = true }


capabilities = vim.tbl_deep_extend("force", capabilities, {
  workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true
    }
  }
})

local omnisharp_cmd = { omnisharp_path }
table.insert(omnisharp_cmd, '--languageserver')

for _, v in pairs(omnisharp_config) do
  table.insert(omnisharp_cmd, v)
end

require('lspconfig').omnisharp.setup({
  cmd = omnisharp_cmd,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler
  },
  on_attach = function(client, _)
    base_config.keymap()
    vim.keymap.set('n', '<C-f>', '<cmd>OmniSharpCodeFormat<CR>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>OmniSharpSignatureHelp<CR>', opts)

   if client.name == 'omnisharp' then
    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
    for i, v in ipairs(tokenModifiers) do
      tokenModifiers[i] = v:gsub(' ', '_')
    end
    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
    for i, v in ipairs(tokenTypes) do
      tokenTypes[i] = v:gsub(' ', '_')
    end
  end
end
})
