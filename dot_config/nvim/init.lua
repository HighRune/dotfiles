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
-- cmd("colorscheme tokyonight")
cmd([[color haslo]])
-- o.colorscheme darkspace

-------------------- GENERAL

-- o.scroll=5
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
o.hidden = true -- Buffer becomes hidden when it is abandoned
o.swapfile = false
o.termguicolors = true -- Enables 24-bit RGB color in the Terminal UI
o.showmode = false -- Disable message on the last line (Insert, Replace or Visual mode)
-- o.showtabline=2  -- Always display the line with tab page labels
o.ignorecase = true -- Ignore case in search patterns
o.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters
o.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>
o.smartindent = true -- Do smart autoindenting when starting a new line
o.copyindent = true -- Copy the structure of the existing lines indent when autoindenting a new line
o.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent

api.nvim_set_keymap("n", "<C-l>", ":noh<cr>", opts)
api.nvim_set_keymap("n", "<PageUp>", "6k", opts)
api.nvim_set_keymap("n", "<PageDown>", "6j", opts)

-- autocmd BufEnter * :syntax sync fromstart     -- Fix syntax color
cmd([[autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =5]])
-------------------- twpayne/chezmoi
cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %]])
cmd([[autocmd BufLeave ~/.config/cheatsheet.md ! chezmoi add ~/.config/cheatsheet.md]])

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

-------------------- nvim-treesitter/nvim-treesitter
require("nvim-treesitter.configs").setup({
	context_commentstring = { -- JoosepAlviste/nvim-ts-context-commentstring
		enable = true,
	},
	autotag = {
		enable = true,
	},
	rainbow = { -- p00f/nvim-ts-rainbow
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	ensure_installed = "maintained",
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	playground = { -- nvim-treesitter/playground
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false, -- Whether the query persists across vim sessions
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
})
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

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
	-- buf_set_keymap("n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
	buf_set_keymap("n", "<C-up>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "<C-down>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
	buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-------------------- kabouzeid/nvim-lspinstall
local function setup_servers()
	require("lspinstall").setup()
	local servers = require("lspinstall").installed_servers()
	for _, server in pairs(servers) do
		require("lspconfig")[server].setup({
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			},
		})
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-------------------- ray-x/lsp_signature.nvim
require("lsp_signature").setup({
	bind = true, -- This is mandatory, otherwise border config won't get registered.
	handler_opts = {
		border = "single",
	},
	doc_lines = 0,
	hint_prefix = "",
	tranpancy = 100,
	floating_window = true,
	max_width = 80,
	always_trigger = true,
	max_height = 15,
	hint_enable = false,
})

-------------------- ms-jpq/coq_nvim
g.coq_settings = {
	auto_start = "shut-up",
}

-------------------- sbdchd/neoformat
cmd("let g:neoformat_enabled_lua = ['stylua']")
cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
cmd([[
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
]])
api.nvim_set_keymap("n", "<leader>f", ":Neoformat eslint_d<CR>", opts)

-------------------- lukas-reineke/indent-blankline.nvim
opt.list = true
opt.listchars:append("eol:↴")
require("indent_blankline").setup({
	show_end_of_line = true,
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

-------------------- AndrewRadev/sideways.vim
api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)

-------------------- AndrewRadev/splitjoin.vim
api.nvim_set_keymap("n", "<s-j>", ":SplitjoinJoin<cr>", opts)
api.nvim_set_keymap("n", "<s-k>", ":SplitjoinSplit<cr>", opts)

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
cmd([[
map <s-right> <Plug>(expand_region_expand)
map <s-left> <Plug>(expand_region_shrink)
let g:expand_region_text_objects = { 'i"':1, 'i''':1, 'i`': 1, 'i]':1, 'i)':1, 'i}':1, 'it':1, 'ii':1, 'is':1, 'ip':1, 'a"':1, 'a''':1, 'a`': 1, 'a]':1, 'a)':1, 'a}':1, 'at':1, 'ai':1, 'as':1, 'ap':1 }
]])
