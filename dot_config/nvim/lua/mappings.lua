local cmd = vim.cmd
local map = vim.keymap.set
local silent = { silent = true }
local expr = { expr = true }
local remap = { remap = true }

local function vanilla()
	-- Help
	cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab h' : 'h'")
	cmd("cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'tab help' : 'help'")
	-- Disable keys
	map("", "Q", "<nop>")
	map("", "q", "<nop>")
	-- Quit
	map("n", "<c-q>", ":q<cr>")
	map("i", "<c-q>", "<esc>:q<cr>")
	-- Save
	map("n", "<C-s>", ":w<cr>")
	map("i", "<C-s>", "<esc>`^:w<cr>")
	-- Esc
	map("n", "<esc>", "<esc>^")
	-- Scroll
	map({ "n", "x" }, "<C-u>", "5k")
	map({ "n", "x" }, "<C-e>", "5j")
	-- Readline
	map("i", "<C-a>", "<esc>I")
	map("i", "<C-e>", "<end>")
	map("i", "<C-k>", "<esc>ld$i")
	-- Motions
	map("n", "k", "gk")
	map("n", "j", "gj")
	-- Line
	map("n", "0", "g0")
	map("n", "$", "g$:set ve= ve=all<cr>")
	map("n", "&", "g^")
	-- map("n", "gm", "(virtcol('$') / 2) . '<Bar>'", { expr = true })
	-- Words
	map("o", "w", "iw")
	map("o", "W", "iW", remap)

	-- Cut
	-- map("x", "d", "ygvd", opts)
	-- map("x", "c", "ygvc", opts)
	-- map("x", "x", "ygvx", opts)
	-- Join
	-- cmd([[
	-- " Like gJ, but always remove spaces
	-- fun! s:join_spaceless()
	-- execute 'normal! gJ'

	-- " Remove character under the cursor if it's whitespace.
	-- if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
	-- execute 'normal! dw'
	-- endif
	-- endfun

	-- " Map it to a key
	-- nnoremap J :call <SID>join_spaceless()<CR>
	-- ]])
end

-------------------- nvim-telescope/telescope.nvim
local function telescope()
	-- map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	-- map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	-- map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end

