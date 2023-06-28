local status, telescope = pcall(require, "telescope")
local grep_args = { '--hidden', '--glob', '!**/.git/*' }

if not status then
  return
end

local pickers = {
  live_grep = {
    additional_args = function(opts)
      return grep_args
    end
  },
  grep_string = {
    additional_args = function(opts)
      return grep_args
    end
  },
}


if vim.fn.has "win32" == 1 then
  pickers = vim.tbl_deep_extend("force", pickers, {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
    },
  })
end

telescope.setup {
  defaults = { file_ignore_patterns = { '.meta', '.unity' } },
  pickers = pickers,
}
