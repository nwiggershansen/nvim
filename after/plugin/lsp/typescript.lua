local base_config = require('user.base_config')
local typescript = require('typescript')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local opts = { remap = false }

typescript.setup({
  capabilities = capabilities,
  server = {
    on_attach = function()
      base_config.keymap()
      vim.keymap.set('n', '<F2>', '<cmd>TypescriptRenameFile<CR>', opts)
    end
  }
})
