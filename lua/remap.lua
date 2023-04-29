local status, builtin = pcall(require, 'telescope.builtin')

local opts = { remap = false }
vim.keymap.set('n', '<leader>pv', '<cmd>Ex<CR>', opts)

if status then
  vim.keymap.set('n', '<C-p>', builtin.find_files, opts)
  vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
  vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)
end

vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
-- vim.keymap.set('n', 'dd', function()
--  if vim.api.nvim_get_current_line():match("^%s*$") then
--    return '"_dd'
--  else
--    return 'dd'
--  end
-- end, opts)

vim.keymap.set('i', '{', '{}<Esc>ha', opts);
vim.keymap.set('i', '[', '[]<Esc>ha', opts);
vim.keymap.set('i', '(', '()<Esc>ha', opts);
vim.keymap.set('i', '"', '""<Esc>ha', opts);
vim.keymap.set('i', '\'', '\'\'<Esc>ha', opts);
vim.keymap.set('i', '`', '``<Esc>ha', opts);

vim.keymap.set('n', '<S-Tab>', '<<')
vim.keymap.set('i', '<S-Tab>', '<Esc><<hi')

vim.keymap.set('x', '<leader>p', '"_dP')

-- Deletes everything between quotes and goes directly into insert mode
vim.keymap.set('n', 'di\"', 'di\"i')
vim.keymap.set('n', 'di\'', 'di\'i')

-- Closes current file & nvim-tree
vim.keymap.set('n', 'qq', '<cmd>q<CR><cmd>q<CR>')

-- Navigate between splits
vim.keymap.set('n', '<C-h>', '<C-W>h', opts)
vim.keymap.set('n', '<C-l>', '<C-W>l', opts)
vim.keymap.set('n', '<C-j>', '<C-W>j', opts)
vim.keymap.set('n', '<C-k>', '<C-W>k', opts)

-- Split window
vim.keymap.set('n', "<leader>sv", "<C-w>v")         -- Split window vertically
vim.keymap.set('n', "<leader>sh", "<C-w>s")         -- Split window horizontally
vim.keymap.set('n', "<leader>se", "<C-w>=")         -- Make split windows equal width
vim.keymap.set('n', "<leader>sx", "<cmd>close<CR>") -- Close current split window

-- Tabs
vim.keymap.set('n', "<leader>to", "<cmd>tabnew<CR>")        -- Open new tab
vim.keymap.set('n', "<leader>tx", "<cmd>tabclose<CR>")      -- Close current tab
vim.keymap.set('n', "<leader>tn", "<cmd>tabn<CR>")          -- Go to next tab
vim.keymap.set('n', "<leader>tp", "<cmd>tabp<CR>")          -- Go to previous tab

vim.keymap.set('n', "<leader>e", "<cmd>NvimTreeToggle<CR>") -- Toggles file viewer
vim.keymap.set('n', "<leader>rs", "<cmd>:LspRestart<CR>")   -- Restarts lsp

-- Barbar in nvim Tabs
vim.keymap.set('n', "<A-,>", "<cmd>BufferPrevious<CR>")
vim.keymap.set('n', "<A-.>", "<cmd>BufferNext<CR>")
vim.keymap.set('n', "<A-<>", "<cmd>BufferMovePrevious<CR>")
vim.keymap.set('n', "<A->>", "<cmd>BufferMoveNext<CR>")
vim.keymap.set('n', "<A-w>", "<cmd>BufferClose<CR>")

-- Trouble 
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", opts)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<CR>", opts)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", opts)

