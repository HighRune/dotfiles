local api = vim.api
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn -- to call Vim functions e.g. fn.bufnr()
local g = vim.g -- a table to access global variables
local o = vim.o -- to set options
local opt = vim.opt
local opts = { noremap = true, silent = true }

-------------------- STYLE

cmd("autocmd ColorScheme * highlight NormalFloat guibg=none")
cmd("autocmd ColorScheme * highlight FloatBorder guibg=none")
g.tokyonight_style = "night"
g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true
cmd("colorscheme tokyonight")
-- cmd([[color haslo]])
-- o.colorscheme darkspace

-------------------- GENERAL

-- o.scroll = 5
g.mapleader = " "
o.mouse = "a" -- Enables mouse support
-- o.cursorline=true
o.cursorcolumn = true -- o.cursorline=true
o.scrolloff = 999 -- Minimal number of screen lines to keep above and below the cursor
o.foldenable = false -- All folds are open
o.number = true -- Print the line number in front of each line
o.relativenumber = true -- Show relative line numbers
o.virtualedit = "all"
o.completeopt = "menuone,noinsert" -- Options for Insert mode completion
o.clipboard = "unnamedplus" -- Have the clipboard be the same as my regular clipboard
o.updatetime = 100 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
o.swapfile = false
o.termguicolors = true -- Enables 24-bit RGB color in the Terminal UI
o.showmode = false -- Disable message on the last line (Insert, Replace or Visual mode)
-- o.showtabline=2  -- Always display the line with tab page labels
o.ignorecase = true -- Ignore case in search patterns
o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
o.signcolumn = "yes"
o.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>
o.smartindent = true -- Do smart autoindenting when starting a new line
o.copyindent = true -- Copy the structure of the existing lines indent when autoindenting a new line
o.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
o.hidden = true -- Allow switching buffers with unsaved changes
cmd([[au FocusGained,BufEnter * :silent! !]]) -- Reload when entering the buffer or gaining focus
cmd([[au FocusLost,WinLeave * :silent! w]]) -- Save when exiting the buffer or losing focus
cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}]]) -- highlight a selection on yank

api.nvim_set_keymap("n", "<C-l>", ":noh<cr>", opts)
api.nvim_set_keymap("n", "<PageUp>", "6k", opts)
api.nvim_set_keymap("n", "<PageDown>", "6j", opts)
api.nvim_set_keymap("n", "<c-u>", "5k", opts)
api.nvim_set_keymap("n", "<c-d>", "5j", opts)
api.nvim_set_keymap("n", "gj", "<s-j>", opts)
api.nvim_set_keymap("", "Q", "<Nop>", opts)

-- cmd([[autocmd BufEnter * :syntax sync fromstart]])     -- Fix syntax color
-------------------- twpayne/chezmoi
cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* :silent ! ! chezmoi apply --source-path %]])
cmd([[autocmd BufLeave ~/.config/cheatsheet.md :silent ! ! chezmoi add ~/.config/cheatsheet.md]])

-------------------- PLUGINS

require("plugins")

require("gitsigns").setup() -- lewis6991/gitsigns.nvim
require("colorizer").setup() -- norcalli/nvim-colorizer.lua
require("numb").setup() -- nacro90/numb.nvim

-------------------- wbthomason/packer.nvim
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-------------------- neovim/nvim-lspconfig
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		api.nvim_buf_set_keymap(bufnr, ...)
	end

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	buf_set_keymap("n", "<C-up>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<C-down>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- buf_set_keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	-- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

-------------------- williamboman/nvim-lsp-installer
require("nvim-lsp-installer").on_server_ready(function(server)
	local opts = {
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
	}

	-- (optional) Customize the options passed to the server
	-- if server.name == "tsserver" then
	--     opts.root_dir = function() ... end
	-- end

	if server.name == "eslint" then
		opts.on_attach = function(client, bufnr)
			-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
			-- the resolved capabilities of the eslint server ourselves!
			client.resolved_capabilities.document_formatting = true
			on_attach(client, bufnr)
		end
		opts.settings = {
			format = { enable = true }, -- this will enable formatting
		}
	end

	-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)

-- Format on save
vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])

-- -------------------- kabouzeid/nvim-lspinstall

-- local function setup_servers()
-- 	require("lspinstall").setup()
-- 	local servers = require("lspinstall").installed_servers()
-- 	for _, server in pairs(servers) do
-- 		require("lspconfig")[server].setup({
-- 			on_attach = on_attach,
-- 			flags = {
-- 				debounce_text_changes = 150,
-- 			},
-- 		})
-- 	end
-- end

-- setup_servers()

-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require("lspinstall").post_install_hook = function()
-- 	setup_servers() -- reload installed servers
-- 	cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

-------------------- ms-jpq/coq_nvim
g.coq_settings = {
	auto_start = "shut-up",
	display = {
		preview = {
			positions = {
				east = 1,
				north = 2,
				south = 3,
				west = 4,
			},
		},
	},
}

