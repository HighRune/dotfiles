return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("config.treesitter")
		end,
		run = ":TSUpdate",
		-- branch = "0.5-compat",
	})

	use("nvim-treesitter/playground")
	use("windwp/nvim-ts-autotag")
	use("kyazdani42/nvim-web-devicons")
	-- use { 'ibhagwan/fzf-lua', requires = { 'vijaymarupudi/nvim-fzf' } }
	use("itchyny/vim-cursorword")
	use("lewis6991/gitsigns.nvim")
	use("romgrk/barbar.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("folke/tokyonight.nvim")
	use("neovim/nvim-lspconfig")
	use("kabouzeid/nvim-lspinstall")
	-- use({ "ms-jpq/coq_nvim", branch = "coq" })
	-- use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use("ray-x/lsp_signature.nvim")
	use("sbdchd/neoformat")
	use("tpope/vim-commentary")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("tommcdo/vim-lion")
	use("nacro90/numb.nvim")
	use("p00f/nvim-ts-rainbow")
	use({ "glepnir/galaxyline.nvim", config = "require('config.galaxyline').post()" })
	use("norcalli/nvim-colorizer.lua")
	use("nvim-telescope/telescope.nvim")
	use("AndrewRadev/sideways.vim")
	use("AndrewRadev/splitjoin.vim")
	use("matze/vim-move")
	use("bkad/CamelCaseMotion")
	use("tpope/vim-abolish")
	use("tpope/vim-surround")
	use("terryma/vim-expand-region")
	use("inside/vim-search-pulse")
	use({
	  "abecodes/tabout.nvim",
		config = function()
			require("tabout").setup({
				tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
				backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
				act_as_tab = true, -- shift content if tab out is not possible
				act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
				enable_backwards = true, -- well ...
				completion = true, -- if the tabkey is used in a completion pum
				tabouts = {
					{ open = "'", close = "'" },
					{ open = '"', close = '"' },
					{ open = "`", close = "`" },
					{ open = "(", close = ")" },
					{ open = "[", close = "]" },
					{ open = "{", close = "}" },
				},
				ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
				exclude = {}, -- tabout will ignore these filetypes
			})
		end,
		wants = { "nvim-treesitter" }, -- or require if not used so far
		-- after = {'coq_nvim'} -- if a completion plugin is using tabs load it before
	})
	-- use({
	-- 	"abecodes/tabout.nvim",
		-- config = function()
		-- 	require("tabout").setup({
		-- 		tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
		-- 		backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
		-- 		act_as_tab = true, -- shift content if tab out is not possible
		-- 		act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
		-- 		enable_backwards = true, -- well ...
		-- 		completion = true, -- if the tabkey is used in a completion pum
		-- 		tabouts = {
		-- 			{ open = "'", close = "'" },
		-- 			{ open = '"', close = '"' },
		-- 			{ open = "`", close = "`" },
		-- 			{ open = "(", close = ")" },
		-- 			{ open = "[", close = "]" },
		-- 			{ open = "{", close = "}" },
		-- 		},
		-- 		ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
		-- 		exclude = {}, -- tabout will ignore these filetypes
		-- 	})
		-- end,
		-- wants = { "nvim-treesitter" }, -- or require if not used so far
		-- after = {'coq_nvim'} -- if a completion plugin is using tabs load it before
	-- })
end)
