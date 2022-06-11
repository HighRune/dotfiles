local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local call = vim.call
local api = vim.api
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
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
  map("n", "<C-s>", ":w<CR>")
  map("i", "<C-s>", "<esc>`^:w<CR>")
  -- Edit
  -- map("x", "p", '"_dP')
  map("x", "<C-n>", ":norm ")
  map("n", "<esc>", "<esc>^")
  map("n", "dd", 'dd^')
  -- Scroll
  map({ "n", "x" }, "<C-u>", "5k")
  map({ "n", "x" }, "<C-e>", "5j")
  -- Readline
  map("i", "<C-a>", "<esc>I")
  map("i", "<C-e>", "<end>")
  map("i", "<C-k>", "<esc>ld$i")
  -- Motions
  map({ "n", "x", "o" }, "s", "l")
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
  map("n", "<C-j>", require("booster").cycleNextQfItem, silent)
  map("n", "<C-k>", require("booster").cyclePrevQfItem, silent)
  map("n", "<C-q>", "&buftype is# 'quickfix' ? ':try | cclose | catch | q! | catch | endtry<CR>' : ':q!<CR>'", expr)

  -- `[ To beginning of previously changed or yanked text
  -- `] To end of previously changed or yanked text
  -- ]p Paste under the current indentation level

  -- -- Put linewise
  -- map({"n","x"}, "glp", require("booster").putLinewise('"0]p`]'))
  -- map({"n","x"}, "glP", require("booster").putLinewise('"0]P`]'))
  -- Put charwise
  map({"n", "x"}, "p", require("booster").putCharwise('"0p'))
  map({"n", "x"}, "P", require("booster").putCharwise('"0P'))
  map({"n", "x"}, "gp", require("booster").putCharwise('"0p', true))
  map({"n", "x"}, "gP", require("booster").putCharwise('"0P', nil, true))
  map({"n", "x"}, "gsp", require("booster").putCharwise('"0p', true, true))
  map({"n", "x"}, "gsP", require("booster").putCharwise('"0P', true, true))
  -- Put linewise
  -- map({"n","x"}, "glm", require("booster").putLinewise(']p`]'))
  -- map({"n","x"}, "glM", require("booster").putLinewise(']P`]'))
  -- Put charwise
  -- map({"n", "x"}, "m", require("booster").putCharwise('p'))
  -- map({"n", "x"}, "M", require("booster").putCharwise('P'))
  -- map({"n", "x"}, "gm", require("booster").putCharwise('p', true))
  -- map({"n", "x"}, "gM", require("booster").putCharwise('P', nil, true))
  -- map({"n", "x"}, "gsm", require("booster").putCharwise('p', true, true))
  -- map({"n", "x"}, "gsm", require("booster").putCharwise('P', true, true))

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

-------------------- wbthomason/packer.nvim
local function packer() end

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

-------------------- wellle/targets.vim
local function targets()
  -- Text objects
  -- -- map("o", "p", "ip", remap)
  -- map("o", "np", "inp", remap)
  -- map("o", "lp", "ilp", remap)
  -- -- map("o", "P", "iP", remap)
  -- map("o", "nP", "inP", remap)
  -- map("o", "lP", "ilP", remap)
  -- -- map("o", "q", "iq", remap)
  -- map("o", "lq", "ilq", remap)
  -- map("o", "nq", "inq", remap)
  -- -- map("o", "Q", "iQ", remap)
  -- map("o", "lQ", "ilQ", remap)
  -- map("o", "nQ", "inQ", remap)

  -- Motions
  -- map("n", "ga", "vInao<esc>", remap)
  -- map("n", "gA", "vIlao<esc>", remap)
  -- map("n", "gA", "vanAo<esc>", remap)
  -- map("n", "gp", "vInpo<esc>", remap)
  -- map("n", "gP", "vanPo<esc>", remap)
  -- map("n", "ge", "vIneo<esc>", remap)
  -- map("n", "gE", "vanEo<esc>", remap)
  -- map("n", "gq", "vanqo<esc>", remap)
  -- map("n", "gQ", "vanQo<esc>", remap)

  -- cmd([[
  -- nmap <silent> <Plug>goToNextQuote  vanqo<esc>
  -- \ :call repeat#set("\<Plug>goToNextQuote", v:count)<cr>
  -- nmap gq <Plug>goToNextQuote
  -- ]])
