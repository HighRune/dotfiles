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
				x_max_len = 40,
				border = "solid",
			},
			pum = {
				kind_context = { " ", "" },
				source_context = { "", "" },
				fast_close = true,
				-- x_truncate_len = 9999,
			},
			ghost_text = {
				enabled = false,
				-- context = { " ", "" },
				-- highlight_group = "none",
				-- highlight_group = "Pmenu",
			},
			-- icons = {
			-- 	mode = "none",
			-- },
		},
		keymap = {
			recommended = false,
			jump_to_mark = "",
			bigger_preview = "",
			["repeat"] = "<leader>.",
		},
	}
end

return { setup = setup }
