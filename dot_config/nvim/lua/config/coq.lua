local function setup()
	vim.g.coq_settings = {
		auto_start = "shut-up",
		-- weights = {
		-- 	prefix_matches = 0.5,
		-- },
		-- match = {
		-- 	exact_matches = 10,
		-- 	fuzzy_cutoff = 0.8,
		-- },
		display = {
			preview = {
				positions = {
					east = 1,
					north = 2,
					south = 3,
					west = 4,
				},
				x_max_len = 40,
				border = "solid",
			},
			pum = {
				kind_context = { " ", "" },
				source_context = { "", "" },
				fast_close = true,
				-- x_truncate_len = 9999,
			},
			ghost_text = {
				enabled = false,
				-- context = { " ", "" },
				-- highlight_group = "none",
				-- highlight_group = "Pmenu",
			},
			-- icons = {
			-- 	mode = "none",
			-- },
		},
		keymap = {
			jump_to_mark = "<c-cr>",
			bigger_preview = "",
			["repeat"] = "<leader>.",
		},
	}
	vim.cmd([[
let g:coq_settings = { "keymap.recommended": v:false }

ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>`^"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
  ]])
end

return { setup = setup }
