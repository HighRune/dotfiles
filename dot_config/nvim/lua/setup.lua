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
	g.solarized_termtrans = 0
	cmd("colorscheme solarized")
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

-------------------- is0n/fm-nvim
local function fm()
	require("fm-nvim").setup({
		border = "none",
		height = 999,
		width = 999,
		-- Command used to open files: 'tabedit'; 'split'; 'pedit'; ...
		edit_cmd = "edit",
		-- Terminal commands used w/ file manager
		cmds = {
			vifm_cmd = "vifm",
		},
		-- Mappings used inside the floating window
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
	-- miniyank = miniyank,
}
