local capabilities = require('cmp_nvim_lsp').default_capabilities()
local base_config = require('user.base_config')
local omnisharp_config = require("omnisharp_config")
local mason_path = base_config.mason_path
local omnisharp_path = mason_path .. "omnisharp/OmniSharp.exe"
local opts = { remap = false, silent = true }


capabilities = vim.tbl_deep_extend("force", capabilities, {
  workspace = {
    didChangeWatchedFiles = {
      dynamicRegistration = true
    }
  }
})

local omnisharp_cmd = { omnisharp_path }
table.insert(omnisharp_cmd, '--languageserver')

for _, v in pairs(omnisharp_config) do
  table.insert(omnisharp_cmd, v)
end

require('lspconfig').omnisharp.setup({
  cmd = omnisharp_cmd,
  capabilities = capabilities,
  handlers = {
    ["textDocument/definition"] = require('omnisharp_extended').handler
  },
  on_attach = function(client, _)
    base_config.keymap()
    vim.keymap.set('n', '<C-f>', '<cmd>OmniSharpCodeFormat<CR>', opts)
    vim.keymap.set('n', '<C-k>', '<cmd>OmniSharpSignatureHelp<CR>', opts)

    -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
    client.server_capabilities.semanticTokensProvider = {
      full = vim.empty_dict(),
      legend = {
        tokenModifiers = { "static_symbol" },
        tokenTypes = {
          "comment",
          "excluded_code",
          "identifier",
          "keyword",
          "keyword_control",
          "number",
          "operator",
          "operator_overloaded",
          "preprocessor_keyword",
          "string",
          "whitespace",
          "text",
          "static_symbol",
          "preprocessor_text",
          "punctuation",
          "string_verbatim",
          "string_escape_character",
          "class_name",
          "delegate_name",
          "enum_name",
          "interface_name",
          "module_name",
          "struct_name",
          "type_parameter_name",
          "field_name",
          "enum_member_name",
          "constant_name",
          "local_name",
          "parameter_name",
          "method_name",
          "extension_method_name",
          "property_name",
          "event_name",
          "namespace_name",
          "label_name",
          "xml_doc_comment_attribute_name",
          "xml_doc_comment_attribute_quotes",
          "xml_doc_comment_attribute_value",
          "xml_doc_comment_cdata_section",
          "xml_doc_comment_comment",
          "xml_doc_comment_delimiter",
          "xml_doc_comment_entity_reference",
          "xml_doc_comment_name",
          "xml_doc_comment_processing_instruction",
          "xml_doc_comment_text",
          "xml_literal_attribute_name",
          "xml_literal_attribute_quotes",
          "xml_literal_attribute_value",
          "xml_literal_cdata_section",
          "xml_literal_comment",
          "xml_literal_delimiter",
          "xml_literal_embedded_expression",
          "xml_literal_entity_reference",
          "xml_literal_name",
          "xml_literal_processing_instruction",
          "xml_literal_text",
          "regex_comment",
          "regex_character_class",
          "regex_anchor",
          "regex_quantifier",
          "regex_grouping",
          "regex_alternation",
          "regex_text",
          "regex_self_escaped_character",
          "regex_other_escape",
        },
      },
      range = true,
    }

--    local tokenModifiers = client.server_capabilities.semanticTokensProvider.legend.tokenModifiers
--    for i, v in ipairs(tokenModifiers) do
--      tokenModifiers[i] = v:gsub(' ', '_')
--    end
--    local tokenTypes = client.server_capabilities.semanticTokensProvider.legend.tokenTypes
--    for i, v in ipairs(tokenTypes) do
--      tokenTypes[i] = v:gsub(' ', '_')
--   end
  end
})
