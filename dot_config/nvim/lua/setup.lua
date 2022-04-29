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

return {
	colorizer = colorizer,
	project = project,
	numb = numb,
	fzf = fzf,
}
