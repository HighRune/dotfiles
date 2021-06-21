local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local o = vim.o  -- to set options

-- ____ GENERAL

cmd[[colorscheme tokyonight]]
g.tokyonight_style = 'night'
g.tokyonight_transparent = true
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

api.nvim_set_keymap('n', '<C-j>', '2j', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-k>', '2k', { noremap = true, silent = true })

require('plugins')

-- Telescope
-- api.nvim_set_keymap('n', '<leader>h', '<cmd>Telescope find_files<cr>', {noremap = true, silent = true})
-- api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
-- api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})

-- Treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {enable = true},
  indent = {enable = true},
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm"
    }
  }
}
o.foldmethod='expr'
o.foldexpr='nvim_treesitter#foldexpr()'

-- Barbar
api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-w>', ':BufferClose<CR>', { noremap = true, silent = true })

-- lspconfig
local lspconfig = require"lspconfig"

local eslint = {
  lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

lspconfig.tsserver.setup {
  on_attach = function(client)
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    end
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client)
  end
}

lspconfig.efm.setup {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.goto_definition = false
    set_lsp_config(client)
  end,
  root_dir = function()
    if not eslint_config_exists() then
      return nil
    end
    return vim.fn.getcwd()
  end,
  settings = {
    languages = {
      javascript = {eslint},
      javascriptreact = {eslint},
      ["javascript.jsx"] = {eslint},
      typescript = {eslint},
      ["typescript.tsx"] = {eslint},
      typescriptreact = {eslint}
    }
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescript.tsx",
    "typescriptreact"
  },
}

local function eslint_config_exists()
  local eslintrc = vim.fn.glob(".eslintrc*", 0, 1)

  if not vim.tbl_isempty(eslintrc) then
    return true
  end

  if vim.fn.filereadable("package.json") then
    if vim.fn.json_decode(vim.fn.readfile("package.json"))["eslintConfig"] then
      return true
    end
  end

  return false
end
-- lspinstall
-- local function setup_servers()
--   require'lspinstall'.setup()
--   local servers = require'lspinstall'.installed_servers()
--   for _, server in pairs(servers) do
--     require'lspconfig'[server].setup{}
--   end
-- end
-- 
-- setup_servers()
-- 
-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- require'lspinstall'.post_install_hook = function ()
--   setup_servers() -- reload installed servers
--   cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
-- end

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

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})


-- Snap

local snap = require'snap'

-- Find Files
snap.register.map({'n'}, {'<leader><leader>'}, function ()
  snap.run({
  producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file'),
  select = snap.get'select.file'.select,
  multiselect = snap.get'select.file'.multiselect,
  views = {snap.get'preview.file'}
  })
end)

-- Live Ripgrep
snap.register.map({'n'}, {'<Leader>s'}, function ()
snap.run {
  producer = snap.get'producer.ripgrep.vimgrep',
  select = snap.get'select.vimgrep'.select,
  multiselect = snap.get'select.vimgrep'.multiselect,
  views = {snap.get'preview.vimgrep'}
}
end)

-- Find Buffers
snap.register.map({'n'}, {'<Leader>b'}, function ()
  snap.run({
  producer = snap.get'consumer.fzf'(snap.get'producer.vim.buffer'),
  select = snap.get'select.file'.select,
  multiselect = snap.get'select.file'.multiselect,
  views = {snap.get'preview.file'}
  })
end)

-- Find Git Files
snap.register.map({'n'}, {'<Leader>g'}, function ()
  snap.run({
producer = snap.get'consumer.fzf'(snap.get'producer.git.file'),
  select = snap.get'select.file'.select,
  multiselect = snap.get'select.file'.multiselect,
  views = {snap.get'preview.file'}
  })
end)
