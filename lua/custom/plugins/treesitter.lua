local parsers = {
  "bash",
  "diff",
  "html",
  "lua",
  "luadoc",
  "markdown",
  "markdown_inline",
  "vim",
  "vimdoc",
  "bicep",
  "dockerfile",
  "typescript",
  "javascript",
  "tsx",
  "go",
  "c_sharp",
  "rust",
  "python",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup()
      treesitter.install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local path = vim.api.nvim_buf_get_name(args.buf)
          local stat = path ~= "" and vim.uv.fs_stat(path)

          if (stat and stat.size > 100 * 1024) or vim.api.nvim_buf_line_count(args.buf) > 50000 then
            return
          end

          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
