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
					north = 1,
					east = 2,
					south = 3,
					west = 4,
				},
				x_max_len = 40,
				border = "solid",
			},
			pum = {
				kind_context = { "", "" },
				source_context = { "", "" },
				x_truncate_len = 9999,
			},
			ghost_text = {
				enabled = false,
				-- context = { " ", "" },
				-- highlight_group = "none",
				-- highlight_group = "Pmenu",
			},
			icons = {
				mode = "none",
			},
		},
		keymap = {
			jump_to_mark = "<c-cr>",
			bigger_preview = "",
			["repeat"] = "<c-.>",
		},
	}
end

return { setup = setup }
