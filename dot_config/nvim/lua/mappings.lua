local opts = { noremap = true, silent = true }

-------------------- nvim-telescope/telescope.nvim
local function telescope()
	vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end

return { telescope = telescope }
