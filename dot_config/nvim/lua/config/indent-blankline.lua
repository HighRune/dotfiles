opt.list = true
opt.listchars:append("eol:↴")
require("indent_blankline").setup({
	show_end_of_line = true,
	buftype_exclude = { "terminal", "nofile" },
})
