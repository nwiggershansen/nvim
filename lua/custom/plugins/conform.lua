return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          go = { "gofmt" },
          py = { "ruff" },
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
