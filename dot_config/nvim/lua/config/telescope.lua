local function setup()
	require("telescope").setup({
		defaults = {
			border = true,
			borderchars = {
				results = { "_", " ", " ", " ", " ", " ", " ", " " },
				prompt = { "_", " ", " ", " ", " ", " ", " ", " " },
				preview = { "_", " ", " ", " ", " ", " ", " ", " " },
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
