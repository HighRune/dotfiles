local map = vim.api.nvim_set_keymap
local mapb = vim.api.nvim_buf_set_keymap
local cmd = vim.cmd
local call = vim.call
local opts = { noremap = true, silent = true }

local function vanilla()
	-- map("n", "<Plug>(arpeggio-default:s)", "l", opts)
	-- Help
	cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab h' : 'h'")
	cmd("cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'tab help' : 'help'")
	-- Save Quit
	map("", "<s-q>", "<nop>", opts)
	map("", "q", "<nop>", opts)
	map("", "q", "<nop>", opts)
	map("n", "<c-q>", ":q<cr>", opts)
	map("i", "<c-q>", "<esc>:q<cr>", opts)
	map("n", "<c-s>", ":w<cr>", opts)
	map("i", "<c-s>", "<esc>:w<cr>", opts)
	-- Scroll
	map("n", "<c-u>", "5k", opts)
	map("n", "<c-d>", "5j", opts)
	-- Readline
	map("i", "<c-a>", "<esc>I", opts)
	map("i", "<c-e>", "<end>", opts)
	map("i", "<c-k>", "<esc>ld$i", opts)
	map("i", "<c-u>", "<esc>ld^i", opts)
	-- Movements
	map("n", "k", "gk", opts)
	map("n", "j", "gj", opts)
	-- Join
	cmd([[
  " Like gJ, but always remove spaces
  fun! s:join_spaceless()
  execute 'normal! gJ'

  " Remove character under the cursor if it's whitespace.
  if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
  execute 'normal! dw'
  endif
  endfun

  " Map it to a key
  nnoremap J :call <SID>join_spaceless()<CR>
  ]])
	-- Line
	map("n", "0", "g0", opts)
	map("n", "$", "g$:set ve= ve=all<cr>", opts)
	map("n", "^", "g^", opts)
	map("n", "<s-h>", "^", {})
	map("n", "<s-l>", "$", {})
	map("x", "<s-h>", "^", {})
	map("x", "<s-l>", "$", {})
	-- map("n", "gm", "(virtcol('$') / 2) . '<Bar>'", { expr = true })
	-- Esc
	map("n", "<esc>", "<esc>^", opts)
	map("i", "<esc>", "<esc>`^", opts)
	map("o", "w", "iw", {})
	map("o", "W", "iW", {})
	map("o", "b", "ib", {})
	-- Cut
	-- map("x", "d", "ygvd", opts)
	-- map("x", "c", "ygvc", opts)
	-- map("x", "x", "ygvx", opts)
end
-------------------- nvim-telescope/telescope.nvim
local function telescope()
	map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end
-------------------- blackCauldron7/surround.nvim
local function surround()
	map("n", "ys", "<cmd>lua require('surround').surround_add(true)<cr>", { noremap = true })
	map("n", "cs", "<cmd>lua require('surround').surround_replace()<cr>", { noremap = true })
	map("n", "ds", "<cmd>lua require('surround').surround_delete()<cr>", { noremap = true })
end
-------------------- phaazon/hop.nvim
local function hop()
	-- map("n", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
	-- map("v", "s", "<cmd>lua require('hop').hint_words()<cr>", {})

	-- map("n", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
	-- map("v", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
end
-------------------- romgrk/barbar.nvim
-- local function barbar()
-- 	map("n", "<tab>", ":BufferNext<CR>", opts)
-- 	map("n", "<s-tab>", ":BufferPrevious<CR>", opts)
-- 	map("n", "<c-w>", ":BufferClose<CR>", opts)
-- 	map("n", "<pageup>", ":BufferMovePrevious<CR>", opts)
-- 	map("n", "<pagedown>", ":BufferMoveNext<CR>", opts)
-- end
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
	map("n", "gk", ":SplitjoinSplit<cr><leader>f", opts)
end
-------------------- svermeulen/vim-cutlass
local function cutlass()
	map("n", "gm", "m", opts)
	map("n", "m", "d", opts)
	map("x", "m", "d", opts)
	map("n", "mm", "dd", opts)
	map("n", "M", "D", opts)
	-- map("n", "cy", "c", opts)
	-- map("n", "dy", "d", opts)
	-- map("n", "yc", "c", opts)
	-- map("n", "yd", "d", opts)
end
-------------------- is0n/fm-nvim
local function fm()
	map("n", "<c-t>", ":Vifm<cr>", opts)
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
	mapb(buffer, "n", "<C-up>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	mapb(buffer, "n", "<C-down>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' ))<CR>"
	-- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
end

local function coq()
	cmd([[
ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"
  ]])
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
	splitjoin = splitjoin,
	arpeggio = arpeggio,
	fm = fm,
	wordmotion = wordmotion,
	lspconfig = lspconfig,
	hop = hop,
	bufferline = bufferline,
	coq = coq,
	-- barbar = barbar,
	-- miniyank = miniyank,
	-- sideways = sideways,
	-- camelCaseMotion = camelCaseMotion,
}
