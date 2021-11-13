local function setup()
	vim.g.tokyonight_style = "night"
	vim.g.tokyonight_transparent = true
	vim.g.tokyonight_transparent_sidebar = true
	vim.cmd("colorscheme tokyonight")
end

return { setup = setup }
