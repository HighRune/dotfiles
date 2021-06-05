return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {
  'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
}
end)
