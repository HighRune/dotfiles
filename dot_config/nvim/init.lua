local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local o = vim.o      -- to set options

-- ____ GENERAL

g.tokyonight_style = 'night'
g.tokyonight_transparent = true
g.tokyonight_transparent_sidebar = true
cmd[[colorscheme tokyonight]]
-- o.scroll=5
g.mapleader = " "
o.mouse="a"                         -- Enables mouse support
-- o.cursorline=true
o.cursorcolumn=true
o.scrolloff=999                     -- Minimal number of screen lines to keep above and below the cursor
o.foldenable = false                -- All folds are open
o.number=true                       -- Print the line number in front of each line
o.relativenumber=true               -- Show relative line numbers
o.virtualedit="all"
o.completeopt="menuone,noinsert"    -- Options for Insert mode completion
o.clipboard = "unnamedplus"         -- Have the clipboard be the same as my regular clipboard
o.updatetime=100                    -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
o.hidden=true                       -- Buffer becomes hidden when it is abandoned
o.swapfile=false
api.nvim_set_keymap('n', '<C-l>', ':noh<cr>', {noremap = true, silent = true})

-- autocmd BufEnter * :syntax sync fromstart     -- Fix syntax color
cmd[[autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =4]]
cmd[[autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %]]
cmd[[autocmd BufLeave ~/.config/cheatsheet.md ! chezmoi add ~/.config/cheatsheet.md]]
cmd[[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]
-- cmd[[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- ____ UI

o.termguicolors=true  -- Enables 24-bit RGB color in the Terminal UI
-- cmd [[color haslo]]
-- o.colorscheme darkspace
o.showmode = false     -- Disable message on the last line (Insert, Replace or Visual mode)
-- o.showtabline=2  -- Always display the line with tab page labels

-- ____ SEARCH

o.ignorecase = true -- Ignore case in search patterns
o.smartcase = true  -- Override the 'ignorecase' option if the search pattern contains upper case characters


-- ____ INDENTATION

o.expandtab=true          -- Use the appropriate number of spaces to insert a <Tab>
o.smartindent=true        -- Do smart autoindenting when starting a new line
o.copyindent=true         -- Copy the structure of the existing lines indent when autoindenting a new line
o.softtabstop=2           -- Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
o.tabstop=2               -- Number of spaces that a <Tab> in the file counts for
o.shiftwidth=2            -- Number of spaces to use for each step of (auto)indent

api.nvim_set_keymap('n', '<C-j>', '2j', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<C-k>', '2k', { noremap = true, silent = true })
-- sbdchd/neoformat
api.nvim_set_keymap('n', '<leader>f', ':Neoformat eslint_d<CR>', { noremap = true, silent = true })

require('plugins')

-- Telescope
require('telescope').setup({
  defaults = {
    layout_strategy = 'vertical',
    layout_config = {
      preview_cutoff = 0,
      height = 0.999,
      width = 0.999
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
})

api.nvim_set_keymap('n', '<leader><leader>', "<cmd>Telescope find_files<cr>", {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>s', '<cmd>Telescope live_grep<cr>', {noremap = true, silent = true})
api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', {noremap = true, silent = true})

-- Treesitter
require 'nvim-treesitter.configs'.setup {
  context_commentstring = { enable = true }, -- nvim-ts-context-commentstring
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

-- lspinstall

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<C-up>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<C-down>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
      require'lspconfig'[server].setup {
      on_attach = on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

g.coq_settings = { auto_start = 'shut-up' }

-- -- nvim-compe
-- o.completeopt = "menuone,noselect"

-- require'compe'.setup({
--   enabled = true,
--   source = {
--     path = true,
--     buffer = true,
--     nvim_lsp = true,
--   },
-- })
-- 
-- local t = function(str)
--   return vim.api.nvim_replace_termcodes(str, true, true, true)
-- end
-- 
-- local check_back_space = function()
--     local col = vim.fn.col('.') - 1
--     if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
--         return true
--     else
--         return false
--     end
-- end
-- 
-- -- Use (s-)tab to:
-- --- move to prev/next item in completion menuone
-- --- jump to prev/next snippet's placeholder
-- _G.tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-n>"
--   elseif vim.fn.call("vsnip#available", {1}) == 1 then
--     return t "<Plug>(vsnip-expand-or-jump)"
--   elseif check_back_space() then
--     return t "<Tab>"
--   else
--     return vim.fn['compe#complete']()
--   end
-- end
-- _G.s_tab_complete = function()
--   if vim.fn.pumvisible() == 1 then
--     return t "<C-p>"
--   elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
--     return t "<Plug>(vsnip-jump-prev)"
--   else
--     -- If <S-Tab> is not working in your terminal, change it to <C-h>
--     return t "<S-Tab>"
--   end
-- end
-- 
-- vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
-- vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- -- fzf-lua
-- api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("fzf-lua").files()<cr>', { noremap = true, silent = true })
-- api.nvim_set_keymap('n', '<leader>s', '<cmd>lua require("fzf-lua").live_grep()<cr>', { noremap = true, silent = true })
-- api.nvim_set_keymap('n', '<leader>b', '<cmd>lua require("fzf-lua").grep_curbuf()<cr>', { noremap = true, silent = true })
-- 
-- require'fzf-lua'.setup {
--   winopts = {
--     win_height       = 1,            -- window height
--     win_width        = 1,            -- window width
--     win_row          = 1,            -- window row position (0=top, 1=bottom)
--     win_col          = 1,            -- window col position (0=left, 1=right)
--     win_border       = false
--     -- win_border       = { '', '', '', '', '', '', '', '' },
--   },
--   preview_border      = 'noborder',       -- border|noborder
--   preview_wrap        = 'wrap',       -- wrap|nowrap
--   preview_opts        = 'nohidden',     -- hidden|nohidden
--   preview_vertical    = 'up:70%',     -- up|down:size
--   preview_layout      = 'vertical'         -- horizontal|vertical|flex
-- }

require('gitsigns').setup()
require'colorizer'.setup()

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  }
}

-- Indent Blankline
vim.opt.list = true
vim.opt.listchars:append("eol:↴")

require("indent_blankline").setup {
    show_end_of_line = true,
}

-- local saga = require 'lspsaga'
-- saga.init_lsp_saga()

-- require('wlsample.evil_line')
local windline = require('windline')
local helper = require('windline.helpers')
local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Black = { 'white', 'black' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

local breakpoint_width = 90
basic.divider = { b_components.divider, '' }
basic.bg = { ' ', 'StatusLine' }

local colors_mode = {
    Normal = { 'red', 'black' },
    Insert = { 'green', 'black' },
    Visual = { 'yellow', 'black' },
    Replace = { 'blue_light', 'black' },
    Command = { 'magenta', 'black' },
}

basic.vi_mode = {
    name = 'vi_mode',
    hl_colors = colors_mode,
    text = function()
        return { { '  ', state.mode[2] } }
    end,
}
basic.square_mode = {
    hl_colors = colors_mode,
    text = function()
        return { { '▊', state.mode[2] } }
    end,
}

basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if lsp_comps.check_lsp(bufnr) then
            return {
                { ' ', 'red' },
                { lsp_comps.lsp_error({ format = ' %s', show_zero = true }), 'red' },
                { lsp_comps.lsp_warning({ format = '  %s', show_zero = true }), 'yellow' },
                { lsp_comps.lsp_hint({ format = '  %s', show_zero = true }), 'blue' },
            }
        end
        return ''
    end,
}
basic.file = {
    name = 'file',
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width > breakpoint_width then
            return {
                { b_components.cache_file_size(), 'default' },
                { ' ', '' },
                { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
                { ' ', '' },
                { b_components.file_modified(' '), 'magenta' },
            }
        else
            return {
                { b_components.cache_file_size(), 'default' },
                { ' ', '' },
                { b_components.cache_file_name('[No Name]', 'unique'), 'magenta' },
                { ' ', '' },
                { b_components.file_modified(' '), 'magenta' },
            }
        end
    end,
}
basic.file_right = {
    hl_colors = {
        default = hl_list.Black,
        white = { 'white', 'black' },
        magenta = { 'magenta', 'black' },
    },
    text = function(_, _, width)
        if width < breakpoint_width then
            return {
                { b_components.line_col_lua, 'white' },
                { b_components.progress_lua, '' },
            }
        end
    end,
}
basic.git = {
    name = 'git',
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    width = breakpoint_width,
    text = function(bufnr)
        if git_comps.is_git(bufnr) then
            return {
                { ' ', ' ' },
                { git_comps.diff_added({ format = ' %s', show_zero = true }), 'green' },
                { git_comps.diff_changed({ format = ' 柳%s', show_zero = true }), 'blue' },
                { git_comps.diff_removed({ format = '  %s', show_zero = true }), 'red' },
            }
        end
        return ''
    end,
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },

    always_active = true,
    show_last_status = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ', { 'black', 'red' } },
        { helper.separators.slant_right, { 'red', 'NormalBg' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'NormalBg' } },
    },
    always_active = true,
    show_last_status = true,
}
local default = {
    filetypes = { 'default' },
    active = {
        basic.square_mode,
        basic.git,
        basic.vi_mode,
        basic.file,
        basic.lsp_diagnos,
        basic.divider,
        { lsp_comps.lsp_name(), { 'magenta', 'black' }, breakpoint_width },
        { ' ', hl_list.Black },
        basic.square_mode,
    },
    inactive = {
        { b_components.full_file_name, hl_list.Inactive },
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        { b_components.line_col, hl_list.Inactive },
        { b_components.progress, hl_list.Inactive },
    },
}

windline.setup({
    colors_name = function(colors)
        -- print(vim.inspect(colors))
        -- ADD MORE COLOR HERE ----
        return colors
    end,
    statuslines = {
        default,
        quickfix,
        explorer,
    },
})
