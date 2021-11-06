local function setup()
	vim.g.coq_settings = {
		auto_start = "shut-up",
		-- weights = {
		-- 	prefix_matches = 0.5,
		-- },
		-- match = {
		-- 	exact_matches = 10,
		-- 	fuzzy_cutoff = 0.8,
		-- },
		display = {
			preview = {
				positions = {
					east = 1,
					north = 2,
					south = 3,
					west = 4,
				},
			},
			ghost_text = {
				context = { " ", "" },
				highlight_group = "Comment",
			},
			icons = {
				mode = "none",
			},
		},
		keymap = {
			jump_to_mark = "<c-cr>",
			bigger_preview = "",
			["repeat"] = "<leader>.",
		},
	}
end

return { setup = setup }
