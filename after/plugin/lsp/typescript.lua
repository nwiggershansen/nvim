local nnoremap = require('keymap').nnoremap
local base_config = require('user.base_config')
local typescript = require('typescript')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

typescript.setup({
  capabilities = capabilities,
  server = {
    on_attach = function()
      base_config.keymap()
      nnoremap('<F2>', '<cmd>TypescriptRenameFile<CR>')
    end
  }
})
