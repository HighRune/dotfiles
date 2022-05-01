local cmd = vim.cmd
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local function colorscheme()
	cmd([[
autocmd ColorScheme * highlight NormalFloat guibg=none
autocmd ColorScheme * highlight FloatBorder guifg=none guibg=none
autocmd ColorScheme * highlight link DiagnosticFloatingError DiagnosticVirtualTextError
autocmd ColorScheme * highlight link DiagnosticFloatingHint DiagnosticVirtualTextHint
autocmd ColorScheme * highlight link DiagnosticFloatingInfo DiagnosticVirtualTextInfo
autocmd ColorScheme * highlight link DiagnosticFloatingWarn DiagnosticVirtualTextWarn
" autocmd ColorScheme * highlight VertSplit guifg=#292e42
]])
end

local function sneak()
	cmd([[
autocmd User SneakLeave highlight clear Sneak
autocmd User SneakLeave highlight clear SneakScope
]])
end

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
		callback = function()
			local filetype = {
				help = true,
				startify = true,
				dashboard = true,
				packer = true,
				neogitstatus = true,
				NvimTree = true,
				["neo-tree"] = true,
				Trouble = true,
			}
			local buffertype = {
				nofile = true,
				terminal = true,
				["lsp-installer"] = true,
				lspinfo = true,
			}
			-- local aa = cmd("&ft")
			-- local bb = cmd("&bt")
			-- print(cmd("&ft"))
			-- print(cmd("&bt"))
			-- if filetype[aa] or buffertype[bb] then
			-- 	cmd("let b:miniindentscope_disable=v:true | endif")
			-- end
		end,
		-- command = "if index(['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif",
	})
	-- 	cmd([[
	-- augroup DisableIntentScope
	-- autocmd! FileType markdown,help,lsp-installer,packer,qf,man let b:miniindentscope_disable=v:true
	-- augroup END
	-- ]])
end

local function neoformat()
	-- Format on write
	cmd([[
augroup fmt
  autocmd!
  au BufWritePre *.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]])
end

local function targets()
	cmd([[
  autocmd User targets#mappings#user call targets#mappings#extend({
	\ 'b': {'argument': [{'o': '(', 'c': ')', 's': ','}]},
	\ 'a': {'argument': [{'o': '\[', 'c': '\]', 's': ','}]},
	\ 'o': {'argument': [{'o': '{', 'c': '}', 's': ','}]},
	\ 'B': {'pair': [{'o':'(', 'c':')'}]},
	\ 'A': {'pair': [{'o':'\[', 'c':'\]'}]},
	\ 'O': {'pair': [{'o':'{', 'c':'}'}]},
	\ 'Q': {'quote': [{'d': '`'}]},
	\ 's': { 'separator': [{'d':','}, {'d':'.'}, {'d':';'}, {'d':':'}, {'d':'+'}, {'d':'-'},
  \ {'d':'='}, {'d':'~'}, {'d':'_'}, {'d':'*'}, {'d':'#'}, {'d':'/'},
  \ {'d':'\'}, {'d':'|'}, {'d':'&'}, {'d':'$'}] },
	\ })
  ]])
	-- cmd([[
	-- autocmd User targets#mappings#user call targets#mappings#extend({
	-- \ 'a': {'argument': [{'o': '[[(]', 'c': '[])]', 's': ','}]},
	-- \ 'A': {'argument': [{'o': '{', 'c': '}', 's': ','}]},
	-- \ 'b': {'pair': [{'o':'(', 'c':')'}, {'o':'[', 'c':']'}, {'o':'<', 'c':'>'}]},
	-- \ 'B': {'pair': [{'o':'{', 'c': '}'}]},
	-- \ })
	-- ]])
end

-- cmd([[autocmd ColorScheme * highlight TelescopeBorder guibg=none]])
-- cmd([[autocmd ColorScheme * highlight TelescopeNormal guibg=none]])

return {
	packer = packer,
	indentscope = indentscope,
	neoformat = neoformat,
	targets = targets,
	colorscheme = colorscheme,
	sneak = sneak,
}
