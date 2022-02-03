local map = vim.api.nvim_set_keymap
local mapb = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd
local mapset = vim.keymap.set
-- local call = vim.call
local opts = { noremap = true, silent = true }

local function vanilla()
	-- Help
	cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab h' : 'h'")
	cmd("cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'tab help' : 'help'")
	-- Disable keys
	mapset("", "Q", "<nop>")
	mapset("", "q", "<nop>")
	-- Quit
	mapset("n", "<c-q>", ":q<cr>")
	mapset("i", "<c-q>", "<esc>:q<cr>")
	-- Save
	mapset("n", "<C-s>", ":w<cr>")
	mapset("i", "<C-s>", "<esc>`^:w<cr>")
	-- Esc
	mapset("n", "<esc>", "<esc>^")
	-- Scroll
	mapset({ "n", "x" }, "<C-u>", "5k")
	mapset({ "n", "x" }, "<C-e>", "5j")
	-- Readline
	mapset("i", "<C-a>", "<esc>I")
	mapset("i", "<C-e>", "<end>")
	mapset("i", "<C-k>", "<esc>ld$i")
	-- Movements
	mapset("n", "k", "gk")
	mapset("n", "j", "gj")
	-- Line
	mapset("n", "0", "g0")
	mapset("n", "$", "g$:set ve= ve=all<cr>")
	mapset("n", "^", "g^")
	-- mapset("n", "gm", "(virtcol('$') / 2) . '<Bar>'", { expr = true })
	-- Operators
	mapset("o", "b", "ib")
	mapset("o", "w", "iw")
	mapset("o", "W", "iW")
	mapset({ "o", "x" }, "q", "iq")
	mapset({ "o", "x" }, "nb", "inb")
	mapset({ "o", "x" }, "nq", "inq")
	mapset({ "o", "x" }, "lb", "ilb")
	mapset({ "o", "x" }, "lq", "ilq")
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
	map("n", "<leader><leader>", "<cmd>lua require('fzf-lua').files()<CR>", opts)
	map("n", "<leader>s", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", opts)
end
-------------------- blackCauldron7/surround.nvim
local function surround()
	map("n", "ys", "<cmd>lua require('surround').surround_add(true)<cr>", opts)
	map("n", "cs", "<cmd>lua require('surround').surround_replace()<cr>", opts)
	map("n", "ds", "<cmd>lua require('surround').surround_delete()<cr>", opts)
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
	-- cmd([["
	-- map - <Plug>(IndentWisePreviousLesserIndent)
	-- map = <Plug>(IndentWiseNextGreaterIndent)
	-- "]])
end

-------------------- justinmk/vim-sneak
local function sneak()
	mapset("n", "s", "<Plug>Sneak_s")
	mapset("n", "S", "<Plug>Sneak_S")
	mapset("n", "f", "<Plug>Sneak_f")
	mapset("n", "F", "<Plug>Sneak_F")
	mapset("n", "t", "<Plug>Sneak_t")
	mapset("n", "T", "<Plug>Sneak_T")
	map("", "n", [[sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n']], { expr = true })
	map("", "N", [[sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N']], { expr = true })
end
-------------------- akinsho/bufferline.nvim
local function bufferline()
	map("n", "<tab>", ":BufferLineCycleNext<cr>", opts)
	map("n", "<s-tab>", ":BufferLineCyclePrev<cr>", opts)
	map("n", "<c-w>", ":bw<cr>", opts)
	map("n", "<pageup>", ":BufferLineMovePrev<cr>", opts)
	map("n", "<pagedown>", ":BufferLineMoveNext<cr>", opts)
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	map("n", "gj", ":SplitjoinJoin<cr>", opts)
	map("n", "gk", ":SplitjoinSplit<cr>", opts)
end

-------------------- svermeulen/vim-cutlass
local function cutlass()
	-- 	map("n", "gm", "m", opts)
	-- 	map("n", "m", "d", opts)
	-- 	map("x", "m", "d", opts)
	-- 	map("n", "mm", "dd", opts)
	-- 	map("n", "M", "D", opts)
end
-------------------- is0n/fm-nvim
local function fm()
	map("n", "<leader>n", ":Vifm<cr>", opts)
end
-------------------- kana/vim-arpeggio
local function arpeggio()
	-- call("arpeggio#map", "n", "e", 0, "hl", "(virtcol('$') / 2) . '<Bar>'")
	-- map("n", "<Plug>(arpeggio-default:s)", "l", opts)
end
-------------------- monaqa/dial.nvim
local function dial()
	map("n", "<C-a>", "<Plug>(dial-increment)", {})
	map("n", "<C-x>", "<Plug>(dial-decrement)", {})
	map("v", "<C-a>", "<Plug>(dial-increment)", {})
	map("v", "<C-x>", "<Plug>(dial-decrement)", {})
	map("v", "g<C-a>", "<Plug>(dial-increment-additional)", {})
	map("v", "g<C-x>", "<Plug>(dial-decrement-additional)", {})
end
-------------------- chaoren/vim-wordmotion
local function wordmotion()
	-- cmd([[
	-- nmap W          <Plug>WordMotion_w
	-- nmap B          <Plug>WordMotion_b
	-- nmap E          <Plug>WordMotion_e
	-- nmap gE         <Plug>WordMotion_ge
	-- omap aW         <Plug>WordMotion_aw
	-- omap iW         <Plug>WordMotion_iw
	-- ]])
	map("n", "W", "<Plug>WordMotion_w", {})
	map("n", "B", "<Plug>WordMotion_b", {})
	map("n", "E", "<Plug>WordMotion_e", {})
	map("n", "gE", "<Plug>WordMotion_ge", {})
	map("o", "aW", "<Plug>WordMotion_aw", {})
	map("o", "iW", "<Plug>WordMotion_iw", {})
end
-------------------- neovim/nvim-lspconfig
local function lspconfig(buffer)
	mapb(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	mapb(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	mapb(buffer, "n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	mapb(buffer, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	mapb(buffer, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	mapb(buffer, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	mapb(buffer, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	mapb(buffer, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	mapb(buffer, "n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	mapb(buffer, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	mapb(buffer, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	mapb(buffer, "n", "<left>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	mapb(buffer, "n", "<right>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	mapb(buffer, "n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' ))<CR>"
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
end

local function coq()
	map("i", "<Esc>", [[pumvisible() ? "<C-e><Esc>`^" : "<Esc>`^"]], { expr = true, noremap = true })
	map("i", "<C-c>", [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], { expr = true, noremap = true })
	map("i", "<Tab>", [[pumvisible() ? "<C-n>" : "<Tab>"]], { expr = true, noremap = true })
	map("i", "<S-Tab>", [[pumvisible() ? "<C-p>" : "<BS>"]], { expr = true, noremap = true })

	-- cmd([[
	-- ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>`^" : "\<Esc>`^"
	-- ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
	-- ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
	-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
	-- ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
	-- ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
	-- ]])
end

-- local function pounce()
-- cmd([[
-- nmap s <cmd>Pounce<CR>
-- xmap s <cmd>Pounce<CR>
-- ]])
-- end
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
	cutlass = cutlass,
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
	-- pounce = pounce,
	-- miniyank = miniyank,
	-- sideways = sideways,
	-- camelCaseMotion = camelCaseMotion,
}
