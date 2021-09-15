return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use {"nvim-treesitter/nvim-treesitter", branch = '0.5-compat', run = ":TSUpdate"}
  use {'nvim-treesitter/playground'}
  use {"kyazdani42/nvim-web-devicons"}
  -- use { 'camspiers/snap'}
  -- use 'ggandor/lightspeed.nvim'
  use { 'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' }
  }
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
  use {"romgrk/barbar.nvim"}
  use {"neovim/nvim-lspconfig"}
  use {"kabouzeid/nvim-lspinstall"}
  -- use {"glepnir/lspsaga.nvim"}
  -- use {"hrsh7th/nvim-compe"}
  use {"glepnir/galaxyline.nvim", config = "require('config.galaxyline').post()"}
  -- use {'abecodes/tabout.nvim', config = "require('config.tabout').post()"}
  use { 'ms-jpq/coq_nvim', branch = 'coq'}
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'}
end)
