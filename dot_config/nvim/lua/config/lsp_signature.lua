local function setup()
	require("lsp_signature").setup({
		bind = true, -- This is mandatory, otherwise border config won't get registered.
		hint_prefix = " ",
		hint_scheme = "function",
		always_trigger = true,
		timer_interval = 0,
		hint_enable = true,
		floating_window = false,
		-- handler_opts = {
		-- border = "single",
		-- },
		-- doc_lines = 0,
		-- padding = " ",
		-- max_width = 70,
		-- max_height = 1,
	})
end

return { setup = setup }
