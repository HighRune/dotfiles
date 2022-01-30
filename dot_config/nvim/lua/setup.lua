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
local function searchPulse()
	g.vim_search_pulse_mode = "pattern"
	g.vim_search_pulse_duration = 200
end

-------------------- bfredl/nvim-miniyank
-- local function miniyank()
-- 	g.miniyank_maxitems = 5
-- end

-------------------- blackCauldron7/surround.nvim

local function surround()
	require("surround").setup({
		load_keymaps = false,
		quotes = { "'", '"', "`" },
		context_offset = 50,
	})
end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
	cmd("let g:wordmotion_nomap = 1")
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
	let g:sneak#s_next = 1
	map s <Plug>Sneak_s
  map S <Plug>Sneak_S
	]])
end

return {
	packer = packer,
	searchPulse = searchPulse,
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
	-- miniyank = miniyank,
}
