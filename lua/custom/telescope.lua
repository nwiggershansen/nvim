local status, telescope = pcall(require, "telescope")
local builtin_status, builtin = pcall(require, 'telescope.builtin')
local opts = { remap = false }
if not status or not builtin_status then
  return
end

local actions = require("telescope.actions")
local pickers = {}

if vim.fn.has "unix" == 1 then
  local grep_args = { '--no-ignore', '--hidden', '-g', '!**/.git/*', '-g', '!**/node_modules/*', '-g', '!*.lock', '-g',
    '!**/Temp/*', '-g', '!**/dist/*' }

  pickers = {
    live_grep = {
      additional_args = function(_)
        return grep_args
      end
    },
    grep_string = {
      additional_args = function(_)
        return grep_args
      end
    },
  }

  pickers = vim.tbl_deep_extend("force", pickers, {
    find_files = {
      find_command = { 'rg', '--files', '--no-ignore', '--hidden', '-g', '!**/.git/*', '-g', '!**/node_modules/*', '-g',
        '!*.lock', '-g', '!**/Temp/*', '-g', '!**/dist/*' }
    },
  })
else
  local grep_args = {}

  pickers = {
    live_grep = {
      additional_args = function(_)
        return grep_args
      end
    },
    grep_string = {
      additional_args = function(_)
        return grep_args
      end
    },
  }

  pickers = vim.tbl_deep_extend("force", pickers, {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
    },
  })
end

telescope.setup {
  defaults = {
    file_ignore_patterns = { '.meta', '.unity', '.prefab', '.anim' },
    preview = {
      hide_on_startup = true
    },
    mappings = {
      n = {
        ["<C-c>"] = actions.close
      }
    }
  },
  pickers = pickers,
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    }
  }
}

vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

require("telescope").load_extension("ui-select")
