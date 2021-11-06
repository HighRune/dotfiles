local function setup()
	vim.g.coq_settings = {
		auto_start = "shut-up",
		display = {
			preview = {
				positions = {
					east = 1,
					north = 2,
					south = 3,
					west = 4,
				},
			},
		},
		keymap = {
			recommended = false,
			-- jump_to_mark = "<c-n>",
			-- bigger_preview = "",
		},
	}
	vim.cmd([[
inoremap <expr> <C-n> pumvisible() ? "" : "\<C-n>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"

inoremap <expr> <C-p> pumvisible() ? "" : "\<C-p>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
  ]])
	-- vim.cmd([[
	-- ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
	-- ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
	-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
	-- ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	-- ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
	-- ]])
end

return { setup = setup }
