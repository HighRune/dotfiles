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

local function indentscope()
	augroup("indentscope", {})
	autocmd("FileType", {
		group = "indentscope",
		pattern = "*",
		command = "if index(['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif",
	})
end

return {
	packer = packer,
	indentscope = indentscope,
}
