local function setup()
	require("indent_blankline").setup({
		show_end_of_line = true,
		filetype_exclude = { "help" },
		buftype_exclude = { "terminal", "nofile" },
	})
	vim.g.indent_blankline_enabled = true
	vim.g.indent_blankline_show_first_indent_level = false
end

return { setup = setup }
