local nnoremap = require('keymap').nnoremap

local function config(_config)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
          nnoremap("gd", function() vim.lsp.buf.definition() end)
          nnoremap("<F2>", function() vim.lsp.buf.rename() end)
          nnoremap("[d", function() vim.diagnostic.goto_next() end)
          nnoremap("]d", function() vim.diagnostic.goto_prev() end) 
          nnoremap("<C-m>", function() vim.lsp.buf.code_action() end)
          nnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)
        end
    }, _config or {})
end

require('lspconfig').omnisharp.setup(config({
        cmd = { "C:/Users/Kaptajnen/AppData/Local/omnisharp-vim/omnisharp-roslyn/Omnisharp.exe" }
}))
