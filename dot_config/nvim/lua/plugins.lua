return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}, {"kyazdani42/nvim-web-devicons"}}
}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"romgrk/barbar.nvim"}
    use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('gitsigns').setup()
  end
  
}
use {"neovim/nvim-lspconfig"}
use {"kabouzeid/nvim-lspinstall"}
use {"glepnir/lspsaga.nvim"}
end)