-------------------- ray-x/lsp_signature.nvim
require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "single",
	},
	doc_lines = 0,
	hint_prefix = "",
	hint_scheme = "Comment",
	tranpancy = 100,
	floating_window = false,
	max_width = 80,
	always_trigger = true,
	max_height = 15,
	hint_enable = true,
})

-------------------- sbdchd/neoformat
cmd("let g:neoformat_enabled_lua = ['stylua']")
-- cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
-- cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
-- api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })
--
local remap = vim.api.nvim_set_keymap
local npairs = require("nvim-autopairs")

npairs.setup({ map_bs = false })

vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap("i", "<esc>", [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap("i", "<c-c>", [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap("i", "<tab>", [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap("i", "<s-tab>", [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-------------------- windwp/nvim-autopairs
-- skip it, if you use another global object
_G.MUtils = {}

MUtils.CR = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info({ "selected" }).selected ~= -1 then
			return npairs.esc("<c-y>")
		else
			return npairs.esc("<c-e>") .. npairs.autopairs_cr()
		end
	else
		return npairs.autopairs_cr()
	end
end
remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

MUtils.BS = function()
	if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ "mode" }).mode == "eval" then
		return npairs.esc("<c-e>") .. npairs.autopairs_bs()
	else
		return npairs.autopairs_bs()
	end
end
remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })

-------------------- lukas-reineke/indent-blankline.nvim
opt.list = true
opt.listchars:append("eol:↴")
require("indent_blankline").setup({
	show_end_of_line = true,
	buftype_exclude = { "terminal", "nofile" },
})

-------------------- nvim-telescope/telescope.nvim
require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			preview_cutoff = 0,
			height = 0.999,
			width = 0.999,
		},
		mappings = {
			i = {
				["<esc>"] = require("telescope.actions").close,
			},
		},
	},
})
api.nvim_set_keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)

-------------------- romgrk/barbar.nvim
api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", opts)
api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", opts)
api.nvim_set_keymap("n", "<C-w>", ":BufferClose<CR>", opts)

-- -------------------- AndrewRadev/sideways.vim
api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)

-------------------- AndrewRadev/splitjoin.vim
api.nvim_set_keymap("n", "<c-j>", ":SplitjoinJoin<cr>", opts)
api.nvim_set_keymap("n", "<c-k>", ":SplitjoinSplit<cr>", opts)

-------------------- bkad/CamelCaseMotion
-- Map to |w|, |b| and |e| mappings: >
cmd([[
    map <silent> w <Plug>CamelCaseMotion_w
    map <silent> b <Plug>CamelCaseMotion_b
    map <silent> e <Plug>CamelCaseMotion_e
    map <silent> ge <Plug>CamelCaseMotion_ge
    sunmap w
    sunmap b
    sunmap e
    sunmap ge
]])
-- Map |iw|, |ib| and |ie| motions: >
cmd([[
    omap <silent> iw <Plug>CamelCaseMotion_iw
    xmap <silent> iw <Plug>CamelCaseMotion_iw
    omap <silent> ib <Plug>CamelCaseMotion_ib
    xmap <silent> ib <Plug>CamelCaseMotion_ib
    omap <silent> ie <Plug>CamelCaseMotion_ie
    xmap <silent> ie <Plug>CamelCaseMotion_ie
]])

-------------------- terryma/vim-expand-region
-- cmd([[
-- map <cr> <Plug>(expand_region_expand)
-- map <s-cr> <Plug>(expand_region_shrink)
-- let g:expand_region_text_objects = { 'i]':1, 'i)':1, 'i}':1, 'it':1, 'ii':1, 'ip':1, 'a]':1, 'a)':1, 'a}':1, 'at':1, 'ai':1, 'ap':1 }
-- ]])

-------------------- inside/vim-search-pulse
cmd([[let g:vim_search_pulse_mode = 'pattern']])
cmd([[let g:vim_search_pulse_duration = 200]])

-------------------- is0n/fm-nvim
require("fm-nvim").setup({
	border = "none",
	height = 1,
	width = 1,
	-- Command used to open files: 'tabedit'; 'split'; 'pedit'; ...
	edit_cmd = "edit",
	-- Terminal commands used w/ file manager
	cmds = {
		vifm_cmd = "vifm",
	},
	-- Mappings used inside the floating window
	mappings = {
		vert_split = "<C-v>",
		horz_split = "<C-h>",
		tabedit = "<C-h>",
		edit = "<C-e>",
	},
})

api.nvim_set_keymap("n", "<leader>n", ":Vifm<cr>", opts)

-- -------------------- mfussenegger/nvim-ts-hint-textobject
-- api.nvim_set_keymap("n", "<leader>u", ":lua require('tsht').nodes()<cr>", opts)
