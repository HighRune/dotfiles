require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			preview_cutoff = 0,
			height = 0.999,
			width = 0.999,
		},
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
	},
})
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
