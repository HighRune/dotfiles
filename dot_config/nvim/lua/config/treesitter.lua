local function setup()
	require("nvim-treesitter.configs").setup({
		ensure_installed = "maintained",
		highlight = {
			enable = true,
		},
		indent = {
			enable = true,
		},
		autopairs = {
			enable = true,
		},
		-- JoosepAlviste/nvim-ts-context-commentstring
		context_commentstring = {
			enable = true,
		},
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
		-- incremental_selection = {
		-- 	enable = true,
		-- 	keymaps = {
		-- 		init_selection = "<cr>",
		-- 		node_incremental = "<cr>",
		-- 		-- scope_incremental = "<cr>",
		-- 		node_decremental = "<s-cr>",
		-- 	},
		-- },
		-- nvim-treesitter/nvim-treesitter-textobjects
		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["ap"] = "@parameter.outer",
					["ip"] = "@parameter.inner",
					-- ["ai"] = "@conditional.outer",
					-- ["ii"] = "@conditional.inner",
					-- ["al"] = "@loop.outer",
					-- ["il"] = "@loop.inner",
				},
			},
			-- move = {
			-- 	enable = true,
			-- 	set_jumps = true, -- whether to set jumps in the jumplist
			-- 	goto_next_start = {
			-- 		["<cr>"] = "@function.outer",
			-- 	},
			-- 	goto_previous_start = {
			-- 		["<s-cr>"] = "@function.outer",
			-- 	},
			-- },
			swap = {
				enable = true,
				swap_next = {
					["<c-k>"] = "@parameter.inner",
				},
				swap_previous = {
					["<c-j>"] = "@parameter.inner",
				},
			},
		},
		-- nvim-treesitter/playground
		playground = {
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
end

return { setup = setup }
