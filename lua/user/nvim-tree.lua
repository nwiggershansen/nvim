local setup, nvimtree = pcall(require, "nvim-tree")
local loaded, nvimtreeapi = pcall(require, "nvim-tree.api")

if not setup then
  return
end

local function open_nvim_tree(data)
  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1

  if not directory then
    return
  end

  -- change to the directory
  vim.cmd.cd(data.file)

  -- open the tree
  require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
  renderer = {
    highlight_git = true,
    icons = {
      glyphs = {
        git = {
          staged = "",
          unstaged = "",
          untracked = "",
          unmerged = "",
          renamed = "",
          deleted = "",
          ignored = "",
        }
      }
    }
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false
      }
    }
  },
  filters = {
    custom = { ".meta$", ".unity$", ".git/*" }
  },
  on_attach = function(bufnr)
    nvimtreeapi.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', '<C-k>', '<C-W>k', { buffer = bufnr })
  end,
})

nvimtreeapi.tree.toggle_gitignore_filter()
