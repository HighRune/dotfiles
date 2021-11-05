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
			pre_select = true,
		},
	}
end

return { setup = setup }
