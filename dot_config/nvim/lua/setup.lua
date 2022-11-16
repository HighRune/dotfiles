local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local o = vim.o
local map = vim.keymap.set
local call = vim.call
local api = vim.api

-------------------- chaoren/vim-wordmotion
local function wordmotion()
  g.wordmotion_nomap = 1
end

-------------------- norcalli/nvim-colorizer.lua
local function colorizer()
  require("colorizer").setup()
end

-------------------- machakann/vim-highlightedyank
local function highlightedyank()
  g.highlightedyank_highlight_duration = 100
end

-------------------- ahmedkhalf/project.nvim
local function project()
  require("project_nvim").setup()
end

-------------------- nacro90/numb.nvim
local function numb()
  require("numb").setup()
end

-------------------- gbprod/stay-in-place.nvim
local function stayinplace()
  require("stay-in-place").setup()
end

-------------------- numToStr/Comment.nvim
local function comment()
  require("Comment").setup()
end

local function packer()
  return {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end,
      header_sym = ''
    }
    -- display = {
    --   open_fn = function()
    --     return require("packer.util").float({
    --       border = "",
    --       width = 999,
    --       height = 999,
    --     })
    --   end,
    -- },
    -- lewis6991/impatient.nvim
    -- compile_path = fn.stdpath("config") .. "/lua/packer_compiled.lua",
    -- profile = {
    -- 	enable = true,
    -- },
  }
end

-------------------- gelguy/wilder.nvim
local function wilder()
  local wilder = require('wilder')

  wilder.setup({
    modes = { ':' },
    -- modes = { ':', '/', '?' },
    -- next_key = '<Down>',
    -- previous_key = '<Up>',
    -- accept_key = '<Enter>',
  })

  wilder.set_option('pipeline', {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 1,
        set_pcre2_pattern = 1,
      }),
      wilder.python_search_pipeline({
        pattern = 'fuzzy',
      })
    ),
  })

  wilder.set_option('renderer', wilder.popupmenu_renderer({
    pumblend = 25,
    left = { ' ', wilder.popupmenu_devicons() },
    right = { ' ', wilder.popupmenu_scrollbar() },
    highlighter = {
      wilder.lua_pcre2_highlighter(),
      wilder.lua_fzy_highlighter(),
    },
    highlights = {
      accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#ff4d97' } }),
    },
  }))
end

-------------------- madyanov/svart.nvim
local function svart()
  require("svart").configure({
    key_cancel = "<Esc>",
    key_delete_char = "<BS>",
    key_delete_word = "<C-W>",
    key_delete_query = "<C-U>",
    key_best_match = "<CR>",
    key_next_match = "<C-n>",
    key_prev_match = "<C-p>",
    label_atoms = "aoeuhtnsqjkmwv',.pgcrlid",
    label_location = -1,
    label_max_len = 2,
    label_min_query_len = 1,
    label_hide_irrelevant = true,
    label_conflict_foresight = 3,
    search_update_register = false,
    search_wrap_around = false,
    search_multi_window = true,
    ui_dim_content = false,
  })
end

-------------------- woosaaahh/sj.nvim
-- local function sj()
--   require("sj").setup({
--     auto_jump = false,
--     forward_search = true,
--     highlights_timeout = 0,
--     max_pattern_length = 0,
--     pattern_type = "vim",
--     preserve_highlights = true,
--     prompt_prefix = "",
--     relative_labels = false,
--     search_scope = "visible_lines",
--     separator = "\r",
--     update_search_register = false,
--     use_last_pattern = false,
--     use_overlay = false,
--     wrap_jumps = o.wrapscan,
--     labels = {
--       "'", ",", ".", "p", "y", "a", "o", "e", "u", "i", "d", "h", "t",
--       "n", "s", "f", "g", "c", "r", "l", ";", "q", "j", "k", "x", "b",
--       "m", "w", "v", "z",
--     },
--     highlights = {
--       SjFocusedLabel = { bg = "#ff4d97", fg = 'black', },
--       SjLabel = { bg = '#ccff88', fg = 'black' },
--       SjMatches = { bg = '#77aaff', fg = 'black' },
--     },
--     keymaps = {
--       cancel = "<Esc>",
--       validate = "<S-Enter>",
--       prev_match = "<S-Tab>",
--       next_match = "<Tab>",
--       prev_pattern = "<C-p>",
--       next_pattern = "<C-n>",
--       delete_prev_char = "<BS>",
--       delete_prev_word = "<C-w>",
--       delete_pattern = "<C-u>",
--       restore_pattern = "<A-BS>",
--       send_to_qflist = "<A-q>",
--     },
--   })
-- end

