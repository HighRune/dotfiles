local cmd = vim.cmd
local fn = vim.fn
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local hi = vim.api.nvim_set_hl

local function core()
  augroup("chezmoi", { clear = true })
  augroup("tmux", { clear = true })
  augroup("diagnostic", { clear = true })
  augroup("qf", { clear = true })

  autocmd("BufWritePost", {
    group = "chezmoi",
    pattern = "~/.local/share/chezmoi/*",
    command = "silent! !chezmoi apply --source-path %",
  })

  autocmd("BufWritePost", {
    group = "tmux",
    pattern = "*/.config/tmux/tmux.conf",
    command = "silent! !tmux source-file ~/.config/tmux/.tmux.conf",
  })

  autocmd("ColorScheme", {
    group = "diagnostic",
    pattern = "*",
    callback = function()
      hi(0, 'DiagnosticFloatingError', { link = 'DiagnosticVirtualTextError' })
      hi(0, 'DiagnosticFloatingHint', { link = 'DiagnosticVirtualTextHint' })
      hi(0, 'DiagnosticFloatingInfo', { link = 'DiagnosticVirtualTextInfo' })
      hi(0, 'DiagnosticFloatingWarn', { link = 'DiagnosticVirtualTextWarn' })
      hi(0, 'NormalFloat', { bg = 'none' })
      hi(0, 'FloatBorder', { bg = 'none', fg = 'none' })
    end
  })

  -- Disable automatic comment insertion
  cmd([[autocmd BufWinEnter,BufRead,BufNewFile * setlocal fo-=c fo-=r fo-=o fo+=t]])

  -- Exclude quickfix buffer from the buffer list
  autocmd("FileType", {
    group = "qf",
    pattern = "qf",
    command = "set nobuflisted",
  })

  -- Automatically fitting a quickfix window to 10 lines max and 3 lines min height
  autocmd("FileType", {
    group = "qf",
    pattern = "qf",
    callback = function() cmd(math.max(math.min(fn.line("$"), 10), 3) .. "wincmd _") end,
  })
end

local function bufferline()
  augroup("bufferline", { clear = true })
  autocmd("ColorScheme", {
    group = "bufferline",
    pattern = "*",
    callback = function()
      hi(0, 'BufferLineFill', { bg = 'none' })
      hi(0, 'BufferLineBackground', { fg = '#7a7c9e' })
      hi(0, 'BufferLineBufferSelected', { fg = 'white', bg = 'none' })
    end
  })
end

local function packer()
  augroup("packer_user_config", { clear = true })
  autocmd("BufWritePost", {
    group = "packer_user_config",
    pattern = "*/.config/nvim/**",
    command = "PackerCompile",
  })
end

local function leap()
  augroup("leap", { clear = true })
  autocmd("ColorScheme", {
    group = "leap",
    pattern = "*",
    callback = function()
      require('leap').init_highlight(true)
      hi(0, 'LeapBackdrop', { bg = 'none', })
    end
  })
end

local function coq()
  augroup("coq", { clear = true })
  autocmd("BufWritePost", {
    group = "coq",
    pattern = "*/.config/nvim/coq-user-snippets/*.snip",
    command = "COQsnips compile",
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


-- Highlight a selection on yank
-- cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, higroup="IncSearch", timeout=100}]])

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

-- local function telescope()
--   cmd([[autocmd ColorScheme * highlight TelescopeBorder guibg=none]])
--   cmd([[autocmd ColorScheme * highlight TelescopeNormal guibg=none]])
-- end

return {
  packer = packer,
  indentscope = indentscope,
  core = core,
  bufferline = bufferline,
  coq = coq,
  leap = leap,
}
