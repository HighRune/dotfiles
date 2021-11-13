function setup()
	-- local map = vim.api.nvim_set_keymap
	-- require("mappings").miniyank()
	-- map("", "p", "<Plug>(miniyank-autoput)", { silent = true })
	-- map("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
	-- map("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
	-- map("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
	vim.g.miniyank_maxitems = 5
end

return { setup = setup }
