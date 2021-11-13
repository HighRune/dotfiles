local function setup()
	require("surround").setup({
		load_keymaps = false,
		quotes = { "'", '"', "`" },
		context_offset = 50,
	})
	require("mappings").surround()
end

return { setup = setup }
