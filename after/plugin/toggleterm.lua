local toggleterm = require('toggleterm')

if vim.fn.has "mac" == 1 then
elseif vim.fn.has "unix" == 1 then
  toggleterm.setup({
    start_in_insert = true,
    close_on_exit = true,
    auto_scroll = true,
    terminal_mappings = true,
    shell = "teminator"
  })
elseif vim.fn.has "win32" == 1 then
  toggleterm.setup({
    start_in_insert = true,
    close_on_exit = true,
    auto_scroll = true,
    terminal_mappings = true,
    shell = "cmd.exe"
  })
else
end

vim.keymap.set({ 'n', 'i', 't' }, '<C-\\>', '<cmd>:1ToggleTerm direction=float<CR>')
