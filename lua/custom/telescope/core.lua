local status, telescope = pcall(require, "telescope")
local builtin_status, builtin = pcall(require, "telescope.builtin")

local opts = { remap = false }
if not status or not builtin_status then
  return
end

local actions = require("telescope.actions")
local pickers = {}

local ignore_patterns = {
  ".git",
  "node_modules",
  "Temp",
  "dist",
  "*.lock",
  "bin",
  "obj",
  "Builds",
}

local function generate_ignore_args(tool)
  local args = {}
  for _, pattern in ipairs(ignore_patterns) do
    if tool == "rg" then
      table.insert(args, "-g")
      table.insert(args, "!" .. "**/" .. pattern)
    elseif tool == "fd" then
      table.insert(args, "--exclude")
      table.insert(args, pattern)
    end
  end
  return args
end

local grep_args = vim.list_extend({ "--hidden", "--smart-case" }, generate_ignore_args("rg"))

pickers = {
  live_grep = {
    additional_args = function(_)
      return grep_args
    end,
  },
  grep_string = {
    additional_args = function(_)
      return grep_args
    end,
  },
}

pickers = vim.tbl_deep_extend("force", pickers, {
  find_files = {
    find_command = vim.list_extend({ "rg", "--files", "--hidden", "--smart-case", "--no-ignore" }, generate_ignore_args("rg")),
  },
})

telescope.setup({
  defaults = {
    file_ignore_patterns = { ".meta", ".unity", ".prefab", ".anim" },
    preview = {
      hide_on_startup = true,
    },
    mappings = {
      n = {
        ["<C-c>"] = actions.close,
      },
    },
  },
  pickers = pickers,
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
  },
})

-- Has to after setup, otherwise it doesn't have correct extensions setup
require("telescope").load_extension("ui-select")

vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
vim.keymap.set("n", "<leader>ff", builtin.find_files, opts)
vim.keymap.set("n", "<leader>fg", require("custom.telescope.multigrep").live_multigrep)
vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
vim.keymap.set("n", "<leader>en", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end)
