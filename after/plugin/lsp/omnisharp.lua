local nnoremap = require('keymap').nnoremap
local base_config = require('user.base_config')
local omnisharp_config = require("omnisharp_config")
local mason_path = base_config.mason_path
local omnisharp_path = mason_path .. "omnisharp/OmniSharp.exe"

local omnisharp_cmd = { omnisharp_path }
table.insert(omnisharp_cmd, '--languageserver')

for _, v in pairs(omnisharp_config) do
  table.insert(omnisharp_cmd, v)
end

require('lspconfig').omnisharp.setup({
  cmd = omnisharp_cmd,
  on_attach = function()
    base_config.keymap()
    nnoremap("<C-f>", '<cmd>OmniSharpCodeFormat<CR>', { silent = true })
    nnoremap('<C-k>', '<cmd>OmniSharpSignatureHelp<CR>', { silent = true })
  end
})