-------------------- kosayoda/nvim-lightbulb
local function lightbulb()
  fn.sign_define('LightBulbSign', { text = "⚡" })
end

-------------------- ibhagwan/fzf-lua
local function fzf()
  local actions = require("fzf-lua.actions")

  require("fzf-lua").setup({
    winopts = {
      fullscreen = true,
      border = "none",
      preview = {
        layout = "horizontal",
        horizontal = "up:70%",
        title = false,
        delay = 0,
        scrollchars = { "▎", "" },
      },
    },
    keymap = {
      builtin = {},
      fzf = {
        -- 	-- ["tab"] = "down",
        -- 	-- ["btab"] = "up",
        ["ctrl-e"] = "preview-page-down",
        ["ctrl-u"] = "preview-page-up",
      },
    },
    actions = {
      files = {
        ["default"] = actions.file_edit,
      },
      buffers = {
        ["default"] = actions.buf_edit,
      },
    },
  })
end

-------------------- is0n/fm-nvim
local function fm()
  require("fm-nvim").setup({
    edit_cmd = "edit",
    ui = {
      default = "float",
      float = {
        border = "none",
        float_hl = "Normal",
        border_hl = "FloatBorder",
        blend = 0,
        height = 999,
        width = 999,
      },
      split = {
        direction = "topleft",
        size = 24,
      },
    },
    cmds = {
      vifm_cmd = "vifm",
    },
    mappings = {
      -- vert_split = "<C-v>",
      -- horz_split = "<C-h>",
      -- tabedit = "<C-t>",
      -- edit = "<C-e>",
      -- ESC = "<ESC>",
    },
  })
end

-------------------- lewis6991/gitsigns.nvim
local function gitsigns()
  require("gitsigns").setup({
    current_line_blame_opts = {
      delay = 0,
    },
    on_attach = require("mappings").gitsigns,
    signs = {
      add = {
        hl = "GitSignsAdd",
        text = "+",
        numhl = "GitSignsAddNr",
        linehl = "GitSignsAddLn",
      },
      change = {
        hl = "GitSignsChange",
        text = "~",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
      delete = {
        hl = "GitSignsDelete",
        text = "_",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      topdelete = {
        hl = "GitSignsDelete",
        text = "‾",
        numhl = "GitSignsDeleteNr",
        linehl = "GitSignsDeleteLn",
      },
      changedelete = {
        hl = "GitSignsChange",
        text = "~",
        numhl = "GitSignsChangeNr",
        linehl = "GitSignsChangeLn",
      },
    },
  })
end

-------------------- echasnovski/mini.nvim#miniindentscope
local function indentscope()
  local scope = require("mini.indentscope")
  scope.setup({
    draw = {
      delay = 0,
      animation = scope.gen_animation("none"),
    },
    mappings = {
      object_scope = "ii",
      object_scope_with_border = "ai",
      goto_top = "",
      goto_bottom = "",
      -- goto_top = "<S-CR>",
      -- goto_bottom = "<CR>",
    },
    options = {
      border = "both",
      indent_at_cursor = true,
      try_as_border = true,
    },
    symbol = "▏",
  })
end

-------------------- echasnovski/mini.nvim#miniai
local function ai()
  local gen_spec = require('mini.ai').gen_spec
  require('mini.ai').setup({
    custom_textobjects = {
      f = false,
      a = gen_spec.argument({ brackets = { '%b()' } }),
      o = gen_spec.argument({ brackets = { '%b{}' } }),
      e = gen_spec.argument({ brackets = { '%b[]' } }),
      A = gen_spec.pair('(', ')', { type = 'balanced' }),
      O = gen_spec.pair('{', '}', { type = 'balanced' }),
      E = gen_spec.pair('[', ']', { type = 'balanced' }),
      Q = gen_spec.pair('`', '`', { type = 'balanced' }),
    },
    mappings = {
      around = 'a',
      inside = 'i',
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',
      goto_left = '',
      goto_right = '',
    },
    n_lines = 50,
    search_method = 'cover_or_next',
    -- search_method = 'cover_or_nearest',
  })
end

-------------------- nvim-treesitter/nvim-treesitter
local function treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = { enable = true, },
    indent = { enable = true, },
    autopairs = { enable = true, }, -- windwp/nvim-autopairs
    autotag = { enable = true, }, -- windwp/nvim-ts-autotag
    -- matchup = { enable = true, }, -- andymass/vim-matchup
    -- p00f/nvim-ts-rainbow
    rainbow = {
      enable = false,
      max_file_lines = nil,
      colors = {
        "#FF0048",
        "#B800FF",
        "#FAFF00"
      },
    },

    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["aF"] = "@function.outer",
          ["iF"] = "@function.inner",
          ["af"] = "@call.outer",
          ["if"] = "@call.inner",
        },
      },
      -- move = {
      -- 	enable = true,
      -- 	set_jumps = true,
      -- 	goto_next_start = {
      -- 		["]]"] = "@function.outer",
      -- 	},
      -- 	goto_previous_start = {
      -- 		["[["] = "@function.outer",
      -- 	},
      -- },
      -- swap = {
      -- 	enable = true,
      -- 	swap_next = {
      -- 		["<c-k>"] = "@parameter.inner",
      -- 	},
      -- 	swap_previous = {
      -- 		["<c-j>"] = "@parameter.inner",
      -- 	},
      -- },
    },

    -- nvim-treesitter/playground
    -- playground = {
    -- 	enable = true,
    -- 	disable = {},
    -- 	updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    -- 	persist_queries = false, -- Whether the query persists across vim sessions
    -- 	keybindings = {
    -- 		toggle_query_editor = "o",
    -- 		toggle_hl_groups = "i",
    -- 		toggle_injected_languages = "t",
    -- 		toggle_anonymous_nodes = "a",
    -- 		toggle_language_display = "I",
    -- 		focus_language = "f",
    -- 		unfocus_language = "F",
    -- 		update = "R",
    -- 		goto_node = "<cr>",
    -- 		show_help = "?",
    -- 	},
    -- },
  })
