local status, telescope = pcall(require, "telescope")
local grep_args = { '--hidden', '--glob', '!**/.git/*' }

if not status then
  return
end

telescope.setup {
  defaults = { file_ignore_patterns = { '.meta', '.unity' } },
  pickers = {
    find_files = {
      find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
    },
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
}
