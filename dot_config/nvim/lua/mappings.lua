local map = vim.api.nvim_set_keymap
local mapb = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd
local call = vim.call
local opts = { noremap = true, silent = true }

local function vanilla()
	cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab h' : 'h'")
	map("n", "<c-l>", ":noh<cr>", opts)
	map("", "<s-q>", "<nop>", opts)
	map("", "q", "<nop>", opts)
	map("n", "<c-u>", "5k", opts)
	map("n", "<c-d>", "5j", opts)
	map("i", "<c-a>", "<esc>I", opts)
	map("i", "<c-e>", "<end>", opts)
	map("n", "k", "gk", opts)
	map("n", "j", "gj", opts)
	map("n", "0", "g0", opts)
	map("n", "$", "g$:set ve= ve=all<cr>", opts)
	map("n", "^", "g^", opts)
	map("n", "<s-h>", "^", {})
	map("n", "<s-l>", "$", {})
	map("x", "<s-h>", "^", {})
	map("x", "<s-l>", "$", {})
	map("n", "gm", "(virtcol('$') / 2) . '<Bar>'", { expr = true })
	map("o", "w", "iw", {})
	map("o", "W", "iW", {})
	map("o", "b", "ib", {})
	map("o", "l", "al", {})
end
-------------------- nvim-telescope/telescope.nvim
local function telescope()
	map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end
-------------------- blackCauldron7/surround.nvim
local function surround()
	map("n", "<c-b>", "<cmd>lua require('surround').toggle_brackets(0)<cr>", { noremap = true })
	map("n", "<c-q>", "<cmd>lua require('surround').toggle_quotes()<cr>", { noremap = true })
	map("n", "ys", "<cmd>set operatorfunc=SurroundAddOperatorMode<cr>g@", { noremap = true })
	map("n", "cs", "<cmd>lua require('surround').surround_replace()<cr>", { noremap = true })
	map("n", "ds", "<cmd>lua require('surround').surround_delete()<cr>", { noremap = true })
	-- map("v", "s", "<esc>gv<cmd>lua require'surround'.surround_add()<cr>", { noremap = true })
end
-------------------- phaazon/hop.nvim
local function hop()
	map("n", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
	-- map("n", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
	-- map("v", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
	-- map("v", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
end
-------------------- romgrk/barbar.nvim
local function barbar()
	map("n", "<tab>", ":BufferNext<CR>", opts)
	map("n", "<s-tab>", ":BufferPrevious<CR>", opts)
	map("n", "<c-w>", ":BufferClose<CR>", opts)
end
-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
	map("n", "gj", ":SplitjoinJoin<cr>", opts)
	map("n", "gk", ":SplitjoinSplit<cr>", opts)
end
-------------------- svermeulen/vim-cutlass
local function cutlass()
	map("n", "cy", "c", opts)
	map("n", "dy", "d", opts)
end
-------------------- is0n/fm-nvim
local function fm()
	map("n", "<leader>n", ":Vifm<cr>", opts)
end
-------------------- kana/vim-arpeggio
local function arpeggio()
	call("arpeggio#map", "n", "e", 0, "hl", "(virtcol('$') / 2) . '<Bar>'")
end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
	cmd([[
nmap W          <Plug>WordMotion_w
nmap B          <Plug>WordMotion_b
nmap E          <Plug>WordMotion_e
nmap gE         <Plug>WordMotion_ge
omap aW         <Plug>WordMotion_aw
omap iW         <Plug>WordMotion_iw
]])
	-- 	map("n", "W", "<Plug>WordMotion_w", {})
	-- 	map("n", "B", "<Plug>WordMotion_b", {})
	-- 	map("n", "E", "<Plug>WordMotion_e", {})
	-- 	map("n", "gE", "<Plug>WordMotion_ge", {})
	-- 	map("o", "aW", "<Plug>WordMotion_aw", {})
	-- 	map("o", "iW", "<Plug>WordMotion_iw", {})
end
-------------------- neovim/nvim-lspconfig
local function lspconfig(buffer)
	mapb(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	mapb(buffer, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	mapb(buffer, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	mapb(buffer, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	mapb(buffer, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	mapb(buffer, "n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	mapb(buffer, "n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	mapb(buffer, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	mapb(buffer, "n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	mapb(buffer, "n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	mapb(buffer, "n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	mapb(buffer, "n", "<C-up>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	mapb(buffer, "n", "<C-down>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	mapb(buffer, "n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	mapb(buffer, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- { "n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" }
	-- { "n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" }
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' ))<CR>"
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
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
	cutlass = cutlass,
	barbar = barbar,
	splitjoin = splitjoin,
	arpeggio = arpeggio,
	fm = fm,
	wordmotion = wordmotion,
	lspconfig = lspconfig,
	hop = hop,
	-- miniyank = miniyank,
	-- sideways = sideways,
	-- camelCaseMotion = camelCaseMotion,
}
