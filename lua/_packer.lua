vim.cmd [[packadd packer.nvim]]  

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'vim-airline/vim-airline'
    use 'neoclide/coc.nvim'
    use 'OmniSharp/omnisharp-vim'
    use 'tomasiser/vim-code-dark'
    use 'martinsione/darkplus.nvim'
end)



