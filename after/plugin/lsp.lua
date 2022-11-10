local nnoremap = require('keymap').nnoremap

local mason_path = "C:/Users/Kaptajnen/AppData/Local/nvim-data/mason/packages/"
local omnisharp_path = mason_path .. "omnisharp/Omnisharp.exe"
local sumneko_path = mason_path .. "lua-language-server/extension/server/bin/lua-language-server.exe"

local base_attach = function()
    nnoremap("gd", function() vim.lsp.buf.definition() end)
    nnoremap("<F2>", function() vim.lsp.buf.rename() end)
    nnoremap("[d", function() vim.diagnostic.goto_next() end)
    nnoremap("]d", function() vim.diagnostic.goto_prev() end)
    nnoremap("<C-m>", function() vim.lsp.buf.code_action() end)
    nnoremap("<C-f>", function() vim.lsp.buf.format { async = true } end)
end

local function config(_config, func)
    return vim.tbl_deep_extend("force", {
        on_attach = function()
            base_attach()
            if(type(func) == 'function') then
                func()
            end
        end
    }, _config or {})
end

require('lspconfig').omnisharp.setup(config({
        cmd = { omnisharp_path }
}, function()
    nnoremap("<C-f>", ':OmniSharpCodeFormat<CR>')
end))

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