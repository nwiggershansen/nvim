local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
  return
end


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
    custom = { ".meta$", ".unity$" }
  }
})
