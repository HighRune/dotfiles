local function setup()
	require("telescope").setup({
		defaults = {
			layout_strategy = "vertical",
			layout_config = {
				preview_cutoff = 0,
				height = 0.999,
				width = 0.999,
			},
			mappings = {
				i = {
					["<esc>"] = require("telescope.actions").close,
				},
			},
		},
	})
	-- require("mappings").telescope()
end

return { setup = setup }
