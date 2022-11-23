local base_config = require('user.base_config')

local function config(_config, func)
  return vim.tbl_deep_extend("force", {
    on_attach = function()
      base_config.keymap()
      if (type(func) == 'function') then
        func()
      end
    end
  }, _config or {})
end

require('lspconfig').jsonls.setup(config({}, nil))

require('lspconfig').tailwindcss.setup(config({}, nil))

require('lspconfig').cssls.setup(config({}, nil))

require('lspconfig').html.setup(config({}, nil))

require('lspconfig').bashls.setup(config({}, nil))

require('symbols-outline').setup()

