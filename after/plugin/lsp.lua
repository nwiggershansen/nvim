local nnoremap = require('keymap').nnoremap
local mason_path = "C:/Users/Kaptajnen/AppData/Local/nvim-data/mason/packages/"
local sumneko_path = mason_path .. "lua-language-server/extension/server/bin/lua-language-server.exe"

local typescript = require('typescript')

local base_attach = function()
  nnoremap("gd", function() vim.lsp.buf.definition() end)
  nnoremap("<F2>", function() vim.lsp.buf.rename() end)
  nnoremap("[d", function() vim.diagnostic.goto_next() end)
  nnoremap("]d", function() vim.diagnostic.goto_prev() end)
  nnoremap("<C-m>", function() vim.lsp.buf.code_action() end)
  nnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)
  nnoremap('<C-k>', function() vim.lsp.buf.signature_help() end)
  nnoremap('<C-n>', function() vim.lsp.buf.references() end)
end

local function config(_config, func)
  return vim.tbl_deep_extend("force", {
    on_attach = function()
      base_attach()
      if (type(func) == 'function') then
        func()
      end
    end
  }, _config or {})
end

require('lspconfig').sumneko_lua.setup(config({
  cmd = { sumneko_path },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
}, nil))

require('lspconfig').jsonls.setup(config({}, nil))

require('lspconfig').tailwindcss.setup(config({}, nil))

require('lspconfig').cssls.setup(config({}, nil))

require('lspconfig').html.setup(config({}, nil))

require('lspconfig').bashls.setup(config({}, nil))

require('symbols-outline').setup()

typescript.setup({
  server = {
    on_attach = function()
      base_attach()
      nnoremap('<F2>', '<cmd>TypescriptRenameFile<CR>')
    end
  }
})
