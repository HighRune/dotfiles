local g = vim.g
local cmd = vim.cmd

-------------------- wbthomason/packer.nvim
local function packer()
	cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
end
-------------------- inside/vim-search-pulse
local function searchPulse()
	g.vim_search_pulse_mode = "pattern"
	g.vim_search_pulse_duration = 200
end
-------------------- bfredl/nvim-miniyank
local function miniyank()
	g.miniyank_maxitems = 5
end
-------------------- blackCauldron7/surround.nvim
local function surround()
	require("surround").setup({
		load_keymaps = false,
		quotes = { "'", '"', "`" },
		context_offset = 50,
	})
end
-------------------- chaoren/vim-wordmotion
local function wordmotion()
	cmd("let g:wordmotion_nomap = 1")
end
-------------------- folke/tokyonight.nvim
local function tokyonight()
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd("colorscheme tokyonight")
end

return {
	packer = packer,
	searchPulse = searchPulse,
	miniyank = miniyank,
	surround = surround,
	wordmotion = wordmotion,
	tokyonight = tokyonight,
}
