local status, symbols_outline = pcall(require, 'symbols-outline')

if not status then
  return
end

symbols_outline.setup()
vim.keymap.set('n', '<leader>so', '<cmd>SymbolsOutline<CR>')
