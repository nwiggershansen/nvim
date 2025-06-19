return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { "prettierd", "prettier", stop_after_first = true },
          typescript = { "prettierd", "prettier", stop_after_first = true },
          go = { "gofmt" },
          python = { "ruff" },
        },
        format_on_save = {
          lsp_fallback = true, -- Enables fallback to `vim.lsp.buf.format` if no formatter is available
          filter = function(_)
            local filetype = vim.bo.filetype
            return filetype ~= "json"
          end,
        },
      })
    end,
  },
}
