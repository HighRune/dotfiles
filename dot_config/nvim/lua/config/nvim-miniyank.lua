function setup()
	-- require("mappings").miniyank()
	-- local map = vim.api.nvim_set_keymap
	vim.api.nvim_set_keymap("", "p", "<Plug>(miniyank-autoput)", { silent = true })
	vim.api.nvim_set_keymap("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
	vim.api.nvim_set_keymap("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
	vim.api.nvim_set_keymap("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
	vim.g.miniyank_maxitems = 5
end

return { setup = setup }
