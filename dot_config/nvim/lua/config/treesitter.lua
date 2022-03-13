require("nvim-treesitter.configs").setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	-- windwp/nvim-autopairs
	autopairs = {
		enable = true,
	},
	-- JoosepAlviste/nvim-ts-context-commentstring
	-- context_commentstring = {
	-- 	enable = true,
	-- },
	-- windwp/nvim-ts-autotag
	autotag = {
		enable = true,
	},
	-- p00f/nvim-ts-rainbow
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	-- andymass/vim-matchup
	-- matchup = {
	-- 	enable = true,
	-- },
	-- nvim-treesitter/nvim-treesitter-textobjects
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@call.outer",
				["ic"] = "@call.inner",
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]]"] = "@function.outer",
			},
			goto_previous_start = {
				["[["] = "@function.outer",
			},
		},
		-- swap = {
		-- 	enable = true,
		-- 	swap_next = {
		-- 		["<c-k>"] = "@parameter.inner",
		-- 	},
		-- 	swap_previous = {
		-- 		["<c-j>"] = "@parameter.inner",
		-- 	},
		-- },
	},
	-- nvim-treesitter/playground
	-- playground = {
	-- 	enable = true,
	-- 	disable = {},
	-- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
	-- 	persist_queries = false, -- Whether the query persists across vim sessions
	-- 	keybindings = {
	-- 		toggle_query_editor = "o",
	-- 		toggle_hl_groups = "i",
	-- 		toggle_injected_languages = "t",
	-- 		toggle_anonymous_nodes = "a",
	-- 		toggle_language_display = "I",
	-- 		focus_language = "f",
	-- 		unfocus_language = "F",
	-- 		update = "R",
	-- 		goto_node = "<cr>",
	-- 		show_help = "?",
	-- 	},
	-- },
})
