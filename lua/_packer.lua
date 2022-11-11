vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'folke/tokyonight.nvim'
  use 'vim-airline/vim-airline-themes'
  use 'vim-airline/vim-airline'

  --  use 'KaptajnenGaming/themelas.nvim'
  --  use 'H:/workspace/themelas'

  use 'H:/workspace/themelas'

  -- All of it
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-lua/plenary.nvim'
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use 'dense-analysis/ale'
  use 'tpope/vim-fugitive'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'OmniSharp/omnisharp-vim'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'nvim-treesitter/playground'
end)
