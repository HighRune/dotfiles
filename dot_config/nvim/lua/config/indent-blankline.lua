local function setup()
	require("indent_blankline").setup({
		show_end_of_line = true,
		filetype_exclude = { "help" },
		buftype_exclude = { "terminal", "nofile" },
	})
end

return { setup = setup }
