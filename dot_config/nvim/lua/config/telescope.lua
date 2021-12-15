local function setup()
	require("telescope").setup({
		pickers = {
			find_files = {
				hidden = true,
			},
		},
		defaults = {
			border = true,
			borderchars = {
				results = { "-", " ", " ", " ", " ", " ", " ", " " },
				prompt = { "-", " ", " ", " ", " ", " ", " ", " " },
				preview = { "-", " ", " ", " ", " ", " ", " ", " " },
			},
			layout_strategy = "vertical",
			layout_config = {
				preview_cutoff = 0,
				height = 999,
				width = 999,
			},
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},
	})
	require("mappings").telescope()
end

return { setup = setup }
