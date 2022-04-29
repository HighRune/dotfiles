local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local call = vim.call
local api = vim.api

-------------------- norcalli/nvim-colorizer.lua
local function colorizer()
	require("colorizer").setup()
end

-------------------- ahmedkhalf/project.nvim
local function project()
	require("project_nvim").setup()
end

-------------------- nacro90/numb.nvim
local function numb()
	require("numb").setup()
end

return {
	colorizer = colorizer,
	project = project,
	numb = numb,
}
