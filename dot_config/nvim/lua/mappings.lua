local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local call = vim.call
local api = vim.api
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local diagnostic = vim.diagnostic
local lsp = vim.lsp
local silent = { silent = true }
local expr = { expr = true }
local remap = { remap = true }

local function core()
  -- Help
  cmd("cnoreabbrev <expr> h getcmdtype() == ':' && getcmdline() == 'h' ? 'tab h' : 'h'")
  cmd("cnoreabbrev <expr> help getcmdtype() == ':' && getcmdline() == 'help' ? 'tab help' : 'help'")
  cmd([[
		func Eatchar(pat)
	      let c = nr2char(getchar(0))
	      return (c =~ a:pat) ? '' : c
	   endfunc
	   iabbr <silent> co console.log('<C-R>=Eatchar('\s')<CR>
	]])
  -- Disable keys
  map("", "Q", "<nop>")
  map("", "q", "<nop>")
  -- Save
  map("n", "<C-s>", ":silent write<CR>")
  map("i", "<C-s>", "<esc>`^:silent write<CR>")
  -- Edit
  map("x", "<C-n>", ":norm ")
  map("n", "<esc>", "<esc>^")
  map("x", "p", '"_dP')
  -- map({ "n", "v" }, "x", '"_x')
  -- map({ 'n', 'x' }, 's', 'f')
  -- map({ 'n', 'x' }, 'S', 'F')
  -- Delete
  map({ "n", "v" }, "d", '"_d')
  map("n", "D", '"_D')
  map("n", "dd", '"_dd^')
  -- Cut
  map({ "n", "v" }, "m", 'd')
  map("n", "M", 'D')
  map("n", "mm", 'dd^')
  -- Scroll
  map({ "n", "x" }, "<C-u>", "5k")
  map({ "n", "x" }, "<C-e>", "5j")
  -- Readline
  map("i", "<C-a>", "<esc>I")
  map("i", "<C-e>", "<end>")
  map("i", "<C-k>", "<esc>ld$i")
  -- Motions
  -- map({ "n", "x", "o" }, "s", "l")
  map("n", "k", "gk")
  map("n", "j", "gj")
  map("n", "0", "g0")
  map("n", "$", "g$:set ve= ve=all<CR>")
  map("n", "^", "g^")
  map("n", "&", "g^")

  -- Buffers
  map("n", "<Leader>q", ":bwipeout!<CR>", silent)
  -- map("n", "<Tab>", ":bnext<CR>", silent)
  -- map("n", "<S-Tab>", ":bprevious<CR>", silent)

  -- Quickfix list
  map("n", "<leader><Tab>", require("booster").addBuffersToQfList)
  map("n", "<C-down>", require("booster").cycleNextLocItem, silent)
  map("n", "<C-up>", require("booster").cyclePrevLocItem, silent)
  map("n", "<C-q>", "&buftype is# 'quickfix' ? ':try | cclose | catch | q! | catch | endtry<CR>' : ':q!<CR>'", expr)

  -------------------- Runeword/booster.nvim
  -- map({ "n", "x" }, "x", require("booster").snapToLineEnd('"_x'))

  map({ "n", "x" }, "glp", require("booster").putLinewise(']p`]'))
  map({ "n", "x" }, "glP", require("booster").putLinewise(']P`]'))
  map({ "n", "x" }, "gllp", require("booster").putLinewiseSuffix(']p`]'))
  map({ "n", "x" }, "gllP", require("booster").putLinewiseSuffix(']P`]'))
  map({ "n", "x" }, "glsp", require("booster").putLinewiseSurround(']p`]'))
  map({ "n", "x" }, "glsP", require("booster").putLinewiseSurround(']P`]'))
  vim.keymap.set("n", "t", require("booster").__dot_repeat, { expr = true })

  -- local counter = 0
  --
  -- function _G.__dot_repeat(motion) -- 4.
  --     if motion == nil then
  --         vim.o.operatorfunc = "v:lua.require('booster').snapToLineEnd('_x')()"
  --         return "g@$" -- 2.
  --     end
  --
  --     -- print("counter:", counter, "motion:", motion)
  --     counter = counter + 1
  -- end
  --
  -- vim.keymap.set("n", "ga", _G.__dot_repeat, expr)

  -- map({ "n", "x" }, "p", require("booster").jumpToLineEnd(require("booster").putCharwise('p')))
  map({ "n", "x" }, "p", require("booster").putCharwise('p'))
  map({ "n", "x" }, "P", require("booster").jumpToLineStart(require("booster").putCharwise('P')))
  map({ "n", "x" }, "gp", require("booster").putCharwisePrefix('p'))
  map({ "n", "x" }, "gP", require("booster").putCharwiseSuffix('P'))
  map({ "n", "x" }, "gsp", require("booster").putCharwiseSurround('p'))
  map({ "n", "x" }, "gsP", require("booster").putCharwiseSurround('P'))
  -- map({ "n", "x" }, "gp", require("booster").putCharwisePrefix('geep'))
  -- map({ "n", "x" }, "gP", require("booster").putCharwiseSuffix('gewP'))
  -- map({ "n", "x" }, "gsp", require("booster").putCharwiseSurround('geep'))
  -- map({ "n", "x" }, "gsP", require("booster").putCharwiseSurround('gewP'))

  -- -- stylua: ignore
  -- map("n", "gm", "(virtcol('$') / 2) . '<Bar>'", { expr = true })
  -- Words
  -- map("o", "w", "iw")
  -- map("o", "W", "iW", remap)

  -- Cut
  -- map("x", "d", "ygvd", opts)
  -- map("x", "c", "ygvc", opts)
  -- map("x", "x", "ygvx", opts)
  -- Join
  -- cmd([[
  -- " Like gJ, but always remove spaces
  -- fun! s:join_spaceless()
  -- execute 'normal! gJ'

  -- " Remove character under the cursor if it's whitespace.
  -- if matchstr(getline('.'), '\%' . col('.') . 'c.') =~ '\s'
  -- execute 'normal! dw'
  -- endif
  -- endfun

  -- " Map it to a key
  -- nnoremap J :call <SID>join_spaceless()<CR>
  -- ]])
end

-------------------- nvim-telescope/telescope.nvim
local function telescope()
  -- map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", opts)
  -- map("n", "<leader>s", "<cmd>Telescope live_grep<cr>", opts)
  -- map("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
end

-------------------- junegunn/fzf
local function fzf()
  map("n", "<Leader><Leader>", "<cmd>lua require('fzf-lua').files()<CR>")
  map("n", "<Leader>s", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>")
  map("n", "<Leader>h", "<cmd>lua require('fzf-lua').help_tags()<CR>")
  -- map("n", "<Leader><Tab>", "<cmd>lua require('fzf-lua').buffers()<CR>")
  -- map("n", "<Leader>x", "<cmd>lua require('fzf-lua').quickfix({multiprocess=true})<CR>")
end

-------------------- phaazon/hop.nvim
local function hop()
  -- map("n", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
  -- map("v", "s", "<cmd>lua require('hop').hint_words()<cr>", {})

  -- map("n", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
  -- map("v", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
end

-------------------- ghillb/cybu.nvim
local function cybu()
  map("n", "<Tab>", "<Plug>(CybuNext)")
  map("n", "<S-Tab>", "<Plug>(CybuPrev)")
end

-------------------- jonatan-branting/nvim-better-n
local function bettern()
  map("n", "n", require("better-n").n, { nowait = true })
  map("n", "<s-n>", require("better-n").shift_n, { nowait = true })
end

local function vindent()
  -- g.vindent_motion_diff_prev = "<C-k>"
  -- g.vindent_motion_diff_next = "<C-j>"
end

-------------------- inside/vim-search-pulse
-- local function pulse()
-- cmd([[
-- nmap n n<Plug>Pulse
-- nmap N N<Plug>Pulse
-- nmap * *<Plug>Pulse
-- nmap # #<Plug>Pulse
-- " Pulses cursor line on first match
-- " when doing search with / or ?
-- cmap <silent> <expr> <enter> search_pulse#PulseFirst()
-- ]])
-- end

-------------------- jeetsukumaran/vim-indentwise
-- local function indentwise()
-- map("n", "<C-k>", "<Plug>(IndentWisePreviousGreaterIndent)")
-- map("n", "<C-j>", "<Plug>(IndentWiseNextLesserIndent)")
-- map("n", "<C-right>", "<Plug>(IndentWisePreviousLesserIndent)")
-- map("n", "<C-left>", "<Plug>(IndentWiseNextGreaterIndent)")
-- end

local function leap()
  map({ "n", "x" }, "s", "<Plug>(leap-forward)", remap)
  map({ "n", "x" }, "S", "<Plug>(leap-backward)", remap)
end

-------------------- justinmk/vim-sneak
local function sneak()
  -- map("n", "f", "8s", remap)
  -- map("n", "F", "8S", remap)
  -- map({ "n", "x", "o" }, "s", "<Plug>Sneak_s")
  -- map({ "n", "x", "o" }, "S", "<Plug>Sneak_S")

  map({ "n", "x" }, "s", ":<C-U>call sneak#wrap('', 2, 0, 2, 1)<CR>")
  map({ "n", "x" }, "S", ":<C-U>call sneak#wrap('', 2, 1, 2, 1)<CR>")
  map({ "n", "x", "o" }, "f", "<Plug>Sneak_f")
  map({ "n", "x", "o" }, "F", "<Plug>Sneak_F")
  -- map({ "n", "x", "o" }, "t", "<Plug>Sneak_t")
  -- map({ "n", "x", "o" }, "T", "<Plug>Sneak_T")

  cmd([[
  nmap <expr> n sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n'
  nmap <expr> N sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N'
  ]])
  -- vim.api.nvim_set_keymap("", "n", [[sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n']], expr)
  -- vim.api.nvim_set_keymap("", "N", [[sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N']], expr)
end

-------------------- lewis6991/gitsigns.nvim
local function gitsigns(bufnr)
  local gs = package.loaded.gitsigns

  local function mmap(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    map(mode, l, r, opts)
  end

  -- Navigation
  mmap("n", "<S-right>", "&diff ? '<S-right>' : '<cmd>Gitsigns next_hunk<CR>'", expr)
  mmap("n", "<S-left>", "&diff ? '<S-left>' : '<cmd>Gitsigns prev_hunk<CR>'", expr)

  -- Actions
  -- mmap({ "n", "v" }, "<leader>ha", gs.stage_hunk)
  -- mmap({ "n", "v" }, "<leader>hr", gs.undo_stage_hunk)
  -- mmap({ "n", "v" }, "<leader>hc", gs.reset_hunk)
  mmap("n", "<leader>ga", gs.stage_buffer)
  mmap("n", "<leader>gr", gs.reset_buffer_index)
  mmap("n", "<leader>gc", gs.reset_buffer)
  mmap("n", "<leader>gb", gs.toggle_current_line_blame)
  mmap("n", "<leader>gd", gs.toggle_deleted)

  -- Text object
  -- mmap({ "o", "x" }, "g", ":<C-U>Gitsigns select_hunk<CR>")
end

-------------------- akinsho/bufferline.nvim
local function bufferline()
  map("n", "<tab>", ":BufferLineCycleNext<cr>", silent)
  map("n", "<s-tab>", ":BufferLineCyclePrev<cr>", silent)
  map("n", "<pageup>", ":BufferLineMovePrev<cr>", silent)
  map("n", "<pagedown>", ":BufferLineMoveNext<cr>", silent)
  map("n", "<a-1>", function() require("bufferline").go_to_buffer(1) end)
  map("n", "<a-2>", function() require("bufferline").go_to_buffer(2) end)
  map("n", "<a-3>", function() require("bufferline").go_to_buffer(3) end)
  map("n", "<a-4>", function() require("bufferline").go_to_buffer(4) end)
  map("n", "<a-5>", function() require("bufferline").go_to_buffer(5) end)
  map("n", "<a-6>", function() require("bufferline").go_to_buffer(6) end)
  map("n", "<a-7>", function() require("bufferline").go_to_buffer(7) end)
  map("n", "<a-8>", function() require("bufferline").go_to_buffer(8) end)
  map("n", "<a-9>", function() require("bufferline").go_to_buffer(-1) end)
end

-------------------- AndrewRadev/splitjoin.vim
local function splitjoin()
  g.splitjoin_split_mapping = ""
  g.splitjoin_join_mapping = ""
  map("n", "gj", ":SplitjoinJoin<cr>")
  map("n", "gk", ":SplitjoinSplit<cr>")
end

-------------------- is0n/fm-nvim
local function fm()
  map("n", "<leader>n", ":Vifm<cr>")
end

-------------------- kana/vim-arpeggio
local function arpeggio()
  -- call("arpeggio#map", "n", "", 0, "ns", "8s")
  -- call("arpeggio#map", "n", "", 0, "NS", "8S")
  -- call("arpeggio#map", "n", "e", 0, "hl", "(virtcol('$') / 2) . '<Bar>'")
  -- map("n", "<Plug>(arpeggio-default:s)", "l")
end

-------------------- monaqa/dial.nvim
local function dial()
  map("n", "<C-a>", require("dial.map").inc_normal())
  map("n", "<C-x>", require("dial.map").dec_normal())
  map("v", "<C-a>", require("dial.map").inc_visual())
  map("v", "<C-x>", require("dial.map").dec_visual())
  map("v", "g<C-a>", require("dial.map").inc_gvisual())
  map("v", "g<C-x>", require("dial.map").dec_gvisual())
end

-------------------- chaoren/vim-wordmotion
local function wordmotion()
  g.wordmotion_nomap = 1
  -- map({ "n", "o", "x" }, "gw", "<Plug>WordMotion_w")
  -- map({ "n", "o", "x" }, "W", "<Plug>WordMotion_w")
  -- map({ "n", "o", "x" }, "B", "<Plug>WordMotion_b")
  -- map({ "n", "o", "x" }, "E", "<Plug>WordMotion_e")
  -- map({ "n", "o", "x" }, "gE", "<Plug>WordMotion_ge")
  -- map({ "o", "x" }, "iW", "<Plug>WordMotion_iw")
  -- map({ "o", "x" }, "aW", "<Plug>WordMotion_aw")
  -- map({ "n", "o", "x" }, "w", "<Plug>WordMotion_W")
  -- map({ "n", "o", "x" }, "b", "<Plug>WordMotion_B")
  -- map({ "n", "o", "x" }, "e", "<Plug>WordMotion_E")
  -- map({ "n", "o", "x" }, "ge", "<Plug>WordMotion_gE")
  -- map({ "o", "x" }, "iw", "<Plug>WordMotion_iW")
  -- map({ "o", "x" }, "aw", "<Plug>WordMotion_aW")
end

-------------------- neovim/nvim-lspconfig
local function lspconfig(buffer)
  map("n", "gd", lsp.buf.definition, { buffer = buffer })
  map("n", "gr", lsp.buf.references, { buffer = buffer })
  map("n", '<leader>f', lsp.buf.format, { buffer = buffer })
  map("n", '<down>', diagnostic.goto_prev, { buffer = buffer })
  map("n", '<up>', diagnostic.goto_next, { buffer = buffer })
  map('n', '<leader>l', diagnostic.setloclist, { noremap = true, silent = true })
  map('n', '<leader>x', diagnostic.setqflist, { noremap = true, silent = true })
  -- lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' })
  -- lsp.buf.formatting_seq_sync
end

local function coq()
  map("i", "<Esc>", [[pumvisible() ? "<C-e><Esc>`^" : "<Esc>`^"]], expr)
  map("i", "<C-c>", [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], expr)
  map("i", "<Tab>", [[pumvisible() ? "<C-n>" : "<Tab>"]], expr)
  map("i", "<S-Tab>", [[pumvisible() ? "<C-p>" : "<BS>"]], expr)
end

local function hydra()
  local Hydra = require('hydra')

  Hydra({ name = 'newline', mode = 'n', body = 'g',
    heads = {
      { 'o', '<cmd>:set paste<CR>m`o<Esc>``:set nopaste<CR>' },
      { 'O', '<cmd>:set paste<CR>m`O<Esc>``:set nopaste<CR>' },
    }
  })

  Hydra({ mode = 'n', body = '<c-u>',
    config = {
      invoke_on_body = true,
      on_enter = function() fn.execute("normal! 5k") end,
      hint = false,
    },
    heads = {
      { 'u', '5k' },
      { 'e', '5j' },
    }
  })

  Hydra({ name = 'scroll', mode = 'n', body = '<c-e>',
    config = {
      invoke_on_body = true,
      on_enter = function() fn.execute("normal! 5j") end,
      hint = false
    },
    heads = {
      { 'u', '5k' },
      { 'e', '5j' },
    }
  })

  -- Hydra({ name = 'scroll', mode = 'n', body = '<C-u>', config = { invoke_on_body = true }, heads = {
  --   { 'u', '5k' },
  --   { 'e', '5j' },
  -- } })

  -- Hydra({ name = 'gw', mode = { 'o', 'n' }, body = 'gw',
  --   config = {
  --     color = 'pink',
  --     invoke_on_body = true,
  --     on_enter = function()
  --       print('hydra enter')
  --     end
  --   },
  --   heads = {
  --     { 'w', '<Plug>WordMotion_w', { silent = true } },
  --     { 'b', '<Plug>WordMotion_b', { silent = true } },
  --     { 'e', '<Plug>WordMotion_e', { silent = true } },
  --     { 'iw', '<Plug>WordMotion_iw', { silent = true } },
  --     { 'aw', '<Plug>WordMotion_aw', { silent = true } },
  --     { 'q', nil, { exit = true } },
  --     { '<Esc>', nil, { exit = true } },
  --     { '<C-s>', nil, { exit = true } }
  --   } })

  -- map({ "n", "o", "x" }, "s", "<Plug>(textobj-specialcharacter)")
  -- fn["submode#map"]("newline", "n", "s", "e", "<Plug>(textobj-specialcharacter)")
end

local function textobjchainmember()
  cmd("let g:textobj_chainmember_no_default_key_mappings = 1")
  map("o", "am", "<Plug>(textobj-chainmember-a)")
  map("o", "im", "<Plug>(textobj-chainmember-i)")
  -- map("o", "", "<Plug>(textobj-chainmember-last-a)")
  -- map("o", "", "<Plug>(textobj-chainmember-last-i)")
  -- map("o", "", "<Plug>(textobj-chainmember-next-a)")
  -- map("o", "", "<Plug>(textobj-chainmember-next-i)")
end

return {
  core = core,
  telescope = telescope,
  splitjoin = splitjoin,
  arpeggio = arpeggio,
  fm = fm,
  wordmotion = wordmotion,
  lspconfig = lspconfig,
  hop = hop,
  bufferline = bufferline,
  coq = coq,
  fzf = fzf,
  dial = dial,
  sneak = sneak,
  gitsigns = gitsigns,
  textobjchainmember = textobjchainmember,
  vindent = vindent,
  cybu = cybu,
  hydra = hydra,
  leap = leap,
  bettern = bettern,
}
