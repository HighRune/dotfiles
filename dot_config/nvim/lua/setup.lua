local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local call = vim.call
local api = vim.api

-------------------- norcalli/nvim-colorizer.lua
local function colorizer()
	require("colorizer").setup()
end

-------------------- ahmedkhalf/project.nvim
local function project()
	require("project_nvim").setup()
end

-------------------- nacro90/numb.nvim
local function numb()
	require("numb").setup()
end

-------------------- ibhagwan/fzf-lua
local function fzf()
	-- local actions = require("fzf-lua.actions")
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

-------------------- is0n/fm-nvim
local function fm()
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

return {
	colorizer = colorizer,
	project = project,
	numb = numb,
	fm = fm,
	fzf = fzf,
	gitsigns = gitsigns,
}
