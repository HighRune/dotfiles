local cmd = vim.cmd -- to execute Vim commands e.g. cmd('pwd')

-------------------- STYLE

-- cmd([[autocmd ColorScheme * highlight NormalFloat guibg=none]])
-- cmd([[autocmd ColorScheme * highlight FloatBorder guifg=blue guibg=none]])

-- cmd([[color haslo]])
-- o.colorscheme darkspace

require("options")

-- cmd([[au FocusGained,BufEnter * :silent! !]]) -- Reload when entering the buffer or gaining focus
-- cmd([[au FocusLost,WinLeave * :silent! w]]) -- Save when exiting the buffer or losing focus
-- cmd([[autocmd BufEnter * :syntax sync fromstart]])     -- Fix syntax color

-- Highlight a selection on yank
cmd([[au TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=100}]])
-- Disable automatic comment insertion
cmd([[autocmd BufWinEnter,BufRead,BufNewFile * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])

-- twpayne/chezmoi
cmd([[autocmd BufWritePost ~/.local/share/chezmoi/* :silent! !chezmoi apply --source-path %]])
cmd([[autocmd BufLeave ~/.config/cheatsheet.md :silent! !chezmoi add ~/.config/cheatsheet.md]])

-------------------- PLUGINS

require("mappings").vanilla()

require("plugins")

-------------------- terryma/vim-expand-region
-- cmd([[
-- map <cr> <Plug>(expand_region_expand)
-- map <s-cr> <Plug>(expand_region_shrink)
-- let g:expand_region_text_objects = { 'i]':1, 'i)':1, 'i}':1, 'it':1, 'ii':1, 'ip':1, 'a]':1, 'a)':1, 'a}':1, 'at':1, 'ai':1, 'ap':1 }
-- ]])

-------------------- kana/vim-arpeggio
-- cmd("call arpeggio#map('i', '', 0, 'jk', '<Esc>')")

-------------------- matze/vim-move
-- cmd("let g:move_key_modifier = 'S'")

-------------------- AndrewRadev/sideways.vim
-- api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
-- api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)

-- -------------------- svermeulen/vim-yoink
-- cmd([[
-- nmap <c-n> <plug>(YoinkPostPasteSwapBack)
-- nmap <c-p> <plug>(YoinkPostPasteSwapForward)

-- nmap p <plug>(YoinkPaste_p)
-- nmap P <plug>(YoinkPaste_P)

-- " Also replace the default gp with yoink paste so we can toggle paste in this case too
-- nmap gp <plug>(YoinkPaste_gp)
-- nmap gP <plug>(YoinkPaste_gP)

-- let g:yoinkMaxItems = 5
-- let g:yoinkAutoFormatPaste = 1
-- let g:yoinkSwapClampAtEnds = 0
-- let g:yoinkSyncSystemClipboardOnFocus = 0
-- ]])
