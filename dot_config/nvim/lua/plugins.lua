return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({
		"nvim-treesitter/nvim-treesitter",
		-- config = require("config.treesitter").setup(),
		run = ":TSUpdate",
	})
	-- use({
	-- 	"neovim/nvim-lspconfig",
	-- 	"williamboman/nvim-lsp-installer",
	-- 	config = "require('config.lsp').setup()",
	-- })
	-- use({
	-- 	"ms-jpq/coq_nvim",
	-- 	branch = "coq",
	-- 	config = require("config.coq").setup(),
	-- })
	-- use({
	-- 	"nvim-telescope/telescope.nvim",
	-- 	config = require("config.telescope").setup(),
	-- })
	-- use({
	-- 	"ray-x/lsp_signature.nvim",
	-- 	config = require("config.lsp_signature").setup(),
	-- })
	-- use({
	-- 	"is0n/fm-nvim",
	-- 	config = require("config.fm-nvim").setup(),
	-- })
	-- use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use("RRethy/nvim-treesitter-textsubjects")
	-- use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("itchyny/vim-cursorword")
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})
	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	config = require("config.indent-blankline").setup(),
	-- })
	use("romgrk/barbar.nvim")
	use("folke/tokyonight.nvim")
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use("sbdchd/neoformat")
	use("tpope/vim-commentary")
	-- use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tommcdo/vim-lion")
	-- use("p00f/nvim-ts-rainbow")
	use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline').setup()" })
	use("AndrewRadev/sideways.vim")
	use("AndrewRadev/splitjoin.vim")
	use("matze/vim-move")
	use("inside/vim-search-pulse")
	-- use("kana/vim-textobj-user")
	-- use("rhysd/vim-textobj-anyblock")
	-- use("chaoren/vim-wordmotion")
	-- use("kana/vim-arpeggio")
	-- use("andymass/vim-matchup")

	-- use("windwp/nvim-autopairs")
	-- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
	-- use({ "rrethy/vim-hexokinase", run = "make hexokinase", cmd = "HexokinaseTurnOn" })
	-- use("tpope/vim-abolish")
	-- use("tpope/vim-surround")
	-- use("terryma/vim-expand-region")
end)
