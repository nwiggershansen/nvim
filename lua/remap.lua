local status, builtin = pcall(require, 'telescope.builtin')

local keymap = vim.keymap
local opts = { remap = false }

if status then
  keymap.set('n', '<C-p>', builtin.find_files, opts)
  keymap.set('n', '<leader>ff', builtin.find_files, opts)
  keymap.set('n', '<leader>fg', builtin.live_grep, opts)
  keymap.set('n', '<leader>fb', builtin.buffers, opts)
  keymap.set('n', '<leader>fh', builtin.help_tags, opts)
end

keymap.set('n', '<C-u>', '<C-u>zz', opts)
keymap.set('n', '<C-d>', '<C-d>zz', opts)

-- keymap.set('n', 'dd', function()
--   print(vim.api.nvim_get_current_line())
--   if vim.api.nvim_get_current_line():match("^\\s*$") then
--     return '"_dd'
--   else
--     return 'dd'
--   end
-- end, opts)

-- keymap.set('i', '{', '{}<Esc>ha', opts);
-- keymap.set('i', '[', '[]<Esc>ha', opts);
-- keymap.set('i', '(', '()<Esc>ha', opts);
-- keymap.set('i', '"', '""<Esc>ha', opts);
-- keymap.set('i', '\'', '\'\'<Esc>ha', opts);
-- keymap.set('i', '`', '``<Esc>ha', opts);

keymap.set('n', '<S-Tab>', '<<')
keymap.set('i', '<S-Tab>', '<Esc><<hi')
keymap.set('v', '<S-Tab>', '<gv')

-- This interferes with the jump list of Ctrl + i
-- keymap.set('n', '<Tab>', '>>')
keymap.set('i', '<Tab>', '<Esc>>>hi')
keymap.set('v', '<Tab>', '>gv')

keymap.set('n', '<A-j>', '<cmd>m +1<CR>')
keymap.set('n', '<A-k>', '<cmd>m -2<CR>')
keymap.set('x', '<leader>p', '"_dP')

-- Yank into system clipboard
keymap.set({ 'n', 'v' }, '<leader>y', '"+y') -- yank motion
keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y') -- yank line

-- Delete into system clipboard
keymap.set({ 'n', 'v' }, '<leader>d', '"+d') -- delete motion
keymap.set({ 'n', 'v' }, '<leader>D', '"+D') -- delete line

-- Deletes everything between quotes and goes directly into insert mode
keymap.set('n', 'di\"', 'di\"i')
keymap.set('n', 'di\'', 'di\'i')

-- Navigate between splits
keymap.set('n', '<C-h>', '<C-W>h', opts)
keymap.set('n', '<C-l>', '<C-W>l', opts)
keymap.set('n', '<C-j>', '<C-W>j', opts)
keymap.set('n', '<C-k>', '<C-W>k', opts)

-- Split window
keymap.set('n', "<leader>sv", "<C-w>v")         -- Split window vertically
keymap.set('n', "<leader>sh", "<C-w>s")         -- Split window horizontally
keymap.set('n', "<leader>se", "<C-w>=")         -- Make split windows equal width
keymap.set('n', "<leader>sx", "<cmd>close<CR>") -- Close current split window

-- Tabs
keymap.set('n', "<leader>to", "<cmd>tabnew<CR>")        -- Open new tab
keymap.set('n', "<leader>tx", "<cmd>tabclose<CR>")      -- Close current tab
keymap.set('n', "<leader>tn", "<cmd>tabn<CR>")          -- Go to next tab
keymap.set('n', "<leader>tp", "<cmd>tabp<CR>")          -- Go to previous tab

keymap.set('n', "<leader>e", "<cmd>NvimTreeToggle<CR>") -- Toggles file viewer
keymap.set('n', "<leader>rs", "<cmd>:LspRestart<CR>")   -- Restarts lsp

-- Resize buffer without having to do count
keymap.set("n", "<C-w><", "10<C-w><", opts)
keymap.set("n", "<C-w>>", "10<C-w>>", opts)
keymap.set("n", "<leader><", "10<C-w><", opts)
keymap.set("n", "<leader>>", "10<C-w>>", opts)

-- Move visually selected easier
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")

-- Keep search terms in center
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set({"n", "v"}, '<leader>d', '"_d')

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Disable arrow keys
keymap.set({'n', 'i'}, '<Left>', '<Nop>')
keymap.set({'n', 'i'}, '<Right>', '<Nop>')
keymap.set({'n', 'i'}, '<Up>', '<Nop>')
keymap.set({'n', 'i'}, '<Down>', '<Nop>')

keymap.set('n', '<leader>qq', '<cmd>quitall<CR>')
keymap.set('n', '<leader>QQ', '<cmd>quitall!<CR>')

keymap.set('n', 'ri"', '"_di"P')
keymap.set('n', 'ri{', '"_di{P')
keymap.set('n', 'ri(', '"_di(P')
keymap.set('n', 'ri[', '"_di[P')
keymap.set('n', 'ri\'', '"_di\'P')
