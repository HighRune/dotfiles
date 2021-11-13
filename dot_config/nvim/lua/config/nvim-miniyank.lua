function setup()
	require("mappings").miniyank()
	vim.g.miniyank_maxitems = 5
end

return { setup = setup }
