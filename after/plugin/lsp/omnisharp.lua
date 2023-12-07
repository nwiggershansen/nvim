local capabilities = require('cmp_nvim_lsp').default_capabilities()
local base_config = require('user.base_config')
local omnisharp_config = require("omnisharp_config")
local mason_path = base_config.mason_path
local opts = { remap = false, silent = true }

local omnisharp_path = mason_path

if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  omnisharp_path = omnisharp_path .. "packages/omnisharp/omnisharp"
elseif vim.fn.has "win32" == 1 then
  omnisharp_path = omnisharp_path .. "omnisharp/OmniSharp.cmd"
else
  omnisharp_path = "omnisharp/omnisharp"
end


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
  on_attach = function(_, _)
    base_config.keymap()
    vim.keymap.set('n', '<C-f>', '<cmd>OmniSharpCodeFormat<CR>', opts)
    vim.keymap.set('n', '<leader>fm', '<cmd>OmniSharpCodeFormat<CR>', opts)
    vim.keymap.set('n', '<leader>sh', '<cmd>OmniSharpSignatureHelp<CR>', opts)
    vim.keymap.set('n', '<leader>gi', '<cmd>OmniSharpFindImplementations<CR>', opts)
    vim.keymap.set('n', '<leader>fu', '<cmd>OmniSharpFindUsages<CR>', opts)
  end
})
