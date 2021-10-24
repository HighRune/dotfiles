local api = vim.api
local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')
local g = vim.g -- a table to access global variables
local o = vim.o -- to set options
local opts = { noremap = true, silent = true }

-------------------- STYLE

cmd("autocmd ColorScheme * highlight NormalFloat guibg=none")
cmd("autocmd ColorScheme * highlight FloatBorder guibg=none")

-- g.tokyonight_style = "night"
-- g.tokyonight_transparent = true
-- g.tokyonight_transparent_sidebar = true
-- cmd("colorscheme tokyonight")

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
-- o.relativenumber = true -- Show relative line numbers
o.virtualedit = "all"
o.completeopt = "menuone,noinsert" -- Options for Insert mode completion
-- o.pumblend = 100
o.clipboard = "unnamedplus" -- Have the clipboard be the same as my regular clipboard
o.updatetime = 100 -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
o.swapfile = false
o.termguicolors = true -- Enables 24-bit RGB color in the Terminal UI
o.showmode = false -- Disable message on the last line (Insert, Replace or Visual mode)
o.linebreak = true -- Do not break words on line wrap
o.breakindent = true -- Start wrapped lines indented
-- o.formatoptions = "cro"
-- vim.cmd([[filetype plugin indent on]])
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
cmd([[autocmd BufLeave ~/.config/cheatsheet.md :silent ! ! chezmoi add ~/.config/cheatsheet.md]])
-- Disable automatic comment insertion
cmd([[autocmd BufWinEnter,BufRead,BufNewFile * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

api.nvim_set_keymap("n", "<C-l>", ":noh<cr>", opts)
api.nvim_set_keymap("n", "<PageUp>", "6k", opts)
api.nvim_set_keymap("n", "<PageDown>", "6j", opts)
api.nvim_set_keymap("n", "<c-u>", "5k", opts)
api.nvim_set_keymap("n", "<c-d>", "5j", opts)
api.nvim_set_keymap("n", "gj", "<s-j>", opts)
api.nvim_set_keymap("n", "<s-l>", "$", opts)
api.nvim_set_keymap("n", "<s-h>", "^", opts)
api.nvim_set_keymap("", "Q", "<Nop>", opts)

-- cmd([[autocmd BufEnter * :syntax sync fromstart]])     -- Fix syntax color
-------------------- twpayne/chezmoi
cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* :silent ! ! chezmoi apply --source-path %]])
cmd([[autocmd BufLeave ~/.config/cheatsheet.md :silent ! ! chezmoi add ~/.config/cheatsheet.md]])

-------------------- PLUGINS

require("plugins")

-------------------- wbthomason/packer.nvim
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Format on save
-- vim.api.nvim_command([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])

-------------------- sbdchd/neoformat
cmd("let g:neoformat_enabled_lua = ['stylua']")
-- cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
-- cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
cmd([[
augroup fmt
  autocmd!
  au BufWritePre *.lua try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END
]])

-- vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]])
-- api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })

-------------------- romgrk/barbar.nvim
api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", opts)
api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", opts)
api.nvim_set_keymap("n", "<C-w>", ":BufferClose<CR>", opts)

-- -------------------- AndrewRadev/sideways.vim
-- api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
-- api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)

-------------------- AndrewRadev/splitjoin.vim
api.nvim_set_keymap("n", "<s-j>", ":SplitjoinJoin<cr>", opts)
api.nvim_set_keymap("n", "<s-k>", ":SplitjoinSplit<cr>", opts)

-------------------- terryma/vim-expand-region
-- cmd([[
-- map <cr> <Plug>(expand_region_expand)
-- map <s-cr> <Plug>(expand_region_shrink)
-- let g:expand_region_text_objects = { 'i]':1, 'i)':1, 'i}':1, 'it':1, 'ii':1, 'ip':1, 'a]':1, 'a)':1, 'a}':1, 'at':1, 'ai':1, 'ap':1 }
-- ]])

-------------------- inside/vim-search-pulse
cmd([[let g:vim_search_pulse_mode = 'pattern']])
cmd([[let g:vim_search_pulse_duration = 200]])

api.nvim_set_keymap("n", "<leader>n", ":Vifm<cr>", opts)

-------------------- chaoren/vim-wordmotion
cmd("let g:wordmotion_uppercase_spaces = [':', ',', '.', ';']")

-------------------- kana/vim-arpeggio
cmd("call arpeggio#map('i', '', 0, 'jk', '<Esc>')")

-------------------- nvim-telescope/telescope.nvim
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
