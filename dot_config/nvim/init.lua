local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local o = vim.o  -- to set options

-- ____ GENERAL

cmd [[colorscheme xshado]]
-- o.scroll=5
g.mapleader = " "
o.mouse="a"                                   -- Enables mouse support
o.scrolloff=999                              -- Minimal number of screen lines to keep above and below the cursor
o.foldenable = false                              -- All folds are open
o.number=true         -- Print the line number in front of each line
o.virtualedit="all"
o.completeopt="menuone,noinsert"              -- Options for Insert mode completion
o.clipboard = "unnamedplus"                    -- Have the clipboard be the same as my regular clipboard
o.updatetime=100                            -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
o.hidden=true                                    -- Buffer becomes hidden when it is abandoned

-- autocmd BufEnter * :syntax sync fromstart     -- Fix syntax color
-- autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =4
o.swapfile=false


-- ____ UI

o.termguicolors=true  -- Enables 24-bit RGB color in the Terminal UI
-- o.colorscheme darkspace
o.showmode = false     -- Disable message on the last line (Insert, Replace or Visual mode)
-- o.showtabline=2  -- Always display the line with tab page labels

-- ____ SEARCH

o.ignorecase = true -- Ignore case in search patterns
o.smartcase = true  -- Override the 'ignorecase' option if the search pattern contains upper case characters


-- ____ INDENTATION

o.expandtab=true                   -- Use the appropriate number of spaces to insert a <Tab>
o.smartindent=true                 -- Do smart autoindenting when starting a new line
o.copyindent=true                  -- Copy the structure of the existing lines indent when autoindenting a new line
o.softtabstop=2               -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.tabstop=2                   -- Number of spaces that a <Tab> in the file counts for
o.shiftwidth=2                -- Number of spaces to use for each step of (auto)indent

require('plugins')

-- Telescope
api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})

-- Treesitter
require 'nvim-treesitter.configs'.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- Barbar
api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-h>', ':BufferClose<CR>', { noremap = true, silent = true })

-- lspinstall
local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

-- nvim-compe
o.completeopt = "menuone,noselect"
require'compe'.setup({
  enabled = true,
  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
  },
})
api.nvim_set_keymap("i", "<C-y> ", "compe#complete()", {noremap = true, silent = true, expr = true})
-- api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, silent = true, expr = true})
