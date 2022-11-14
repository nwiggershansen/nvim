vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Themes
  use 'vim-airline/vim-airline-themes'
  use 'vim-airline/vim-airline'

  --  use 'KaptajnenGaming/themelas.nvim'
  --  use 'H:/workspace/themelas'

  -- Personal theme
  use 'H:/workspace/themelas'

  -- All of it
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/plenary.nvim'
  use 'dense-analysis/ale'

  -- Fuzzy finder
  use 'nvim-telescope/telescope.nvim'

  -- LSP installer
  use 'williamboman/mason.nvim'

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
  use 'nvim-treesitter/playground'

  -- Auto completion
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Comment helper
  use 'preservim/nerdcommenter'

  -- Git
  use 'tpope/vim-fugitive'

  -- C# specific
  use 'OmniSharp/omnisharp-vim'
end)
