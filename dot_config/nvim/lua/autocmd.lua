local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-------------------- wbthomason/packer.nvim
local function packer()
	cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.local/share/chezmoi/dot_config/nvim/* :PackerCompile
  augroup end
]])
end

local function indentscope() end

return {
	packer = packer,
	indentscope = indentscope,
}
