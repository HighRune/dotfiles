local fn = vim.fn

require("options")
require("mappings").vanilla()

return require("packer").startup({
	function(use)
		use("lewis6991/impatient.nvim")
		use({
			"wbthomason/packer.nvim",
			config = require("setup").packer(),
		})
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")
		use({
			"folke/tokyonight.nvim",
			config = require("setup").tokyonight(),
		})
		-- use({
		-- 	"ishan9299/nvim-solarized-lua",
		-- 	config = require("setup").solarized(),
		-- })
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
			config = function()
				require("setup").fm()
				require("mappings").fm()
			end,
		})
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
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = require("setup").indentBlankline(),
		})
		use("nvim-treesitter/nvim-treesitter-textobjects")
		use("nvim-treesitter/playground")
		use("windwp/nvim-ts-autotag")
		use("itchyny/vim-cursorword")
		-- use({
		-- 	"romgrk/barbar.nvim",
		-- config = require("mappings").barbar(),
		-- })
		use({
			"akinsho/bufferline.nvim",
			config = function()
				require("setup").bufferline()
				require("mappings").bufferline()
			end,
		})
		use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
		use({
			"sbdchd/neoformat",
			config = require("setup").neoformat(),
		})
		use("tpope/vim-commentary")
		use("JoosepAlviste/nvim-ts-context-commentstring")
		use("tommcdo/vim-lion")
		use("p00f/nvim-ts-rainbow")
		-- use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline').setup()" })
		use({
			"AndrewRadev/splitjoin.vim",
			config = require("mappings").splitjoin(),
		})
		use({
			"inside/vim-search-pulse",
			config = require("setup").searchPulse(),
		})
		use("kana/vim-textobj-user")
		use("rhysd/vim-textobj-anyblock")
		use("kana/vim-textobj-line")
		use("kana/vim-textobj-indent")
		use({
			"windwp/nvim-autopairs",
			config = require("config.nvim-autopairs").setup(),
		})
		use({
			"blackCauldron7/surround.nvim",
			config = function()
				require("setup").surround()
				require("mappings").surround()
			end,
		})
		use({
			"chaoren/vim-wordmotion",
			config = function()
				require("setup").wordmotion()
				require("mappings").wordmotion()
			end,
		})
		use({
			"svermeulen/vim-cutlass",
			config = function()
				require("mappings").cutlass()
			end,
		})
		use({
			"kana/vim-arpeggio",
			require("mappings").arpeggio(),
		})
		use({
			"phaazon/hop.nvim",
			config = function()
				require("setup").hop()
				require("mappings").hop()
			end,
		})
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup()
			end,
		})
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = "require('config.lualine').setup()",
		})
		-- use({
		-- 	"famiu/feline.nvim",
		-- 	config = "require('feline').setup()",
		-- })
		-- use({
		-- 	"bfredl/nvim-miniyank",
		-- 	config = function()
		-- 		require("setup").miniyank()
		-- 		require("mappings").miniyank()
		-- 	end,
		-- })
		-- use("svermeulen/vimpeccable")
		-- use("svermeulen/vim-yoink")
		-- use("matze/vim-move")
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

-------------------- terryma/vim-expand-region
-- cmd([[
-- map <cr> <Plug>(expand_region_expand)
-- map <s-cr> <Plug>(expand_region_shrink)
-- let g:expand_region_text_objects = { 'i]':1, 'i)':1, 'i}':1, 'it':1, 'ii':1, 'ip':1, 'a]':1, 'a)':1, 'a}':1, 'at':1, 'ai':1, 'ap':1 }
-- ]])

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

-------------------- ray-x/lsp_signature.nvim
-- require("lsp_signature").setup({
-- 	bind = true, -- This is mandatory, otherwise border config won't get registered.
-- 	hint_prefix = " ",
-- 	hint_scheme = "function",
-- 	always_trigger = true,
-- 	timer_interval = 0,
-- 	hint_enable = true,
-- 	floating_window = false,
-- 	-- handler_opts = {
-- 	-- border = "single",
-- 	-- },
-- 	-- doc_lines = 0,
-- 	-- padding = " ",
-- 	-- max_width = 70,
-- 	-- max_height = 1,
-- })
