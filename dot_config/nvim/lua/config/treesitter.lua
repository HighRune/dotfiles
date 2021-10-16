local M = {}

function M.post()
	require("nvim-treesitter.configs").setup({
		context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
			enable = true,
		},
		autotag = {
			enable = true,
		},
		rainbow = { -- p00f/nvim-ts-rainbow
			enable = true,
			extended_mode = true,
			max_file_lines = nil,
		},
		ensure_installed = "maintained",
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn",
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		playground = { -- nvim-treesitter/playground
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
			keybindings = {
				toggle_query_editor = "o",
				toggle_hl_groups = "i",
				toggle_injected_languages = "t",
				toggle_anonymous_nodes = "a",
				toggle_language_display = "I",
				focus_language = "f",
				unfocus_language = "F",
				update = "R",
				goto_node = "<cr>",
				show_help = "?",
			},
		},
	})
	vim.o.foldmethod = "expr"
	vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

return M
