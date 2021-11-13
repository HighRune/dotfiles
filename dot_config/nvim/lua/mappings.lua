local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

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
	telescope = telescope,
	miniyank = miniyank,
	surround = surround,
	barbar = barbar,
	splitjoin = splitjoin,
	fm = fm,
	wordmotion = wordmotion,
}
