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
			icons = {
				mode = "long",
				spacing = 1,
				aliases = {
					Conditional = "Keyword",
					Float = "Number",
					Include = "Property",
					Label = "Keyword",
					Member = "Property",
					Repeat = "Keyword",
					Structure = "Struct",
					Type = "TypeParameter",
				},
				mappings = {
					Boolean = "",
					Character = "",
					Class = "",
					Color = "",
					Constant = "",
					Constructor = "",
					Enum = "",
					EnumMember = "",
					Event = "ﳅ",
					Field = "",
					File = "",
					Folder = "",
					Function = "ﬦ",
					Interface = "",
					Keyword = "",
					Method = "",
					Module = "",
					Number = "",
					Operator = "Ψ",
					Parameter = "",
					Property = "ﭬ",
					Reference = "",
					Snippet = "",
					String = "",
					Struct = "ﯟ",
					Text = "",
					TypeParameter = "",
					Unit = "",
					Value = "",
					Variable = "ﳛ",
				},
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
