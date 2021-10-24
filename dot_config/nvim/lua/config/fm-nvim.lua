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
		horz_split = "<C-h>",
		tabedit = "<C-h>",
		edit = "<C-e>",
	},
})