end

-------------------- akinsho/bufferline.nvim
local function bufferline()
  require('bufferline').setup({
    options = {
      indicator = { style = 'none' },
      separator_style = { '', '' },
      tab_size = 0,
      buffer_close_icon = '',
      modified_icon = '',
      close_icon = '',
    },
  })
end

-------------------- weilbith/nvim-code-action-menu
local function codeactionmenu()
  g.code_action_menu_show_details = false
  g.code_action_menu_show_diff = true
end

-------------------- gbprod/cutlass.nvim
local function cutlass()
  require("cutlass").setup({
    cut_key = "m",
    override_del = true,
    exclude = { "ns", "nS" },
  })
end

-------------------- jonatan-branting/nvim-better-n
local function bettern()
  require("better-n").setup {
    callbacks = {},
    mappings = {
      ["F"] = { previous = "n", next = "<s-n>" },
      ["T"] = { previous = "n", next = "<s-n>" },
    }
  }
end

-------------------- folke/tokyonight.nvim
local function tokyonight()
  require("tokyonight").setup({
    style = "night",
    transparent = true,
    terminal_colors = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
    on_colors = function(colors)
      colors.green = "#FF9EFF"
    end
  })
  cmd("colorscheme tokyonight")
end

-------------------- windwp/nvim-autopairs
local function autopairs()
  local remap = vim.api.nvim_set_keymap
  local npairs = require("nvim-autopairs")

  npairs.setup({
    map_bs = true,
    map_cr = false,
    check_ts = true,
    ignored_next_char = "[%w%.]",
    -- fast_wrap = {
    --   map = "<C-h>",
    --   chars = { "{", "[", "(", '"', "'" },
    --   pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    --   offset = 0,
    --   end_key = "s",
    --   keys = "aoeuhtns",
    --   check_comma = true,
    --   highlight = "Search",
    --   highlight_grey = "Comment",
    -- },
  })

  -- skip it, if you use another global object
  _G.MUtils = {}

  MUtils.CR = function()
    if fn.pumvisible() ~= 0 then
      if fn.complete_info({ "selected" }).selected ~= -1 then
        return npairs.esc("<c-y>")
      else
        return npairs.esc("<c-e>") .. npairs.autopairs_cr()
      end
    else
      return npairs.autopairs_cr()
    end
  end
  remap("i", "<cr>", "v:lua.MUtils.CR()", { expr = true, noremap = true })

  MUtils.BS = function()
    if fn.pumvisible() ~= 0 and fn.complete_info({ "mode" }).mode == "eval" then
      return npairs.esc("<c-e>") .. npairs.autopairs_bs()
    else
      return npairs.autopairs_bs()
    end
  end
  remap("i", "<bs>", "v:lua.MUtils.BS()", { expr = true, noremap = true })
