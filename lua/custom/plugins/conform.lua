return {
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          javascript = { { "prettierd", "prettier" } },
          typescript = { { "prettierd", "prettier" } },
          go = { "gofmt" },
        },
      })
    end,
  },
}
