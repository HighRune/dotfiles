local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

local function vanilla()
	map("n", "<c-l>", ":noh<cr>", opts)
	map("", "Q", "<nop>", opts)
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
	map("n", "<s-h>", "^", { silent = true })
	map("n", "<s-l>", "$", { silent = true })
	map("v", "<s-h>", "^", { silent = true })
	map("v", "<s-l>", "$", { silent = true })
	map("n", "cw", "ciw", { silent = true })
	map("n", "cW", "ciW", { silent = true })
	map("n", "dw", "diw", { silent = true })
	map("n", "dW", "diW", { silent = true })
	map("n", "yw", "yiw", { silent = true })
	map("n", "yW", "yiW", { silent = true })
	map("n", "vw", "viw", { silent = true })
	map("n", "vW", "viW", { silent = true })
end
-------------------- nvim-telescope/telescope.nvim
local function telescope()
	map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
	map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
	map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end
-------------------- bfredl/nvim-miniyank
local function miniyank()
	map("", "p", "<Plug>(miniyank-autoput)", { silent = true })
	map("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
	map("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
	map("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
end
-------------------- blackCauldron7/surround.nvim
local function surround()
	map("n", "<c-b>", "<Cmd>lua require('surround').toggle_brackets(0)<CR>", { noremap = true })
	map("n", "<c-q>", "<Cmd>lua require('surround').toggle_quotes()<CR>", { noremap = true })
	map("n", "ys", "<Cmd>set operatorfunc=SurroundAddOperatorMode<CR>g@", { noremap = true })
	map("n", "cs", "<Cmd>lua require('surround').surround_replace()<CR>", { noremap = true })
	map("n", "ds", "<Cmd>lua require('surround').surround_delete()<CR>", { noremap = true })
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
-------------------- is0n/fm-nvim
local function fm()
	map("n", "<leader>n", ":Vifm<cr>", opts)
end
-------------------- chaoren/vim-wordmotion
local function wordmotion()
	map("n", "gw", "<Plug>WordMotion_w", { noremap = false })
	map("n", "gb", "<Plug>WordMotion_b", { noremap = false })
end

return {
	vanilla = vanilla,
	telescope = telescope,
	miniyank = miniyank,
	surround = surround,
	barbar = barbar,
	splitjoin = splitjoin,
	fm = fm,
	wordmotion = wordmotion,
}
