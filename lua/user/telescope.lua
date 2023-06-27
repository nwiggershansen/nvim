local status, telescope = pcall(require, "telescope")

if not status then
  return
end

telescope.setup {
  defaults = { file_ignore_patterns = { '.meta', '.unity' } },
  pickers = {
   find_files = {
     find_command = { 'fd', '--type', 'f', '--hidden', '--exclude', '.git' }
   }
  }
}
