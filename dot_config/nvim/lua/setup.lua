local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set
local call = vim.call
local api = vim.api

-------------------- norcalli/nvim-colorizer.lua
local function colorizer()
  require("colorizer").setup()
end

-------------------- ahmedkhalf/project.nvim
local function project()
  require("project_nvim").setup()
end

-------------------- nacro90/numb.nvim
local function numb()
  require("numb").setup()
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
      around_last = 'ab',
      inside_last = 'ib',
      goto_left = 'g[',
      goto_right = 'g]',
    },
    n_lines = 50,
    search_method = 'cover_or_nearest',
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
    -- textobjects = {
    -- select = {
    --   enable = true,
    --   lookahead = true,
    --   keymaps = {
    --     ["af"] = "@function.outer",
    --     ["if"] = "@function.inner",
    --     ["aF"] = "@call.outer",
    --     ["iF"] = "@call.inner",
    --   },
    -- },
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
    -- },

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

-------------------- gbprod/cutlass.nvim
local function cutlass()
  require("cutlass").setup({
    cut_key = "m",
    override_del = true,
    exclude = { "ns", "nS" },
  })
end

-------------------- numToStr/Comment.nvim
local function comment()
  require("Comment").setup()
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

-------------------- ggandor/leap.nvim
local function leap()
  require('leap').opts.safe_labels = nil
  require('leap').opts.labels = { 'u', 'h', 'e', 't', 'o', 'a', 'k', 'm', 'j', 'w', 'q', 'v', '.', 'c', 'r', 'p', 'g' }
  require('leap').opts.highlight_unlabeled = true
  require('leap').opts.special_keys = {
    repeat_search = 'n',
    next_match    = 'n',
    prev_match    = 'N',
  }
end

return {
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
  leap = leap,
  dial = dial,
}
