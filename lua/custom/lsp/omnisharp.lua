local capabilities = require("blink.cmp").get_lsp_capabilities({}, false)
local base_config = require("user.base_config")
local mason_path = base_config.mason_path

vim.g.OmniSharp_highlight_groups = {
  EnumMemberName = "@property",
  NamespaceName = "Type",
  ControlKeyword = "markdownCode",
  LocalName = "@variable",
  FieldName = "@variable",
  ParameterName = "@variable.parameter",
  PropertyName = "@property",
  Identifier = "@property",
}

vim.g.OmniSharp_server_use_net6 = 1

local omnisharp_path = mason_path

if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  omnisharp_path = omnisharp_path .. "packages/omnisharp/omnisharp"
elseif vim.fn.has("win32") == 1 then
  omnisharp_path = omnisharp_path .. "omnisharp/OmniSharp.cmd"
else
  omnisharp_path = "omnisharp/omnisharp"
end

capabilities = vim.tbl_deep_extend("force", capabilities, {
  workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true,
    },
  },
})

require("lspconfig").omnisharp.setup({
  cmd = { omnisharp_path, "--languageserver" },
  organize_imports_on_format = true,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require("omnisharp_extended").handler,
  },
  on_attach = function(_, bufnr)
    local opts = { remap = false, silent = true, buffer = bufnr }
    base_config.keymap(bufnr)
    vim.keymap.set("n", "<C-f>", "<cmd>OmniSharpCodeFormat<CR>", opts)
    vim.keymap.set("n", "<leader>fm", "<cmd>OmniSharpCodeFormat<CR>", opts)
    vim.keymap.set("n", "<leader>sh", "<cmd>OmniSharpSignatureHelp<CR>", opts)
    vim.keymap.set("n", "<leader>fu", "<cmd>OmniSharpFindUsages<CR>", opts)
    vim.keymap.set("n", "gi", "<cmd>OmniSharpFindImplementations<CR>", opts)
    vim.keymap.set("n", "gd", "<cmd>OmniSharpGotoDefinition<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<cmd>OmniSharpRename<CR>", opts)
  end,
})
