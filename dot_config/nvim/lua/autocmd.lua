local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

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
	-- 	cmd([[
	-- augroup DisableIntentScope
	-- autocmd! FileType markdown,help,lsp-installer,packer,qf,man let b:miniindentscope_disable=v:true
	-- augroup END
	-- ]])
end

local function neoformat()
	cmd([[
augroup fmt
  autocmd!
  au BufWritePre *.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]])
end

local function targets()
	cmd([[
  ]])
end

return {
	packer = packer,
	indentscope = indentscope,
	neoformat = neoformat,
	targets = targets,
}
