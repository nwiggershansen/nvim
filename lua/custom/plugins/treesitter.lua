return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
    opts = {
      ensure_installed = {
        "bash",
        "diff",
        "html",
        "lua",
        "luadoc",
        "markdown",
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
      },
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          local MAX_FILE_SIZE = 100 * 1024
          local buf_name = vim.api.nvim_buf_get_name(bufnr)
          local file_size = vim.api.nvim_call_function("getfsize", { buf_name })

          return file_size > MAX_FILE_SIZE or vim.api.nvim_buf_line_count(bufnr) > 50000
        end,
      },
      sync_install = false,
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      if vim.fn.has("win32") == 1 then
        require("nvim-treesitter.install").compilers = { "zig" }
      end
    end,
  },
}
