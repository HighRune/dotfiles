local function setup()
	vim.g.coq_settings = {
		auto_start = "shut-up",
		display = {
			preview = {
				positions = {
					east = 1,
					north = 2,
					south = 3,
					west = 4,
				},
			},
		},
		keymap = {
			jump_to_mark = "",
			bigger_preview = "",
			-- jump_to_mark = "<c-i>",
		},
	}
end

return { setup = setup }
