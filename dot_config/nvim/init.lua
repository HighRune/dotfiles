local api = vim.api
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local o = vim.o  -- to set options

-- ____ GENERAL

-- g.tokyonight_style = 'night'
-- g.tokyonight_transparent = true
-- cmd[[colorscheme tokyonight]]
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
vim.cmd[[autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =4]]
vim.cmd[[autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %]]
vim.cmd[[autocmd BufLeave ~/.config/cheatsheet.md ! chezmoi add ~/.config/cheatsheet.md]]
vim.cmd[[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]]
o.swapfile=false


-- ____ UI

o.termguicolors=true  -- Enables 24-bit RGB color in the Terminal UI
vim.cmd [[color haslo]]
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


-- -- Snap
-- 
-- local snap = require'snap'
-- 
-- -- Find Files
-- snap.register.map({'n'}, {'<leader><leader>'}, function ()
--   snap.run({
--   producer = snap.get'consumer.fzf'(snap.get'producer.ripgrep.file'),
--   select = snap.get'select.file'.select,
--   multiselect = snap.get'select.file'.multiselect,
--   views = {snap.get'preview.file'}
--   })
-- end)
-- 
-- -- Live Ripgrep
-- snap.register.map({'n'}, {'<Leader>s'}, function ()
-- snap.run {
--   producer = snap.get'producer.ripgrep.vimgrep',
--   select = snap.get'select.vimgrep'.select,
--   multiselect = snap.get'select.vimgrep'.multiselect,
--   views = {snap.get'preview.vimgrep'}
-- }
-- end)
-- 
-- -- Find Buffers
-- snap.register.map({'n'}, {'<Leader>b'}, function ()
--   snap.run({
--   producer = snap.get'consumer.fzf'(snap.get'producer.vim.buffer'),
--   select = snap.get'select.file'.select,
--   multiselect = snap.get'select.file'.multiselect,
--   views = {snap.get'preview.file'}
--   })
-- end)
-- 
-- -- Find Git Files
-- snap.register.map({'n'}, {'<Leader>g'}, function ()
--   snap.run({
-- producer = snap.get'consumer.fzf'(snap.get'producer.git.file'),
--   select = snap.get'select.file'.select,
--   multiselect = snap.get'select.file'.multiselect,
--   views = {snap.get'preview.file'}
--   })
-- end)

