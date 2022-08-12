local cmd = vim.cmd
local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local hi = vim.api.nvim_set_hl

local function core()
  augroup("chezmoi", { clear = true })
  augroup("tmux", { clear = true })
  augroup("colorscheme", { clear = true })

  autocmd("BufWritePost", {
    group = "chezmoi",
    pattern = "~/.local/share/chezmoi/*",
    command = ":silent! !chezmoi apply --source-path %",
  })
  autocmd("BufLeave", {
    group = "chezmoi",
    pattern = "~/.config/cheatsheet.md",
    command = ":silent! !chezmoi add ~/.config/cheatsheet.md",
  })

  autocmd("BufWritePost", {
    group = "tmux",
    pattern = "~/.config/tmux/tmux.conf",
    command = ":silent! !tmux source-file ~/.config/tmux/.tmux.conf",
  })

  autocmd("ColorScheme", {
    group = "colorscheme",
    pattern = "*",
    callback = function()
      hi(0, 'DiagnosticFloatingError', { link = 'DiagnosticVirtualTextError' })
      hi(0, 'DiagnosticFloatingHint', { link = 'DiagnosticVirtualTextHint' })
      hi(0, 'DiagnosticFloatingInfo', { link = 'DiagnosticVirtualTextInfo' })
      hi(0, 'DiagnosticFloatingWarn', { link = 'DiagnosticVirtualTextWarn' })
      hi(0, 'NormalFloat', { bg = 'none' })
      hi(0, 'FloatBorder', { bg = 'none', fg = 'none' })
      hi(0, 'StatusLine', { bg = 'none', fg = 'red' })
    end
  })

  local qf = augroup("qf", { clear = true })

  -- Exclude quickfix buffer from the buffer list
  autocmd("FileType", {
    pattern = "qf",
    group = qf,
    command = "set nobuflisted",
  })

  -- Automatically fitting a quickfix window to 10 lines max and 3 lines min height
  autocmd("FileType", {
    pattern = "qf",
    group = qf,
    callback = function() cmd(math.max(math.min(fn.line("$"), 10), 3) .. "wincmd _") end,
  })
end

local function bufferline()
  cmd([[
  autocmd ColorScheme * highlight BufferLineFill guibg=none
  autocmd ColorScheme * highlight BufferLineBackground guifg=#7a7c9e
  autocmd ColorScheme * highlight BufferLineBufferSelected guifg=white gui=none
  ]])
end

local function sneak()
  cmd([[
  " autocmd User SneakLeave highlight clear Sneak
  " autocmd User SneakLeave highlight clear SneakScope
  autocmd ColorScheme * highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=red
  ]])
end

local function packer()
  augroup("packer_user_config", { clear = true })
  autocmd("BufWritePost", {
    group = "packer_user_config",
    pattern = "~/.local/share/chezmoi/dot_config/nvim/*",
    command = ":PackerCompile",
  })
end

local function indentscope()
  augroup("indentscope", { clear = true })
  autocmd("FileType", {
    group = "indentscope",
    pattern = "*",
    command = "if index(['help', 'startify', 'dashboard', 'packer', 'neogitstatus', 'NvimTree', 'neo-tree', 'Trouble'], &ft) != -1 || index(['nofile', 'terminal', 'lsp-installer', 'lspinfo'], &bt) != -1 | let b:miniindentscope_disable=v:true | endif",
  })
end

-- cmd([[
-- autocmd ColorScheme * highlight CursorLine gui=bold guibg=none
-- autocmd ColorScheme * highlight VertSplit guifg=#292e42
-- autocmd ColorScheme * highlight Hlargs guifg=#FAFF00
-- ]])

-- local function neoformat()
--   -- Format on write
--   augroup("neoformat", { clear = true })
--   autocmd("BufWritePre", {
--     group = "neoformat",
--     pattern = "*.lua",
--     command = "undojoin | Neoformat",
--     -- command = "try | undojoin | Neoformat | catch /^Vim%((\a+))=:E790/ | finally | silent Neoformat | endtry",
--   })

--   cmd([[
--     augroup fmt
--     autocmd!
--     autocmd BufWritePre *.lua undojoin | Neoformat
--     augroup END
--   ]])
-- end

-- local function targets()
--   cmd([[
--     autocmd User targets#mappings#user call targets#mappings#extend({
--     \ 'b': {'argument': [{'o': '(', 'c': ')', 's': ','}]},
--     \ 'a': {'argument': [{'o': '\[', 'c': '\]', 's': ','}]},
--     \ 'o': {'argument': [{'o': '{', 'c': '}', 's': ','}]},
--     \ 'B': {'pair': [{'o':'(', 'c':')'}]},
--     \ 'A': {'pair': [{'o':'[', 'c':']'}]},
--     \ 'O': {'pair': [{'o':'{', 'c':'}'}]},
--     \ 'Q': {'quote': [{'d': '`'}]},
--     \ 's': { 'separator': [{'d':','}, {'d':'.'}, {'d':';'}, {'d':':'}, {'d':'+'}, {'d':'-'},
--     \ {'d':'='}, {'d':'~'}, {'d':'_'}, {'d':'*'}, {'d':'#'}, {'d':'/'},
--     \ {'d':'\'}, {'d':'|'}, {'d':'&'}, {'d':'$'}] },
--     \ })
--   ]])
-- end

-- local function telescope()
--   cmd([[autocmd ColorScheme * highlight TelescopeBorder guibg=none]])
--   cmd([[autocmd ColorScheme * highlight TelescopeNormal guibg=none]])
-- end

return {
  packer = packer,
  indentscope = indentscope,
  sneak = sneak,
  core = core,
  bufferline = bufferline,
}
