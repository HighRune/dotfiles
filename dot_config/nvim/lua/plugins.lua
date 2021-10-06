return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use {'nvim-treesitter/nvim-treesitter', branch = '0.5-compat', run = ':TSUpdate'}
  use 'nvim-treesitter/playground'
  use 'kyazdani42/nvim-web-devicons'
  -- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
  use 'lewis6991/gitsigns.nvim'
  use 'romgrk/barbar.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'folke/tokyonight.nvim'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'sbdchd/neoformat'
  use 'tpope/vim-commentary'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'tommcdo/vim-lion'
  use 'nacro90/numb.nvim'
  use 'Xuyuanp/scrollbar.nvim'
  use 'karb94/neoscroll.nvim'
  -- use {'glepnir/galaxyline.nvim', config = "require('config.galaxyline').post()"}
  use 'windwp/windline.nvim'
  use { 'ms-jpq/coq_nvim', branch = 'coq'}
  use { 'ms-jpq/coq.artifacts', branch= 'artifacts'}
  use 'norcalli/nvim-colorizer.lua'
  use 'nvim-telescope/telescope.nvim'
end)
