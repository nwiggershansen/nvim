vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- Themes
  use('vim-airline/vim-airline-themes')
  use('vim-airline/vim-airline')
  use('folke/tokyonight.nvim')

  --  use 'KaptajnenGaming/themelas.nvim'

  -- Personal theme
  -- use 'H:/workspace/themelas'

  -- All of it
  use('neovim/nvim-lspconfig')
  use('nvim-lua/plenary.nvim')
  use('dense-analysis/ale')
  use('simrat39/symbols-outline.nvim')

  -- Fuzzy finder
  use('nvim-telescope/telescope.nvim')

  -- LSP installer
  use('williamboman/mason.nvim')

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use('nvim-treesitter/playground')
  -- Sticky header for context
  use('nvim-treesitter/nvim-treesitter-context')

  -- Auto completion
  use('hrsh7th/nvim-cmp')
  use('L3MON4D3/LuaSnip')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-nvim-lsp')

  -- Icons for completion floating window
  use('onsails/lspkind.nvim')

  -- Comment helper
  use('preservim/nerdcommenter')

  -- Git
  use('tpope/vim-fugitive')

  -- C# specific
  use('OmniSharp/omnisharp-vim')

  -- Folder structure
  use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', } })

  -- Git diff view
  use({ 'sindrets/diffview.nvim' })
end)
