local g = vim.g
local cmd = vim.cmd
local fn = vim.fn

-------------------- wbthomason/packer.nvim
local function packer()
	require("mappings").packer()
	require("autocmd").packer()
end

-------------------- norcalli/nvim-colorizer.lua
local function colorizer()
	require("setup").colorizer()
end

-------------------- ahmedkhalf/project.nvim
local function project()
	require("setup").project()
end

-------------------- nacro90/numb.nvim
local function numb()
	require("setup").numb()
end

-------------------- folke/tokyonight.nvim
local function tokyonight()
	require("options").tokyonight()
end

-------------------- jeetsukumaran/vim-indentwise
local function indentwise()
	require("mappings").indentwise()
end

-------------------- is0n/fm-nvim
local function fm()
	require("mappings").fm()
	require("setup").fm()
end

-------------------- lewis6991/gitsigns.nvim
local function gitsigns()
	require("setup").gitsigns()
end

-------------------- echasnovski/mini.nvim
local function indentscope()
	require("autocmd").indentscope()
	require("setup").indentscope()
end

-------------------- akinsho/bufferline.nvim
local function bufferline()
	require("mappings").bufferline()
	require("setup").bufferline()
end

-------------------- sbdchd/neoformat
local function neoformat()
	-- Enable lua formater
	g.neoformat_enabled_lua = { "stylua" }
	require("autocmd").neoformat()

	-- vim.cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
	-- vim.cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
	-- vim.api.nvim_command([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])
	-- vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	require("mappings").splitjoin()
	require("options").splitjoin()
end

-------------------- wellle/targets.vim
local function targets()
	require("mappings").targets()
	require("options").targets()
	require("autocmd").targets()
end

-------------------- gbprod/cutlass.nvim
local function cutlass()
	require("setup").cutlass()
end

-------------------- justinmk/vim-sneak
local function sneak()
	require("mappings").sneak()
	require("options").sneak()
end

-------------------- numToStr/Comment.nvim
local function comment()
	require("setup").comment()
end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
	local spaces = {
		"_",
		"-",
		",",
		"/",
		".",
		":",
		"<",
		">",
		"(",
		")",
		"[",
		"]",
		"{",
		"}",
		"&",
		"@",
		"*",
		"=",
		"!",
		"+",
		"?",
		"'",
		'"',
	}
	local upspaces = {
		-- "_",
		-- "-",
		",",
		"/",
		".",
		":",
		"<",
		">",
		"(",
		")",
		"[",
		"]",
		"{",
		"}",
		"&",
		"@",
		"*",
		"=",
		"!",
		"+",
		"?",
		"'",
		'"',
	}
	require("mappings").wordmotion()
	g.wordmotion_nomap = 1
	-- Move to the character following those characters
	g.wordmotion_uppercase_spaces = upspaces
	g.wordmotion_spaces = spaces
end

-------------------- kana/vim-textobj-user
local function textobjuser()
	fn["textobj#user#plugin"]("specialcharacter", {
		specialcharacter = {
			pattern = [[\(\w\|\s\)\@!]],
			["move-n"] = "S",
			["move-p"] = "H",
		},
	})
	-- fn["textobj#user#plugin"]("word", {
	-- 	word = {
	-- 		pattern = [[\<\w\+\>]],
	-- 		["move-n"] = "w",
	-- 		["move-p"] = "b",
	-- 		["move-N"] = "e",
	-- 		["move-P"] = "ge",
	-- 		select = "iw",
	-- 	},
	-- })
end

-------------------- ibhagwan/fzf-lua
local function fzf()
	require("mappings").fzf()
	require("setup").fzf()
end

-------------------- monaqa/dial.nvim
local function dial()
	require("mappings").dial()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		default = {
			augend.integer.alias.decimal,
			augend.integer.alias.decimal_int,
			augend.date.alias["%Y/%m/%d"],
			augend.semver.alias.semver,
			augend.constant.alias.bool,
			augend.constant.new({ elements = { "let", "const" } }),
			augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
		},
	})
end

-------------------- machakann/vim-highlightedyank
local function highlightedyank()
	-- require("options").highlightedyank()
end

-------------------- kana/vim-submode
local function submode()
	g.submode_timeout = false
	g.submode_keep_leaving_key = true
	g.submode_always_show_submode = true
	require("mappings").submode()
end

-------------------- kana/vim-arpeggio
local function arpeggio()
	require("mappings").arpeggio()
end

return {
	packer = packer,
	tokyonight = tokyonight,
	fm = fm,
	gitsigns = gitsigns,
	indentscope = indentscope,
	bufferline = bufferline,
	neoformat = neoformat,
	splitjoin = splitjoin,
	targets = targets,
	wordmotion = wordmotion,
	cutlass = cutlass,
	sneak = sneak,
	fzf = fzf,
	dial = dial,
	highlightedyank = highlightedyank,
	arpeggio = arpeggio,
	comment = comment,
	project = project,
	numb = numb,
	colorizer = colorizer,
	indentwise = indentwise,
	textobjuser = textobjuser,
	submode = submode,
}