end

-------------------- phaazon/hop.nvim
local function hop()
  -- map("n", "s", "<cmd>lua require('hop').hint_words()<cr>", {})
  -- map("v", "s", "<cmd>lua require('hop').hint_words()<cr>", {})

  -- map("n", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
  -- map("v", "l", "<cmd>lua require('hop').hint_lines()<cr>", {})
end

local function cybu()
  map("n", "<Tab>", "<Plug>(CybuNext)")
  map("n", "<S-Tab>", "<Plug>(CybuPrev)")
end

local function vindent()
  -- g.vindent_motion_diff_prev = "<C-k>"
  -- g.vindent_motion_diff_next = "<C-j>"
end

-------------------- inside/vim-search-pulse
local function pulse()
  -- cmd([[
  -- nmap n n<Plug>Pulse
  -- nmap N N<Plug>Pulse
  -- nmap * *<Plug>Pulse
  -- nmap # #<Plug>Pulse
  -- " Pulses cursor line on first match
  -- " when doing search with / or ?
  -- cmap <silent> <expr> <enter> search_pulse#PulseFirst()
  -- ]])
end

-------------------- jeetsukumaran/vim-indentwise
local function indentwise()
  -- map("n", "<C-k>", "<Plug>(IndentWisePreviousGreaterIndent)")
  -- map("n", "<C-j>", "<Plug>(IndentWiseNextLesserIndent)")
  -- map("n", "<C-right>", "<Plug>(IndentWisePreviousLesserIndent)")
  -- map("n", "<C-left>", "<Plug>(IndentWiseNextGreaterIndent)")
end

-------------------- justinmk/vim-sneak
local function sneak()
  -- map({ "n", "x" }, "f", ":<C-U>call sneak#wrap('', 2, 0, 2, 0)<CR>")
  -- map({ "n", "x" }, "F", ":<C-U>call sneak#wrap('', 2, 1, 2, 0)<CR>")
  -- map("n", "f", "8s", remap)
  -- map("n", "F", "8S", remap)
  -- map({ "n", "x", "o" }, "s", "<Plug>Sneak_s")
  -- map({ "n", "x", "o" }, "S", "<Plug>Sneak_S")
  map({ "n", "x", "o" }, "f", "<Plug>Sneak_f")
  map({ "n", "x", "o" }, "F", "<Plug>Sneak_F")
  map({ "n", "x", "o" }, "t", "<Plug>Sneak_t")
  map({ "n", "x", "o" }, "T", "<Plug>Sneak_T")
  cmd([[
  nmap <expr> n sneak#is_sneaking() ? '<Plug>Sneak_;' : 'n'
  nmap <expr> N sneak#is_sneaking() ? '<Plug>Sneak_,' : 'N'
]] )
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
  -- map("n", "<tab>", ":BufferLineCycleNext<cr>", silent)
  -- map("n", "<s-tab>", ":BufferLineCyclePrev<cr>", silent)
  -- map("n", "<pageup>", ":BufferLineMovePrev<cr>", silent)
  -- map("n", "<pagedown>", ":BufferLineMoveNext<cr>", silent)
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
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { buffer = buffer })
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { buffer = buffer })
  map("n", "<leader>i", "<cmd>lua vim.lsp.buf.implementation()<CR>", { buffer = buffer })
  map("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { buffer = buffer })
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { buffer = buffer })
  map("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", { buffer = buffer })
  map("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", { buffer = buffer })
  map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", { buffer = buffer })
  map("n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", { buffer = buffer })
  map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", {
    buffer = buffer,
  })
  map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { buffer = buffer })
  map("n", "<left>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { buffer = buffer })
  map("n", "<right>", "<cmd>lua vim.diagnostic.goto_next()<CR>", { buffer = buffer })
  -- map("n", "<leader>h", "<cmd>lua vim.diagnostic.open_float()<CR>", { buffer = buffer })
  -- "<cmd>lua vim.lsp.buf.formatting_seq_sync(nil, 6000, { 'tsserver', 'html', 'cssls', 'vuels', 'eslint' ))<CR>"
  -- "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>"
end

local function coq()
  map("i", "<Esc>", [[pumvisible() ? "<C-e><Esc>`^" : "<Esc>`^"]], expr)
  map("i", "<C-c>", [[pumvisible() ? "<C-e><C-c>" : "<C-c>"]], expr)
  map("i", "<Tab>", [[pumvisible() ? "<C-n>" : "<Tab>"]], expr)
  map("i", "<S-Tab>", [[pumvisible() ? "<C-p>" : "<BS>"]], expr)
end

-------------------- kana/vim-submode
local function submode()
  fn["submode#enter_with"]("newline", "n", "s", "go", ":set paste<CR>m`o<Esc>``:set nopaste<CR>")
  fn["submode#enter_with"]("newline", "n", "s", "gO", ":set paste<CR>m`O<Esc>``:set nopaste<CR>")
  fn["submode#map"]("newline", "n", "s", "o", ":set paste<CR>m`o<Esc>``:set nopaste<CR>")
  fn["submode#map"]("newline", "n", "s", "O", ":set paste<CR>m`O<Esc>``:set nopaste<CR>")
  -- fn["submode#enter_with"]("ge", "n", "", "ge", "ge")
  -- fn["submode#leave_with"]("ge", "n", "", "g")
  -- fn["submode#map"]("ge", "n", "", "e", "ge")
  -- fn["submode#enter_with"]("gE", "n", "", "gE", "gE")
  -- fn["submode#leave_with"]("gE", "n", "", "g")
  -- fn["submode#map"]("gE", "n", "", "E", "gE")
  -- fn["submode#enter_with"]("ge", "n", "", "ge", "<Plug>WordMotion_gE")
  -- fn["submode#map"]("ge", "n", "", "e", "<Plug>WordMotion_gE")
  -- fn["submode#enter_with"]("gp", "n", "", "gP", "gP")
  -- fn["submode#enter_with"]("gp", "n", "", "gp", "gp")
  -- fn["submode#map"]("gp", "n", "", "P", "gP")
  -- fn["submode#map"]("gp", "n", "", "p", "gp")

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

-------------------- AndrewRadev/sideways.vim
-- local function sideways()
-- map("n", "<c-j>", ":SidewaysLeft<cr>", opts)
-- map("n", "<c-k>", ":SidewaysRight<cr>", opts)
-- end
-------------------- bkad/CamelCaseMotion
-- local function camelCaseMotion()
-- cmd([[
-- map <silent> W <Plug>CamelCaseMotion_w
-- map <silent> B <Plug>CamelCaseMotion_b
-- map <silent> E <Plug>CamelCaseMotion_e
-- map <silent> gE <Plug>CamelCaseMotion_ge
-- omap <silent> iW <Plug>CamelCaseMotion_iw
-- omap <silent> iB <Plug>CamelCaseMotion_ib
-- omap <silent> iE <Plug>CamelCaseMotion_ie
-- xmap <silent> iW <Plug>CamelCaseMotion_iw
-- xmap <silent> iB <Plug>CamelCaseMotion_ib
-- xmap <silent> iE <Plug>CamelCaseMotion_ie
-- ]])
-- end
-------------------- bfredl/nvim-miniyank
-- local function miniyank()
-- map("", "p", "<Plug>(miniyank-autoput)", { silent = true })
-- map("", "P", "<Plug>(miniyank-autoPut)", { silent = true })
-- map("", "<c-n>", "<Plug>(miniyank-cycle)", { silent = true })
-- map("", "<c-p>", "<Plug>(miniyank-cycleback)", { silent = true })
-- end

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
  pulse = pulse,
  indentwise = indentwise,
  targets = targets,
  gitsigns = gitsigns,
  submode = submode,
  packer = packer,
  textobjchainmember = textobjchainmember,
  vindent = vindent,
  cybu = cybu
  -- pounce = pounce,
  -- miniyank = miniyank,
  -- sideways = sideways,
  -- camelCaseMotion = camelCaseMotion,
}
