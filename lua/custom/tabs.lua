local status, nvim_tree_events = pcall(require, "nvim-tree.events")

if not status then
  return
end

local bufferline_status, bufferline_api = pcall(require, "bufferline.api")

if not bufferline_status then
  return
end

local function get_tree_size()
  return require'nvim-tree.view'.View.width
end

nvim_tree_events.subscribe('TreeOpen', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('Resize', function()
  bufferline_api.set_offset(get_tree_size())
end)

nvim_tree_events.subscribe('TreeClose', function()
  bufferline_api.set_offset(0)
end)

vim.keymap.set('n', "<A-,>", "<cmd>BufferPrevious<CR>")
vim.keymap.set('n', "<A-.>", "<cmd>BufferNext<CR>")
vim.keymap.set('n', "<A-<>", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set('n', "<A->>", "<cmd>BufferMoveNext<CR>")
vim.keymap.set('n', "<A-w>", "<cmd>BufferClose<CR>")


