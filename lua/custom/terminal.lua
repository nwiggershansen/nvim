local toggleterm = require("toggleterm")
local shell
if vim.fn.has("mac") == 1 then
elseif vim.fn.has("unix") == 1 then
  shell = "bash"
elseif vim.fn.has("win32") == 1 then
  shell = "cmd.exe"
end
toggleterm.setup({
  start_in_insert = true,
  close_on_exit = true,
  auto_scroll = true,
  terminal_mappings = true,
  shell = shell,
})

vim.keymap.set({ "n" }, "<leader>1", "<cmd>:1ToggleTerm direction=float<CR>")
vim.keymap.set({ "n" }, "<leader>2", "<cmd>:2ToggleTerm<CR>")
vim.keymap.set({ "n" }, "<leader>3", "<cmd>:3ToggleTerm<CR>")