end

-------------------- monaqa/dial.nvim
local function dial()
  local augend = require("dial.augend")
  require("dial.config").augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.decimal_int,
      augend.date.alias["%Y/%m/%d"],
      augend.semver.alias.semver,
      augend.constant.alias.bool,
      augend.constant.new({
        elements = { "let", "const" },
      }),
      augend.constant.new({
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
      }),
    },
  })
end

-------------------- williamboman/mason.nvim
local function mason()
  require("mason").setup({ ui = { border = 'single' } })
end

-------------------- williamboman/mason-lspconfig.nvim
local function masonlspconfig()
  require("mason-lspconfig").setup({
    ensure_installed = {
      'tsserver',
      'eslint',
      'sumneko_lua',
      'yamlls',
      -- 'volar',
      'vuels',
      'bashls',
    },
    automatic_installation = true,
  })
end

-------------------- ggandor/leap.nvim
-- local function leap()
--   require('leap').setup {
--     highlight_unlabeled = false,
--     safe_labels = {},
--     case_sensitive = false,
--     labels = { 'a', 'o', 'e', 'u', 'h', 't', 's', "'", ',', '.', 'p', 'g', 'g', 'c', 'r', 'l', ';', 'q', 'j', 'k', 'm',
--       'w', 'v', 'z' },
--   }
-- end

-------------------- ms-jpq/coq_nvim
local function coq()
  require('mappings').coq()

  g.coq_settings = {
    auto_start = 'shut-up',
    weights = {
      prefix_matches = 3,
      proximity = 0,
      recency = 0,
    },
    match = {
      fuzzy_cutoff = 0.8,
      exact_matches = 2,
    },
    display = {
      preview = {
        positions = { east = 1, north = 2, south = 3, west = 4, },
        x_max_len = 100,
        border = 'single'
      },
      icons = { mode = 'none' },
      pum = {
        kind_context = { '   ', '' },
        source_context = { '', '' },
        fast_close = true,
      },
      ghost_text = { enabled = false, },
    },
    keymap = {
      recommended = false,
      pre_select = true,
      jump_to_mark = '<c-Enter>',
      -- jump_to_mark = '<Tab>',
      ['repeat'] = '',
      manual_complete = '',
      bigger_preview = '',
      eval_snips = '',
    },
    clients = {
      snippets = {
        weight_adjust = 2,
        short_name = '⚡',
      },
      tree_sitter = {
        short_name = '侮',
      },
      lsp = {
        short_name = '',
      },
      paths = {
        short_name = '',
      },
      tmux = {
        short_name = '里',
      },
      buffers = {
        short_name = 'זּ',
      },
    },
  }
end

-------------------- smjonas/live-command.nvim
local function livecommand()
  require("live-command").setup {
    commands = {
      Norm = { cmd = "norm" },
    },
  }
end

return {
  packer = packer,
  colorizer = colorizer,
  project = project,
  numb = numb,
  fm = fm,
  fzf = fzf,
  gitsigns = gitsigns,
  indentscope = indentscope,
  bufferline = bufferline,
  cutlass = cutlass,
  comment = comment,
  treesitter = treesitter,
  ai = ai,
  bettern = bettern,
  autopairs = autopairs,
  coq = coq,
  tokyonight = tokyonight,
  dial = dial,
  highlightedyank = highlightedyank,
  wordmotion = wordmotion,
  livecommand = livecommand,
  stayinplace = stayinplace,
  lightbulb = lightbulb,
  codeactionmenu = codeactionmenu,
  mason = mason,
  masonlspconfig = masonlspconfig,
  svart = svart,
  wilder = wilder,
}
