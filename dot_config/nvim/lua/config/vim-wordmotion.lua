function setup()
	vim.cmd("let g:wordmotion_nomap = 1")
	require("mappings").wordmotion()
end

return { setup = setup }
