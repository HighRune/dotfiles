local g = vim.g
local cmd = vim.cmd

-------------------- wbthomason/packer.nvim
local function packer()
	cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
end

-------------------- monaqa/dial.nvim
local function dial()
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

-------------------- akinsho/bufferline.nvim
local function bufferline()
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

-------------------- inside/vim-search-pulse
local function pulse()
	-- g.vim_search_pulse_disable_auto_mappings = 1
	-- g.vim_search_pulse_mode = "pattern"
	-- g.vim_search_pulse_duration = 200
end

-------------------- bfredl/nvim-miniyank
-- local function miniyank()
-- 	g.miniyank_maxitems = 5
-- end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
	-- let g:wordmotion_nomap = 1
	cmd([[
	let g:wordmotion_spaces = '_-.:'
	]])
end

-------------------- phaazon/hop.nvim
local function hop()
	require("hop").setup({
		keys = "aoeuhtn;qjkmwvzpgcr",
		quit_key = "s",
	})
	cmd("hi HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold")
	cmd("hi HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold")
	cmd("hi HopNextKey2 guifg=#00dfff ctermfg=33")
	-- cmd("highlight default HopUnmatched guifg=#666666 guibg=bg guisp=#666666 ctermfg=242")
	-- cmd("highlight default link HopCursor Cursor")
end

-------------------- folke/tokyonight.nvim
local function tokyonight()
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd("colorscheme tokyonight")
end

-------------------- ishan9299/nvim-solarized-lua
local function solarized()
	g.solarized_termtrans = 1
	cmd("colorscheme solarized-low")
end

-------------------- sbdchd/neoformat
local function neoformat()
	cmd("let g:neoformat_enabled_lua = ['stylua']") -- Enable lua formater
	-- Format on write
	cmd([[
augroup fmt
  autocmd!
  au BufWritePre *.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]])
	-- vim.cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
	-- vim.cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
	-- vim.api.nvim_command([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])
	-- vim.api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })
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
			goto_top = "<S-CR>",
			goto_bottom = "<CR>",
		},
		options = {
			border = "both",
			indent_at_cursor = true,
			try_as_border = true,
		},
		symbol = "▏",
	})
end

local function surround()
	local surround = require("mini.surround")
	surround.setup({
		n_lines = 20,
		highlight_duration = 500,
		funname_pattern = "[%w_%.]+",
		mappings = {
			add = "",
			delete = "",
			find = "",
			find_left = "",
			highlight = "",
			replace = "",
			update_n_lines = "",
		},
	})
end

-------------------- lewis6991/gitsigns.nvim
local function gitsigns()
	require("gitsigns").setup({
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

-------------------- is0n/fm-nvim
local function fm()
	require("fm-nvim").setup({
		-- (Vim) Command used to open files
		edit_cmd = "edit",

		-- UI Options
		ui = {
			-- Default UI (can be "split" or "float")
			default = "float",
			float = {
				-- Floating window border (see ':h nvim_open_win')
				border = "none",
				-- Highlight group for floating window/border (see ':h winhl')
				float_hl = "Normal",
				border_hl = "FloatBorder",
				-- Floating Window Transparency (see ':h winblend')
				blend = 0,
				-- Num from 0 - 1 for measurements
				height = 999,
				width = 999,
				-- X and Y Axis of Window
				-- x = 0.5,
				-- y = 0.5,
			},
			split = {
				-- Direction of split
				direction = "topleft",
				-- Size of split
				size = 24,
			},
		},

		-- Terminal commands used w/ file manager (have to be in your $PATH)
		cmds = {
			vifm_cmd = "vifm",
		},

		-- Mappings used with the plugin
		mappings = {
			-- vert_split = "<C-v>",
			-- horz_split = "<C-h>",
			-- tabedit = "<C-t>",
			-- edit = "<C-e>",
			-- ESC = "<ESC>",
		},
	})
end

-------------------- lukas-reineke/indent-blankline.nvim
local function indentBlankline()
	require("indent_blankline").setup({
		show_end_of_line = true,
		filetype_exclude = { "help" },
		buftype_exclude = { "terminal", "nofile" },
	})
	g.indent_blankline_enabled = true
	g.indent_blankline_show_first_indent_level = false
end

-------------------- rlane/pounce.nvim
local function pounce()
	require("pounce").setup({
		accept_keys = "AOEUHTNSID:QJKMWVZ",
		accept_best_key = "<space>",
		multi_window = true,
		debug = false,
	})
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	cmd([[
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_join_mapping = ''
  ]])
end

-------------------- gbprod/cutlass.nvim
local function cutlass()
	require("cutlass").setup({
		cut_key = "m",
		override_del = true,
	})
end

-------------------- justinmk/vim-sneak
local function sneak()
	cmd([[
	let g:sneak#use_ic_scs = 1
	]])
end

-------------------- machakann/vim-highlightedyank
local function highlightedyank()
	cmd("let g:highlightedyank_highlight_duration = 100")
end

-------------------- wellle/targets.vim
local function targets()
	cmd([[
	let g:targets_gracious = 1
	autocmd User targets#mappings#user call targets#mappings#extend({
	\ 'a': {'argument': [{'o': '(', 'c': ')', 's': ','}]},
	\ 'p': {'argument': [{'o': '{', 'c': '}', 's': ','}]},
	\ 'A': {'pair': [{'o':'(', 'c':')'}]},
	\ 'P': {'pair': [{'o':'{', 'c': '}'}]},
	\ 'Q': {'quote': [{'d': '`'}]},
	\ })
	]])
	-- cmd([[
	-- autocmd User targets#mappings#user call targets#mappings#extend({
	-- \ 'a': {'argument': [{'o': '[[(]', 'c': '[])]', 's': ','}]},
	-- \ 'A': {'argument': [{'o': '{', 'c': '}', 's': ','}]},
	-- \ 'b': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'<', 'c':'>'}]},
	-- \ 'B': {'pair': [{'o':'{', 'c': '}'}]},
	-- \ })
	-- ]])
end

-------------------- ibhagwan/fzf-lua
local function fzf()
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
		keymap = {
			builtin = {
				["<C-e>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
			},
			-- fzf = {
			-- 	["ctrl-e"] = "preview-page-down",
			-- 	["ctrl-u"] = "preview-page-up",
			-- },
		},
	})
end

return {
	packer = packer,
	pulse = pulse,
	surround = surround,
	wordmotion = wordmotion,
	tokyonight = tokyonight,
	solarized = solarized,
	neoformat = neoformat,
	fm = fm,
	indentBlankline = indentBlankline,
	hop = hop,
	bufferline = bufferline,
	gitsigns = gitsigns,
	pounce = pounce,
	cutlass = cutlass,
	sneak = sneak,
	fzf = fzf,
	dial = dial,
	targets = targets,
	highlightedyank = highlightedyank,
	splitjoin = splitjoin,
	indentscope = indentscope,
	-- miniyank = miniyank,
}