-- fzf-lua
api.nvim_set_keymap('n', '<leader><leader>', '<cmd>lua require("fzf-lua").files()<cr>', { noremap = true, silent = true })
api.nvim_set_keymap('n', '<leader>s', '<cmd>lua require("fzf-lua").live_grep()<cr>', { noremap = true, silent = true })
local actions = require "fzf-lua.actions"
require'fzf-lua'.setup {
  winopts = {
    win_height       = 0.85,            -- window height
    win_width        = 0.80,            -- window width
    win_row          = 0.30,            -- window row position (0=top, 1=bottom)
    win_col          = 0.50,            -- window col position (0=left, 1=right)
    -- win_border    = false,           -- window border? or borderchars?
    win_border       = { '╭', '─', '╮', '│', '╯', '─', '╰', '│' },
    window_on_create = function()         -- nvim window options override
      vim.cmd("set winhl=Normal:Normal")  -- popup bg match normal windows
    end,
  },
  -- fzf_bin             = 'sk',        -- use skim instead of fzf?
  fzf_layout          = 'reverse',      -- fzf '--layout='
  fzf_args            = '',             -- adv: fzf extra args, empty unless adv
  fzf_binds           = {               -- fzf '--bind=' options
      'f2:toggle-preview',
      'f3:toggle-preview-wrap',
      'shift-down:preview-page-down',
      'shift-up:preview-page-up',
      'ctrl-d:half-page-down',
      'ctrl-u:half-page-up',
      'ctrl-f:page-down',
      'ctrl-b:page-up',
      'ctrl-a:toggle-all',
      'ctrl-l:clear-query',
  },
  preview_border      = 'border',       -- border|noborder
  preview_wrap        = 'nowrap',       -- wrap|nowrap
  preview_opts        = 'nohidden',     -- hidden|nohidden
  preview_vertical    = 'down:45%',     -- up|down:size
  preview_horizontal  = 'right:60%',    -- right|left:size
  preview_layout      = 'flex',         -- horizontal|vertical|flex
  flip_columns        = 120,            -- #cols to switch to horizontal on flex
  -- default_previewer   = "bat",       -- override the default previewer?
                                        -- by default auto-detect bat|cat
  previewers = {
    cmd = {
      -- custom previewer, will execute:
      -- `<cmd> <args> <filename>`
      cmd             = "echo",
      args            = "",
    },
    cat = {
      cmd             = "cat",
      args            = "--number",
    },
    bat = {
      cmd             = "bat",
      args            = "--style=numbers,changes --color always",
      theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
      config          = nil,            -- nil uses $BAT_CONFIG_PATH
    },
    head = {
      cmd             = "head",
      args            = nil,
    },
    git_diff = {
      cmd             = "git diff",
      args            = "--color",
    },
  },
  -- provider setup
  files = {
    -- previewer         = "cat",       -- uncomment to override previewer
    prompt            = 'Files❯ ',
    cmd               = '',             -- "find . -type f -printf '%P\n'",
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      ["ctrl-q"]      = actions.file_sel_to_qf,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    }
  },
  git = {
    files = {
      prompt          = 'GitFiles❯ ',
      cmd             = 'git ls-files --exclude-standard',
      git_icons       = true,           -- show git icons?
      file_icons      = true,           -- show file icons?
      color_icons     = true,           -- colorize file|git icons
    },
    status = {
      prompt        = 'GitStatus❯ ',
      cmd           = "git status -s",
      previewer     = "git_diff",
      file_icons    = true,
      git_icons     = true,
      color_icons   = true,
    },
    commits = {
      prompt          = 'Commits❯ ',
      cmd             = "git log --pretty=oneline --abbrev-commit --color",
      preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
      actions = {
        ["default"] = nil,
      },
    },
    bcommits = {
      prompt          = 'BCommits❯ ',
      cmd             = "git log --pretty=oneline --abbrev-commit --color --",
      preview         = "git show --pretty='%Cred%H%n%Cblue%an%n%Cgreen%s' --color {1}",
      actions = {
        ["default"] = nil,
      },
    },
    branches = {
      prompt          = 'Branches❯ ',
      cmd             = "git branch --all --color",
      preview         = "git log --graph --pretty=oneline --abbrev-commit --color {1}",
      actions = {
        ["default"] = actions.git_switch,
      },
    },
    icons = {
      ["M"]           = { icon = "M", color = "yellow" },
      ["D"]           = { icon = "D", color = "red" },
      ["A"]           = { icon = "A", color = "green" },
      ["?"]           = { icon = "?", color = "magenta" },
      -- ["M"]          = { icon = "★", color = "red" },
      -- ["D"]          = { icon = "✗", color = "red" },
      -- ["A"]          = { icon = "+", color = "green" },
    },
  },
  grep = {
    prompt            = 'Rg❯ ',
    input_prompt      = 'Grep For❯ ',
    -- cmd               = "rg --vimgrep",
    rg_opts           = "--hidden --column --line-number --no-heading " ..
                        "--color=always --smart-case -g '!{.git,node_modules}/*'",
    git_icons         = true,           -- show git icons?
    file_icons        = true,           -- show file icons?
    color_icons       = true,           -- colorize file|git icons
    actions = {
      ["default"]     = actions.file_edit,
      ["ctrl-s"]      = actions.file_split,
      ["ctrl-v"]      = actions.file_vsplit,
      ["ctrl-t"]      = actions.file_tabedit,
      ["ctrl-q"]      = actions.file_sel_to_qf,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    }
  },
  oldfiles = {
    prompt            = 'History❯ ',
    cwd_only          = false,
  },
  buffers = {
    prompt            = 'Buffers❯ ',
    file_icons        = true,         -- show file icons?
    color_icons       = true,         -- colorize file|git icons
    sort_lastused     = true,         -- sort buffers() by last used
    actions = {
      ["default"]     = actions.buf_edit,
      ["ctrl-s"]      = actions.buf_split,
      ["ctrl-v"]      = actions.buf_vsplit,
      ["ctrl-t"]      = actions.buf_tabedit,
      ["ctrl-x"]      = actions.buf_del,
    }
  },
  colorschemes = {
    prompt            = 'Colorschemes❯ ',
    live_preview      = true,       -- apply the colorscheme on preview?
    actions = {
      ["default"]     = actions.colorscheme,
      ["ctrl-y"]      = function(selected) print(selected[2]) end,
    },
    winopts = {
      win_height        = 0.55,
      win_width         = 0.30,
      window_on_create  = function()
        vim.cmd("set winhl=Normal:Normal")
      end,
    },
    post_reset_cb     = function()
      -- reset statusline highlights after
      -- a live_preview of the colorscheme
      -- require('feline').reset_highlights()
    end,
  },
  quickfix = {
    -- cwd               = vim.loop.cwd(),
    file_icons        = true,
    git_icons         = true,
  },
  lsp = {
    prompt            = '❯ ',
    -- cwd               = vim.loop.cwd(),
    file_icons        = true,
    git_icons         = false,
    lsp_icons         = true,
    severity          = "hint",
    icons = {
      ["Error"]       = { icon = "", color = "red" },       -- error
      ["Warning"]     = { icon = "", color = "yellow" },    -- warning
      ["Information"] = { icon = "", color = "blue" },      -- info
      ["Hint"]        = { icon = "", color = "magenta" },   -- hint
    },
  },
  -- placeholders for additional user customizations
  loclist = {},
  helptags = {},
  manpages = {},
  -- optional override of file extension icon colors
  -- available colors (terminal):
  --    clear, bold, black, red, green, yellow
  --    blue, magenta, cyan, grey, dark_grey, white
  file_icon_colors = {
    ["lua"]   = "blue",
  },
}

require('gitsigns').setup()

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
