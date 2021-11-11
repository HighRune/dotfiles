-- Enable lua formater
cmd("let g:neoformat_enabled_lua = ['stylua']")

-- Format on write
cmd([[
augroup fmt
autocmd! au BufWritePre *.lua
try | undojoin | Neoformat |
catch /^Vim\%((\a\+)\)\=:E790/ |
finally | silent Neoformat |
endtry augroup END
]])

-- cmd("let g:neoformat_enabled_javascript = ['eslint_d']")
-- cmd("let g:neoformat_enabled_typescript = ['eslint_d']")
-- vim.api.nvim_command([[autocmd BufWritePre * lua vim.lsp.buf.formatting_seq_sync()]])
-- api.nvim_set_keymap("n", "<leader>f", ":Neoformat<CR>", { noremap = true })
