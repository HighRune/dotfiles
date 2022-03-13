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

-------------------- folke/tokyonight.nvim
local function tokyonight()
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd("colorscheme tokyonight")
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

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	require("mappings").splitjoin()
	cmd([[
  let g:splitjoin_split_mapping = ''
  let g:splitjoin_join_mapping = ''
  ]])
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
}
