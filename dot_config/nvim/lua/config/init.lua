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
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	g.tokyonight_colors = { green = "magenta2" }
	cmd("colorscheme tokyonight")
end

-------------------- jeetsukumaran/vim-indentwise
local function indentwise()
	require("mappings").indentwise()
end

-------------------- is0n/fm-nvim
local function fm()
	require("mappings").fm()
	require("fm-nvim").setup({
		edit_cmd = "edit",
		ui = {
			default = "float",
			float = {
				border = "none",
				float_hl = "Normal",
				border_hl = "FloatBorder",
				blend = 0,
				height = 999,
				width = 999,
			},
			split = {
				direction = "topleft",
				size = 24,
			},
		},
		cmds = {
			vifm_cmd = "vifm",
		},
		mappings = {
			-- vert_split = "<C-v>",
			-- horz_split = "<C-h>",
			-- tabedit = "<C-t>",
			-- edit = "<C-e>",
			-- ESC = "<ESC>",
		},
	})
end

-------------------- lewis6991/gitsigns.nvim
local function gitsigns()
	require("gitsigns").setup({
		current_line_blame_opts = {
			delay = 0,
		},
		on_attach = require("mappings").gitsigns,
		signs = {
			add = {
				hl = "GitSignsAdd",
				text = "+",
				numhl = "GitSignsAddNr",
				linehl = "GitSignsAddLn",
			},
			change = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
			delete = {
				hl = "GitSignsDelete",
				text = "_",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			topdelete = {
				hl = "GitSignsDelete",
				text = "‾",
				numhl = "GitSignsDeleteNr",
				linehl = "GitSignsDeleteLn",
			},
			changedelete = {
				hl = "GitSignsChange",
				text = "~",
				numhl = "GitSignsChangeNr",
				linehl = "GitSignsChangeLn",
			},
		},
	})
end

-------------------- echasnovski/mini.nvim
local function indentscope()
	local indentscope = require("mini.indentscope")
	indentscope.setup({
		draw = {
			delay = 0,
			animation = indentscope.gen_animation("none"),
		},
		mappings = {
			object_scope = "ii",
			object_scope_with_border = "ai",
			goto_top = "",
			goto_bottom = "",
			-- goto_top = "<S-CR>",
			-- goto_bottom = "<CR>",
		},
		options = {
			border = "both",
			indent_at_cursor = true,
			try_as_border = true,
		},
		symbol = "▏",
	})
	require("autocmd").indentscope()
end

-------------------- akinsho/bufferline.nvim
local function bufferline()
	require("mappings").bufferline()
	require("bufferline").setup({
		options = {
			indicator_icon = " ",
			separator_style = { "", "" },
			tab_size = 0,
			close_icon = "",
		},
		highlights = {
			buffer_selected = {
				gui = "bold",
			},
		},
	})
end

-------------------- sbdchd/neoformat
local function neoformat()
	-- Enable lua formater
	g.neoformat_enabled_lua = { "stylua" }
	-- Format on write
	require("autocmd").neoformat()

	-- vim.cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
	-- vim.cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
	-- vim.api.nvim_command([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])
	-- vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	require("mappings").splitjoin()
	g.splitjoin_split_mapping = ""
	g.splitjoin_join_mapping = ""
end

-------------------- wellle/targets.vim
local function targets()
	require("mappings").targets()
	cmd([[
	let g:targets_gracious = 1
  let g:targets_nl = 'sh'
	]])
	require("autocmd").targets()
end

-------------------- gbprod/cutlass.nvim
local function cutlass()
	require("cutlass").setup({
		cut_key = "m",
		override_del = true,
		exclude = { "ns", "nS" },
	})
end

-------------------- justinmk/vim-sneak
local function sneak()
	require("mappings").sneak()

	cmd([[
	let g:sneak#use_ic_scs = 1
	]])
end

-------------------- numToStr/Comment.nvim
local function comment()
	require("Comment").setup()
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

	cmd([[
	"call textobj#user#plugin('word', {
	"\   'word': {
	"\     'pattern': '\<\w\+\>',
	"\     'move-n': 'w',
	"\     'move-p': 'b',
	"\     'move-N': 'e',
	"\     'move-P': 'ge',
	"\     'select': 'iw',
	"\   },
	"\ })
	"]])
end

-------------------- ibhagwan/fzf-lua
local function fzf()
	require("mappings").fzf()
	local actions = require("fzf-lua.actions")
	require("fzf-lua").setup({
		winopts = {
			fullscreen = true,
			border = "none",
			preview = {
				layout = "horizontal",
				horizontal = "up:70%",
				title = false,
				delay = 0,
				scrollchars = { "▎", "" },
			},
		},
		quickfix = {
			file_icons = true,
			git_icons = true,
		},
		keymap = {
			builtin = {},
			fzf = {
				-- ["tab"] = "down",
				-- ["btab"] = "up",
				["ctrl-e"] = "preview-page-down",
				["ctrl-u"] = "preview-page-up",
			},
		},
		-- actions = {
		-- 	files = {
		-- 		-- ["default"] = actions.file_edit,
		-- 		-- ["alt-q"] = actions.file_sel_to_qf,
		-- 	},
		-- },
	})
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
	g.highlightedyank_highlight_duration = 100
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
