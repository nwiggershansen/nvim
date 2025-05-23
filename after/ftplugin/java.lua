local base_config = require("user.base_config")

local config = {
  cmd = { base_config.mason_path .. "bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
  on_attach = function(_, bufnr)
    base_config.keymap(bufnr)
  end,
}
require("jdtls").start_or_attach(config)
