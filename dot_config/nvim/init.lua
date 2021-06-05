local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local o = vim.o  -- to set options

-- ____ GENERAL

-- o.scroll=5
o.mouse=a                                   -- Enables mouse support
o.scrolloff=999                              -- Minimal number of screen lines to keep above and below the cursor
-- o.nofoldenable                              -- All folds are open
o.virtualedit=all
o.completeopt=menuone,noinsert              -- Options for Insert mode completion
-- o.clipboard+=unnamedplus                    -- Have the clipboard be the same as my regular clipboard
o.updatetime=100                            -- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience
hidden                                    -- Buffer becomes hidden when it is abandoned

-- autocmd BufEnter * :syntax sync fromstart     -- Fix syntax color
-- autocmd BufEnter *.vue,*.js,*.ts,*.md :set scroll =4
-- o.noswapfile


-- ____ UI

-- o.termguicolors  -- Enables 24-bit RGB color in the Terminal UI
-- o.colorscheme darkspace
-- o.noshowmode     -- Disable message on the last line (Insert, Replace or Visual mode)
-- o.showtabline=2  -- Always display the line with tab page labels

-- ____ SEARCH

-- o.ignorecase -- Ignore case in search patterns
-- o.smartcase  -- Override the 'ignorecase' option if the search pattern contains upper case characters

