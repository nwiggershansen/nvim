local base_config = require("user.base_config")
local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

lspconfig.pyright.setup({
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
  capabilities = capabilities,
  on_new_config = function(config, root_dir)
    local match = vim.fn.glob(root_dir .. "/poetry.lock")
    if match ~= "" then
      local poetry_venv = vim.fn.trim(vim.fn.system("poetry env info -p 2>/dev/null"))
      vim.env.VIRTUAL_ENV = poetry_venv
      config.settings.python.pythonPath = poetry_venv .. "/bin/python"
    end
  end,
})
