local keymap = vim.keymap
local opts = { remap = false }

keymap.set("n", "<C-u>", "<C-u>zz", opts)
keymap.set("n", "<C-d>", "<C-d>zz", opts)

keymap.set("n", "dd", function()
  if vim.api.nvim_get_current_line():match("^%s*$") then
    return "\"_dd"
  else
    return "dd"
  end
end, { expr = true })

keymap.set("n", "<S-Tab>", "<<")
keymap.set("i", "<S-Tab>", "<Esc><<hi")
keymap.set("v", "<S-Tab>", "<gv")

-- This interferes with the jump list of Ctrl + i
-- keymap.set('n', '<Tab>', '>>')
keymap.set("v", "<Tab>", ">gv")

-- Move Lines
keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

keymap.set("x", "<leader>p", "\"_dP")

-- Yank into system clipboard
keymap.set({ "n", "v" }, "<leader>y", "\"+y") -- yank motion
keymap.set({ "n", "v" }, "<leader>Y", "\"+Y") -- yank line

-- Delete into system clipboard
keymap.set({ "n", "v" }, "<leader>d", "\"+d") -- delete motion
keymap.set({ "n", "v" }, "<leader>D", "\"+D") -- delete line

-- Deletes everything between quotes and goes directly into insert mode
keymap.set("n", "di\"", "di\"i")
keymap.set("n", "di'", "di'i")

-- Navigate between splits
keymap.set("n", "<C-h>", "<C-W>h", opts)
keymap.set("n", "<C-l>", "<C-W>l", opts)
keymap.set("n", "<C-j>", "<C-W>j", opts)
keymap.set("n", "<C-k>", "<C-W>k", opts)

-- Split window
keymap.set("n", "<leader>sv", "<C-w>v") -- Split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- Split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- Make split windows equal width
keymap.set("n", "<leader>sx", "<cmd>close<CR>") -- Close current split window

-- Tabs
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>") -- Close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>") -- Go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>") -- Go to previous tab

keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>") -- Restarts lsp

-- Move visually selected easier
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "J", "mzJ`z")

-- Keep search terms in center
keymap.set("n", "%", "%zz")

keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Disable arrow keys
keymap.set({ "n", "i" }, "<Left>", "<Nop>")
keymap.set({ "n", "i" }, "<Right>", "<Nop>")
keymap.set({ "n", "i" }, "<Up>", "<Nop>")
keymap.set({ "n", "i" }, "<Down>", "<Nop>")

keymap.set("n", "<leader>qq", "<cmd>qa<CR>")
keymap.set("n", "<leader>QQ", "<cmd>qa!<CR>")

local replacable = { "\"", "'", "(", ")", "{", "}", "[", "]", "<", ">", "`" }
for _, v in ipairs(replacable) do
  keymap.set("n", "<leader>ri" .. v, "\"_di" .. v .. "P")
end

keymap.set({ "n", "i" }, "<C-c>", "<cmd>q<CR>")

keymap.set("n", "<leader>no", "<cmd>NvimTreeOpen<CR>")
keymap.set("n", "<leader>nc", "<cmd>NvimTreeClose<CR>")

-- Cool macro shit
keymap.set("n", "Q", "@qj")
keymap.set("x", "Q", "<cmd>norm @q<CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
keymap.set("n", "n", "'Nn'[v:searchforward].'zzzv'", { expr = true, desc = "Next Search Result" })
keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
keymap.set("n", "N", "'nN'[v:searchforward].'zzzv'", { expr = true, desc = "Prev Search Result" })
keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Yank whole file
keymap.set("n", "<leader>ay", "<cmd>%y<CR>", { desc = "Yank whole file" })

keymap.set("n", "<leader>qf", "<cmd>copen<CR>")

keymap.set("n", "<leader>lg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

vim.keymap.set("n", "<leader>h", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Show/hide inlay hints" })

-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float()
end, { desc = "Open floating window for diagnostics" })
