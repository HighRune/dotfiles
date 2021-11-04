local function setup()
	require("indent_blankline").setup({
		indent_blankline_enabled = true,
		indent_blankline_show_first_indent_level = false,
		show_end_of_line = true,
		filetype_exclude = { "help" },
		buftype_exclude = { "terminal", "nofile" },
	})
end

return { setup = setup }
