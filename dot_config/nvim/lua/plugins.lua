local mappings = require("mappings")
return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")
	use({ "folke/tokyonight.nvim", config = require("config.tokyonight").setup() })
	use({
		"nvim-treesitter/nvim-treesitter",
		config = require("config.treesitter").setup(),
		run = ":TSUpdate",
	})
	use("neovim/nvim-lspconfig")
	use({
		"williamboman/nvim-lsp-installer",
		config = "require('config.lsp').setup()",
	})
	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		config = "require('config.coq').setup()",
	})
	use({
		"nvim-telescope/telescope.nvim",
		config = require("config.telescope").setup(),
	})
	use({
		"is0n/fm-nvim",
		config = "require('config.fm-nvim').setup()",
	})
	-- use({
	-- 	"lewis6991/gitsigns.nvim",
	-- 	config = function()
	-- 		require("gitsigns").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"norcalli/nvim-colorizer.lua",
	-- 	config = function()
	-- 		require("colorizer").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"nacro90/numb.nvim",
	-- 	config = function()
	-- 		require("numb").setup()
	-- 	end,
	-- })
	-- use({
	-- 	"lukas-reineke/indent-blankline.nvim",
	-- 	-- config = require("config.indent-blankline").setup(),
	-- })
	-- use("nvim-treesitter/nvim-treesitter-textobjects")
	-- use("nvim-treesitter/playground")
	-- use("windwp/nvim-ts-autotag")
	-- use("itchyny/vim-cursorword")
	use({
		"romgrk/barbar.nvim",
		config = mappings.barbar(),
	})
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use({
		"sbdchd/neoformat",
		config = require("config.neoformat").setup(),
	})
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- use("tommcdo/vim-lion")
	-- use("p00f/nvim-ts-rainbow")
	-- use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline').setup()" })
	use({
		"AndrewRadev/splitjoin.vim",
		config = mappings.splitjoin(),
	})
	-- use("inside/vim-search-pulse")
	-- use("kana/vim-textobj-user")
	-- use("rhysd/vim-textobj-anyblock")
	-- use("AndrewRadev/sideways.vim")
	-- use("bfredl/nvim-miniyank")
	-- use({
	-- 	"windwp/nvim-autopairs",
	-- 	-- config = require("config.nvim-autopairs").setup(),
	-- })
	-- use({
	-- 	"blackCauldron7/surround.nvim",
	-- 	-- config = require("config.surround-nvim").setup(),
	-- })
	use({
		"chaoren/vim-wordmotion",
		config = require("config.vim-wordmotion").setup(),
	})

	-- use("svermeulen/vimpeccable")
	-- use("svermeulen/vim-yoink")
	-- use("kana/vim-arpeggio")
	-- use("matze/vim-move")
	-- use("svermeulen/vim-cutlass")
	-- use("RRethy/nvim-treesitter-textsubjects")
	-- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
	-- use({ "rrethy/vim-hexokinase", run = "make hexokinase", cmd = "HexokinaseTurnOn" })
	-- use("tpope/vim-abolish")
	-- use("tpope/vim-surround")
	-- use("terryma/vim-expand-region")
	-- use({
	-- "ray-x/lsp_signature.nvim",
	-- config = require("config.lsp_signature").setup(),
	-- })
end)
