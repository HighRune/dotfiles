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

-------------------- folke/tokyonight.nvim
local function tokyonight()
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd("colorscheme tokyonight")
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
		height = 1,
		width = 1,
		-- Command used to open files: 'tabedit'; 'split'; 'pedit'; ...
		edit_cmd = "edit",
		-- Terminal commands used w/ file manager
		cmds = {
			vifm_cmd = "vifm",
		},
		-- Mappings used inside the floating window
		mappings = {
			vert_split = "<C-v>",
			-- horz_split = "<C-h>",
			-- tabedit = "<C-h>",
			edit = "<C-e>",
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
	-- miniyank = miniyank,
	surround = surround,
	wordmotion = wordmotion,
	tokyonight = tokyonight,
	neoformat = neoformat,
	fm = fm,
	indentBlankline = indentBlankline,
}
