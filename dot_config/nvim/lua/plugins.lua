return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
use { 'camspiers/snap'}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"kyazdani42/nvim-web-devicons"}
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
use {"hrsh7th/nvim-compe"}
use {'Shadorain/shadotheme'}
end)
