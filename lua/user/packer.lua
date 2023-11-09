local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
  -- Themes
  'folke/tokyonight.nvim',
  'marko-cerovac/material.nvim',
  "EdenEast/nightfox.nvim",
  "rebelot/kanagawa.nvim",
  'navarasu/onedark.nvim',
  { "catppuccin/nvim", as = "catppuccin" },
  'rmehri01/onenord.nvim',
  { 'nordtheme/vim',   as = "nordtheme" },
  'rose-pine/neovim',

  --   'KaptajnenGaming/themelas.nvim'

  -- Personal theme
  --  'H:/workspace/themelas'

  -- Status line
  'vim-airline/vim-airline-themes',
  'vim-airline/vim-airline',
  -- 'nvim-lualine/lualine.nvim',

  -- All of it
  'neovim/nvim-lspconfig',
  'nvim-lua/plenary.nvim',
  'dense-analysis/ale',
  'simrat39/symbols-outline.nvim',

  -- Fuzzy finder
  'nvim-telescope/telescope.nvim',

  -- LSP installer
  'williamboman/mason.nvim',

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ':TSUpdate'
  },
  'nvim-treesitter/playground',

  -- Sticky header for context
  'nvim-treesitter/nvim-treesitter-context',

  -- Auto completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'saadparwaiz1/cmp_luasnip',

  -- Snippets
  'L3MON4D3/LuaSnip',

  -- Icons for completion floating window
  'onsails/lspkind.nvim',

  -- Comment helper
  'tpope/vim-commentary',

  -- Git
  'tpope/vim-fugitive',

  -- Showing cross-file diagnostics
  'folke/trouble.nvim',

  -- C# specific
  'OmniSharp/omnisharp-vim',
  'Hoffs/omnisharp-extended-lsp.nvim',

  -- Typescript specific
  'jose-elias-alvarez/typescript.nvim',

  -- Folder structure
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons', } },

  -- Git diff view
  { 'sindrets/diffview.nvim' },

  -- Formatting helper for nonlsp
  'jose-elias-alvarez/null-ls.nvim',

  -- Allows removing/adding surrounds
  'tpope/vim-surround',

  -- Java specific
  'mfussenegger/nvim-jdtls',

  -- Tabs for recently opened files
  'romgrk/barbar.nvim',

  -- Bicep highlight groups
  'carlsmedstad/vim-bicep',

  -- DAP (Debug Adapter Protocol)
  'mfussenegger/nvim-dap',
  { 'rcarriga/nvim-dap-ui', requires = { 'mfussenegger/nvim-dap' } },

  -- Marker jumping
  'ThePrimeagen/harpoon',

  -- Autopairs
  'windwp/nvim-autopairs',

  -- Terminal in neovim
  'akinsho/toggleterm.nvim',

  -- Jump annotations
  {
    'smoka7/hop.nvim',
    version = "*",
    opts = {},
  },

  -- JSON Schema store
  'b0o/schemastore.nvim'
})