-------------------- junegunn/fzf
local function fzf()
	map("n", "<leader><leader>", "<cmd>lua require('fzf-lua').files()<CR>")
	map("n", "<leader>s", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>")
end

-------------------- blackCauldron7/surround.nvim
local function surround()
	map("v", "s", "<esc>gv<cmd>lua require('surround').surround_add(false)<cr>")
	map("n", "ys", "<cmd>lua require('surround').surround_add(true)<cr>")
	map("n", "cs", "<cmd>lua require('surround').surround_replace()<cr>")
	map("n", "ds", "<cmd>lua require('surround').surround_delete()<cr>")
	map("n", "q", "<cmd>lua require('surround').toggle_quotes()<cr>")
end

-------------------- wellle/targets.vim
local function targets()
	-- Text objects
	map("o", "b", "ib", remap)
	map("o", "nb", "inb", remap)
	map("o", "lb", "ilb", remap)
	map("o", "B", "iB", remap)
	map("o", "nB", "inB", remap)
	map("o", "lB", "ilB", remap)
	map("o", "q", "iq", remap)
	map("o", "lq", "ilq", remap)
	map("o", "nq", "inq", remap)
	map("o", "Q", "iQ", remap)
	map("o", "lQ", "ilQ", remap)
	map("o", "nQ", "inQ", remap)

	-- Motions
	map("n", "ga", "vinao<esc>", remap)
	map("n", "Ga", "vilao<esc>", remap)
	map("n", "gb", "vanbo<esc>", remap)
	map("n", "Gb", "valbo<esc>", remap)
	map("n", "gB", "vanBo<esc>", remap)
	map("n", "GB", "valBo<esc>", remap)
	map("n", "gq", "vanqo<esc>", remap)
	map("n", "Gq", "valqo<esc>", remap)
	map("n", "gQ", "vanQo<esc>", remap)
	map("n", "GQ", "valQo<esc>", remap)

	-- cmd([[
	-- nmap <silent> <Plug>goToNextQuote  vanqo<esc>
	-- \ :call repeat#set("\<Plug>goToNextQuote", v:count)<cr>
	-- nmap gq <Plug>goToNextQuote
	-- ]])
end

-------------------- phaazon/hop.nvim
local function hop()
	-- map("n", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
	-- map("v", "s", "<cmd>lua require('hop').hint_words()<cr>", {})

	-- map("n", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
	-- map("v", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
end

-------------------- inside/vim-search-pulse
local function pulse()
	-- cmd([[
	-- nmap n n<Plug>Pulse
	-- nmap N N<Plug>Pulse
	-- nmap * *<Plug>Pulse
	-- nmap # #<Plug>Pulse
	-- " Pulses cursor line on first match
	-- " when doing search with / or ?
	-- cmap <silent> <expr> <enter> search_pulse#PulseFirst()
	-- ]])
end

-------------------- jeetsukumaran/vim-indentwise
local function indentwise()
	map("n", "<S-cr>", "<Plug>(IndentWiseBlockScopeBoundaryBegin)")
	map("n", "<cr>", "<Plug>(IndentWiseBlockScopeBoundaryEnd)")
end

-------------------- justinmk/vim-sneak
local function sneak()
	map("n", "s", ":<C-U>call sneak#wrap('', 3, 0, 2, 0)<CR>")
	map("n", "S", ":<C-U>call sneak#wrap('', 3, 1, 2, 0)<CR>")
	map("n", "t", "8s", remap)
	map("n", "T", "8S", remap)
	map("n", "f", "<Plug>Sneak_f")
	map("n", "F", "<Plug>Sneak_F")
	-- map("n", "s", "<Plug>Sneak_s")
	-- map("n", "S", "<Plug>Sneak_S")
	-- map("n", "t", "<Plug>Sneak_t")
	-- map("n", "T", "<Plug>Sneak_T")
	vim.api.nvim_set_keymap("", "n", [[sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n']], expr)
	vim.api.nvim_set_keymap("", "N", [[sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N']], expr)
end

-------------------- akinsho/bufferline.nvim
local function bufferline()
	map("n", "<tab>", ":BufferLineCycleNext<cr>", silent)
	map("n", "<s-tab>", ":BufferLineCyclePrev<cr>", silent)
	map("n", "<c-w>", ":bw<cr>", silent)
	map("n", "<pageup>", ":BufferLineMovePrev<cr>", silent)
	map("n", "<pagedown>", ":BufferLineMoveNext<cr>", silent)
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	map("n", "gj", ":SplitjoinJoin<cr>")
	map("n", "gk", ":SplitjoinSplit<cr>")
end

-------------------- is0n/fm-nvim
local function fm()
	map("n", "<leader>n", ":Vifm<cr>")
end

-------------------- kana/vim-arpeggio
local function arpeggio()
	-- call("arpeggio#map", "n", "e", 0, "hl", "(virtcol('$') / 2) . '<Bar>'")
	-- map("n", "<Plug>(arpeggio-default:s)", "l")
end
-------------------- monaqa/dial.nvim
local function dial()
	map({ "n", "v" }, "<C-a>", "<Plug>(dial-increment)")
	map({ "n", "v" }, "<C-x>", "<Plug>(dial-decrement)")
	map("v", "g<C-a>", "<Plug>(dial-increment-additional)")
	map("v", "g<C-x>", "<Plug>(dial-decrement-additional)")
end

-------------------- Matt-A-Bennett/vim-surround-funk
local function funk()
	map({ "o", "x" }, "af", "<Plug>(SelectWholeFunction)")
	map({ "o", "x" }, "aF", "<Plug>(SelectWholeFUNCTION)")
	map({ "o", "x" }, "if", "<Plug>(SelectFunctionName)")
	map({ "o", "x" }, "iF", "<Plug>(SelectFunctionNAME)")
	map("n", "dSf", "<Plug>(DeleteSurroundingFunction)")
	map("n", "dSF", "<Plug>(DeleteSurroundingFUNCTION)")
	map("n", "cSf", "<Plug>(ChangeSurroundingFunction)")
	map("n", "cSF", "<Plug>(ChangeSurroundingFUNCTION)")
	map("n", "ySf", "<Plug>(YankSurroundingFunction)")
	map("n", "ySF", "<Plug>(YankSurroundingFUNCTION)")
	-- map({ "n", "v" }, "gs", "<Plug>(GripSurroundObject)")
	-- map({ "n", "v" }, "gS", "<Plug>(GripSurroundObjectNoPaste)")
end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
	map("n", "W", "<Plug>WordMotion_w")
	map("n", "B", "<Plug>WordMotion_b")
	map("n", "E", "<Plug>WordMotion_e")
	map("n", "gE", "<Plug>WordMotion_ge")
	map("o", "aW", "<Plug>WordMotion_aw")
	map("o", "iW", "<Plug>WordMotion_iw")
end

-------------------- neovim/nvim-lspconfig
local function lspconfig(buffer)
	map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = buffer })
	map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = buffer })
	map("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = buffer })
	map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = buffer })
	map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = buffer })
	map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = buffer })
	map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = buffer })
	map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = buffer })
	map("n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = buffer })
	map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", {
		buffer = buffer,
	})
	map("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", { buffer = buffer })
	map("n", "<left>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = buffer })
	map("n", "<right>", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = buffer })
	map("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = buffer })
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' ))<CR>"
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
end

local function coq()
	map("i", "<Esc>", [[pumvisible() ? "<C-e><Esc>`^" : "<Esc>`^"]], expr)
	map("i", "<C-c>", [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], expr)
	map("i", "<Tab>", [[pumvisible() ? "<C-n>" : "<Tab>"]], expr)
	map("i", "<S-Tab>", [[pumvisible() ? "<C-p>" : "<BS>"]], expr)
end

-------------------- AndrewRadev/sideways.vim
-- local function sideways()
-- map("n", "<c-j>", ":SidewaysLeft<cr>", opts)
-- map("n", "<c-k>", ":SidewaysRight<cr>", opts)
-- end
-------------------- bkad/CamelCaseMotion
-- local function camelCaseMotion()
-- cmd([[
-- map <silent> W <Plug>CamelCaseMotion_w
-- map <silent> B <Plug>CamelCaseMotion_b
-- map <silent> E <Plug>CamelCaseMotion_e
-- map <silent> gE <Plug>CamelCaseMotion_ge
-- omap <silent> iW <Plug>CamelCaseMotion_iw
-- omap <silent> iB <Plug>CamelCaseMotion_ib
-- omap <silent> iE <Plug>CamelCaseMotion_ie
-- xmap <silent> iW <Plug>CamelCaseMotion_iw
-- xmap <silent> iB <Plug>CamelCaseMotion_ib
-- xmap <silent> iE <Plug>CamelCaseMotion_ie
-- ]])
-- end
-------------------- bfredl/nvim-miniyank
-- local function miniyank()
-- map("", "p", "<Plug>(miniyank-autoput)", { silent = true })
-- map("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
-- map("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
-- map("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
-- end

return {
	vanilla = vanilla,
	telescope = telescope,
	surround = surround,
	splitjoin = splitjoin,
	arpeggio = arpeggio,
	fm = fm,
	wordmotion = wordmotion,
	lspconfig = lspconfig,
	hop = hop,
	bufferline = bufferline,
	coq = coq,
	fzf = fzf,
	dial = dial,
	sneak = sneak,
	pulse = pulse,
	indentwise = indentwise,
	funk = funk,
	targets = targets,
	-- pounce = pounce,
	-- miniyank = miniyank,
	-- sideways = sideways,
	-- camelCaseMotion = camelCaseMotion,
}
