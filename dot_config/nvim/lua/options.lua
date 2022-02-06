local o = vim.o
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd

cmd([[autocmd ColorScheme * highlight NormalFloat guibg=none]])
cmd([[autocmd ColorScheme * highlight FloatBorder guifg=none guibg=none]])
cmd([[autocmd ColorScheme * highlight TelescopeBorder guibg=none]])
cmd([[autocmd ColorScheme * highlight TelescopeNormal guibg=none]])
cmd([[autocmd User SneakLeave highlight clear Sneak]])

-- cmd([[color haslo]])

-- o.scroll = 5
g.mapleader = " "
o.mouse = "a" -- Enables mouse support
o.cursorline = true
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
o.signcolumn = "yes:1"
o.expandtab = true -- Use the appropriate number of spaces to insert a <Tab>
o.smartindent = true -- Do smart autoindenting when starting a new line
o.copyindent = true -- Copy the structure of the existing lines indent when autoindenting a new line
o.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
o.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
o.hidden = true -- Allow switching buffers with unsaved changes
opt.lazyredraw = true -- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen, which greatly speeds it up, upto 6-7x faster
-- lukas-reineke/indent-blankline.nvim
opt.list = true
opt.listchars:append("eol:↴")

-- nvim-treesitter/nvim-treesitter
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"

-- cmd([[au FocusGained,BufEnter * :silent! !]]) -- Reload when entering the buffer or gaining focus
-- cmd([[au FocusLost,WinLeave * :silent! w]]) -- Save when exiting the buffer or losing focus
-- cmd([[autocmd BufEnter * :syntax sync fromstart]])     -- Fix syntax color

-- Highlight a selection on yank
-- cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}]])
-- Disable automatic comment insertion
cmd([[autocmd BufWinEnter,BufRead,BufNewFile * setlocal fo-=c fo-=r fo-=o fo+=t]])

-- twpayne/chezmoi
cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* :silent! !chezmoi apply --source-path %]])
cmd([[autocmd BufLeave ~/.config/cheatsheet.md :silent! !chezmoi add ~/.config/cheatsheet.md]])
