local M = {}

local base_keymaps = function(bufnr)
  local opts = { remap = false, buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "[e", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, opts)
  vim.keymap.set("n", "]e", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, opts)
  vim.keymap.set("n", "[w", function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARNING })
  end, opts)
  vim.keymap.set("n", "]w", function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARNING })
  end, opts)
  vim.keymap.set("n", "<C-f>", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, opts)
  vim.keymap.set("n", "<leader>fm", function()
    require("conform").format({ async = true, lsp_format = "fallback" })
  end, opts)
  vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<C-n>", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<C-m>", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

M.keymap = base_keymaps

local home = os.getenv("HOME")

if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  M.mason_path = home .. "/.local/share/nvim/mason/"
elseif vim.fn.has("win32") == 1 then
  if home ~= nil then
    M.mason_path = home:gsub("\\", "/") .. "/AppData/Local/nvim-data/mason/packages/"
  else
    M.mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
  end
else
  M.mason_path = vim.fn.stdpath("data") .. "/mason/packages/"
end

return M
