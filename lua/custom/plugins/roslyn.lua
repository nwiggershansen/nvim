local capabilities = require("blink.cmp").get_lsp_capabilities({}, false)
local base_config = require("user.base_config")

return {
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "roslyn" then
            base_config.keymap(args.buf)
          end
        end,
      })

      require("roslyn").setup({
        filewatching = "roslyn",
        capabilities = capabilities,
        config = {
          ["csharp|background_analysis"] = {
            dotnet_analyzer_diagnostics_scope = "openFiles",
            dotnet_compiler_diagnostics_scope = "openFiles",
          },
        },
      })
    end,
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
