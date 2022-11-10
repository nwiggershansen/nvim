vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'OmniSharp/omnisharp-vim'
    use 'tomasiser/vim-code-dark'
    use 'martinsione/darkplus.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'dense-analysis/ale'
    use 'tpope/vim-fugitive'
    use 'neovim/nvim-lspconfig'
    use 'sumneko/lua-language-server'
    use 'williamboman/mason.nvim'
end)



