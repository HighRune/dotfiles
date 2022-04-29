require("options").core()
require("mappings").core()

return require("packer").startup({
	function(use)
		local config = require("config")
		use("lewis6991/impatient.nvim")
		use({
			"wbthomason/packer.nvim",
			config = config.packer(),
		})
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")
		use({
			"folke/tokyonight.nvim",
			config = config.tokyonight(),
		})
		use({
			"nvim-treesitter/nvim-treesitter",
			config = config.treesitter(),
			run = ":TSUpdate",
		})
		use("neovim/nvim-lspconfig")
		use({
			"williamboman/nvim-lsp-installer",
			config = require("config.lsp")(),
		})
		use({
			"ms-jpq/coq_nvim",
			branch = "coq",
			config = require("config.coq")(),
			requires = { "ms-jpq/coq.artifacts", branch = "artifacts" },
		})
		use({
			"is0n/fm-nvim",
			config = config.fm(),
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = config.gitsigns(),
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = config.colorizer,
		})
		use({
			"nacro90/numb.nvim",
			config = config.numb,
		})
		use({
			"echasnovski/mini.nvim",
			config = config.indentscope(),
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("windwp/nvim-ts-autotag")
		use("itchyny/vim-cursorword")
		use("tpope/vim-surround")
		-- use({
		-- 	"akinsho/bufferline.nvim",
		-- 	config = config.bufferline(),
		-- })
		use({
			"sbdchd/neoformat",
			config = config.neoformat(),
		})
		use({
			"numToStr/Comment.nvim",
			config = config.comment(),
		})
		use("tommcdo/vim-lion")
		use("tommcdo/vim-exchange")
		use("p00f/nvim-ts-rainbow")
		use({
			"AndrewRadev/splitjoin.vim",
			config = config.splitjoin(),
		})
		use({
			"wellle/targets.vim",
			config = config.targets(),
		})
		use({
			"windwp/nvim-autopairs",
			config = require("config.autopairs")(),
		})
		use({
			"chaoren/vim-wordmotion",
			config = config.wordmotion(),
		})
		use({
			"kana/vim-arpeggio",
			config = config.arpeggio(),
		})
		use({
			"ahmedkhalf/project.nvim",
			config = config.project(),
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = "require('config.lualine')()",
		})
		use({
			"gbprod/cutlass.nvim",
			config = config.cutlass(),
		})
		use({
			"justinmk/vim-sneak",
			config = config.sneak(),
		})
		use({
			"ibhagwan/fzf-lua",
			config = config.fzf(),
		})
		use({
			"monaqa/dial.nvim",
			config = config.dial(),
		})
		use({
			"machakann/vim-highlightedyank",
			config = config.highlightedyank(),
		})
		use("svban/YankAssassin.vim")
		use("glts/vim-textobj-comment")
		use("D4KU/vim-textobj-chainmember")
		use({
			"kana/vim-textobj-user",
			config = config.textobjuser(),
		})
		use({
			"kana/vim-submode",
			config = config.submode(),
		})
		use({
			-- "/home/charles/Documents/dev/plugins/putline.nvim",
			"Runeword/putline.nvim",
			config = require("putline").setup(),
		})
		use("ryvnf/readline.vim")
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({
					border = "",
					width = 999,
					height = 999,
				})
			end,
		},
		-- lewis6991/impatient.nvim
		-- compile_path = fn.stdpath("config") .. "/lua/packer_compiled.lua",
		-- profile = {
		-- 	enable = true,
		-- },
	},
})

-- use("tpope/vim-repeat")
-- use({
-- 	"jeetsukumaran/vim-indentwise",
-- 	config = config.indentwise(),
-- })
-- use("nvim-treesitter/playground")
-- use({
-- 	"jeetsukumaran/vim-indentwise",
-- 	config = function()
-- 		require("mappings").indentwise()
-- 	end,
-- })
-- use("tpope/vim-commentary")
-- use("JoosepAlviste/nvim-ts-context-commentstring")
-- use("kana/vim-textobj-user")
-- use("PeterRincker/vim-argumentative")
-- use({
-- 	"inside/vim-search-pulse",
-- 	config = function()
-- 		require("setup").pulse()
-- 		require("mappings").pulse()
-- 	end,
-- })
-- use("michaeljsmith/vim-indent-object")
-- use({
-- 	"lukas-reineke/indent-blankline.nvim",
-- 	-- config = require("setup").indentBlankline(),
-- })
-- use("Houl/repmo-vim")
-- use({
-- 	"andymass/vim-matchup",
-- })
-- use({
-- 	"rlane/pounce.nvim",
-- 	-- config = function()
-- 	-- 	require("setup").pounce()
-- 	-- 	require("mappings").pounce()
-- 	-- end,
-- })
-- use({
-- 	"phaazon/hop.nvim",
-- 	-- config = function()
-- 	-- 	require("setup").hop()
-- 	-- 	require("mappings").hop()
-- 	-- end,
-- })
-- use({
-- 	"nvim-telescope/telescope.nvim",
-- 	-- config = require("config.telescope").setup(),
-- })
-- use({
-- 	"svermeulen/vim-cutlass",
-- 	config = function()
-- 		require("mappings").cutlass()
-- 	end,
-- })
-- use("bfredl/nvim-incnormal")
-- use({
-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
-- 	config = function()
-- 		require("lsp_lines").register_lsp_virtual_lines()
-- 	end,
-- })
-- use({
-- 	"bfredl/nvim-miniyank",
-- 	config = function()
-- 		require("setup").miniyank()
-- 		require("mappings").miniyank()
-- 	end,
-- })
-- use("svermeulen/vim-yoink")
-- use("matze/vim-move")
-- use("RRethy/nvim-treesitter-textsubjects")
-- use({ "ibhagwan/fzf-lua", requires = { "vijaymarupudi/nvim-fzf" } })
-- use({ "rrethy/vim-hexokinase", run = "make hexokinase", cmd = "HexokinaseTurnOn" })
-- use("tpope/vim-abolish")
-- use({
-- "bkad/CamelCaseMotion",
-- config = function()
-- require("mappings").camelCaseMotion()
-- end,
-- })

-------------------- kana/vim-arpeggio
-- cmd("call arpeggio#map('i', '', 0, 'jk', '<Esc>')")

-------------------- matze/vim-move
-- cmd("let g:move_key_modifier = 'S'")

-------------------- AndrewRadev/sideways.vim
-- api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
-- api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)

-- -------------------- svermeulen/vim-yoink
-- cmd([[
-- nmap <c-n> <plug>(YoinkPostPasteSwapBack)
-- nmap <c-p> <plug>(YoinkPostPasteSwapForward)

-- nmap p <plug>(YoinkPaste_p)
-- nmap P <plug>(YoinkPaste_P)

-- " Also replace the default gp with yoink paste so we can toggle paste in this case too
-- nmap gp <plug>(YoinkPaste_gp)
-- nmap gP <plug>(YoinkPaste_gP)

-- let g:yoinkMaxItems = 5
-- let g:yoinkAutoFormatPaste = 1
-- let g:yoinkSwapClampAtEnds = 0
-- let g:yoinkSyncSystemClipboardOnFocus = 0
-- ]])
