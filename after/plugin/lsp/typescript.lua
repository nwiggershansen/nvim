local nnoremap = require('keymap').nnoremap
local base_config = require('user.base_config')
local typescript = require('typescript')

typescript.setup({
  server = {
    on_attach = function()
      base_config.keymap()
      nnoremap('<F2>', '<cmd>TypescriptRenameFile<CR>')
    end
  }
})
