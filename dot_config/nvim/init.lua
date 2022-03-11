local fn = vim.fn

require("options")
require("mappings").vanilla()

return require("packer").startup({
	function(use)
		use({
			"lewis6991/impatient.nvim",
			cond = false,
		})
		use({
			"wbthomason/packer.nvim",
			config = require("setup").packer(),
			cond = false,
		})
		use({
			"nvim-lua/plenary.nvim",
			cond = false,
		})
		use({
			"kyazdani42/nvim-web-devicons",
			cond = false,
		})
		use({
			"folke/tokyonight.nvim",
			config = require("setup").tokyonight(),
			cond = false,
		})
		-- use({
		-- 	"nvim-treesitter/nvim-treesitter",
		-- 	config = require("config.treesitter").setup(),
		-- 	run = ":TSUpdate",
		-- 	disable = true,
		-- })
		use({
			"neovim/nvim-lspconfig",
			cond = false,
		})
		-- use({
		-- 	"williamboman/nvim-lsp-installer",
		-- 	config = "require('config.lsp').setup()",
		-- 	disable = false,
		-- })
		-- use({
		-- 	"ms-jpq/coq_nvim",
		-- 	branch = "coq",
		-- 	config = function()
		-- 		require("config.coq").setup()
		-- 		require("mappings").coq()
		-- 	end,
		-- 	disable = true,
		-- })
		use({
			"is0n/fm-nvim",
			config = function()
				require("setup").fm()
				require("mappings").fm()
			end,
			cond = false,
		})
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("setup").gitsigns()
			end,
			cond = false,
		})
		use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
			cond = false,
		})
		use({
			"nacro90/numb.nvim",
			config = function()
				require("numb").setup()
			end,
			cond = false,
		})
		use({
			"echasnovski/mini.nvim",
			config = function()
				require("setup").indentscope()
			end,
			cond = false,
		})
		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			cond = false,
		})
		-- ****************
		use({
			"windwp/nvim-ts-autotag",
			cond = false,
		})
		use({
			"itchyny/vim-cursorword",
			cond = false,
		})
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("setup").bufferline()
				require("mappings").bufferline()
			end,
			cond = false,
		})
		use({
			"ms-jpq/coq.artifacts",
			branch = "artifacts",
			cond = false,
		})
		use({
			"sbdchd/neoformat",
			config = require("setup").neoformat(),
			cond = true,
		})
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
			cond = false,
		})
		use({
			"tommcdo/vim-lion",
			cond = false,
		})
		use({
			"tommcdo/vim-exchange",
			cond = false,
		})
		use({
			"p00f/nvim-ts-rainbow",
			cond = false,
		})
		use({
			"AndrewRadev/splitjoin.vim",
			config = function()
				require("mappings").splitjoin()
				require("setup").splitjoin()
			end,
			cond = false,
		})
		use({
			"wellle/targets.vim",
			config = function()
				require("setup").targets()
				require("mappings").targets()
			end,
			cond = false,
		})
		-- use({
		-- 	"windwp/nvim-autopairs",
		-- 	config = require("config.nvim-autopairs").setup(),
		-- 	disable = true,
		-- })
		use({
			"chaoren/vim-wordmotion",
			config = function()
				require("setup").wordmotion()
				require("mappings").wordmotion()
			end,
			cond = false,
		})
		-- use({
		-- 	"kana/vim-arpeggio",
		-- 	require("mappings").arpeggio(),
		-- 	disable = true,
		-- })
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup()
			end,
			cond = false,
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = "require('config.lualine').setup()",
			cond = false,
		})
		use({
			"gbprod/cutlass.nvim",
			config = function()
				require("setup").cutlass()
			end,
			cond = false,
		})
		use({
			"justinmk/vim-sneak",
			config = function()
				require("setup").sneak()
				require("mappings").sneak()
			end,
			cond = false,
		})
		use({
			"ibhagwan/fzf-lua",
			config = function()
				require("setup").fzf()
				require("mappings").fzf()
			end,
			cond = false,
		})
		use({
			"monaqa/dial.nvim",
			config = function()
				require("setup").dial()
				require("mappings").dial()
			end,
			cond = false,
		})
		use({
			"tpope/vim-repeat",
			cond = false,
		})
		use({
			"machakann/vim-highlightedyank",
			config = function()
				require("setup").highlightedyank()
			end,
			cond = false,
		})
		use({
			"svban/YankAssassin.vim",
			cond = false,
		})
		-- **************************************
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
		-- use("tpope/vim-surround")
		-- use({
		-- "bkad/CamelCaseMotion",
		-- config = function()
		-- require("mappings").camelCaseMotion()
		-- end,
		-- })
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
