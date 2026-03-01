local capabilities = require("blink.cmp").get_lsp_capabilities({}, false)
local base_config = require("user.base_config")

return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      filewatching = "roslyn",
      capabilities = capabilities,
      config = {
        ["csharp|background_analysis"] = {
          dotnet_analyzer_diagnostics_scope = "openFiles",
          dotnet_compiler_diagnostics_scope = "openFiles",
        },
      },
      on_attach = function(_, bufnr)
        base_config.keymap(bufnr)
      end,
    },
  },

  {
    "khoido2003/roslyn-filewatch.nvim",
    dependencies = { "seblyng/roslyn.nvim" },
    ft = "cs",
    config = function()
      require("roslyn_filewatch").setup({
        client_names = { "roslyn" },
        preset = "auto",
        deferred_loading = true,
        ignore_dirs = { "Library", "Temp", "Obj", "Bin", ".git" },
        diagnostic_throttling = {
          enabled = true,
          debounce_ms = 500,
          visible_only = true,
        },
      })
    end,
  },
}
