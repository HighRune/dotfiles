local function setup()
	require("lsp_signature").setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		handler_opts = {
			border = "single",
		},
		doc_lines = 0,
		hint_prefix = "",
		hint_scheme = "Comment",
		tranpancy = 100,
		floating_window = false,
		max_width = 80,
		always_trigger = true,
		max_height = 15,
		hint_enable = true,
	})
end

return { setup = setup }
