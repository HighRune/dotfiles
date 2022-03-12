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

-------------------- folke/tokyonight.nvim
local function tokyonight()
	g.tokyonight_style = "night"
	g.tokyonight_transparent = true
	g.tokyonight_transparent_sidebar = true
	cmd("colorscheme tokyonight")
end

return {
	packer = packer,
	tokyonight = tokyonight,
}
