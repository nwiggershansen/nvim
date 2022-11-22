local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "site/pack/packer/start/packer.nvim"
  if (fn.empty(fn.glob(install_path))) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
  -- Packer
  use('wbthomason/packer.nvim')

  -- Themes
  use('folke/tokyonight.nvim')

  --  use 'KaptajnenGaming/themelas.nvim'

  -- Personal theme
  -- use 'H:/workspace/themelas'

  -- Status line
  use('vim-airline/vim-airline-themes')
  use('vim-airline/vim-airline')
  -- use('nvim-lualine/lualine.nvim')

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

  -- Typescript specific
  use('jose-elias-alvarez/typescript.nvim')

  -- Folder structure
  use({ 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons', } })

  -- Git diff view
  use({ 'sindrets/diffview.nvim' })

  -- Formatting helper for nonlsp
  use('jose-elias-alvarez/null-ls.nvim')

  -- Allows removing/adding surrounds
  use('tpope/vim-surround')

  if packer_bootstrap then
    require('packer').sync()
  end
end)
