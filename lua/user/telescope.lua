local status, telescope = pcall(require, "telescope")
if not status then
  return
end

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
    }
  },
  pickers = pickers,

}
