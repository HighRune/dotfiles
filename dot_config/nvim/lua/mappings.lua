local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-------------------- nvim-telescope/telescope.nvim
local function telescope()
	map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end
local function miniyank()
	map("", "p", "<Plug>(miniyank-autoput)", { silent = true })
	map("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
	map("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
	map("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
end

return {
	telescope = telescope,
	miniyank = miniyank,
}
