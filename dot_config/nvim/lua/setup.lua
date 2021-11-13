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

return {
	packer = packer,
	searchPulse = searchPulse,
	miniyank = miniyank,
}
