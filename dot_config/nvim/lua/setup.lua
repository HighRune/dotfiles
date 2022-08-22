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

-------------------- ggandor/leap.nvim
local function leap()
  require('leap').setup {
    special_keys = {
      repeat_search = '<enter>',
      next_match    = '<enter>',
      prev_match    = '<s-cr>',
    },
  }
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

-------------------- echasnovski/mini.nvim
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

local function ai()
  local gen_spec = require('mini.ai').gen_spec
  require('mini.ai').setup({
    custom_textobjects = {
      b = gen_spec.argument({ brackets = { '%b()' } }),
      a = gen_spec.argument({ brackets = { '%b[]' } }),
      o = gen_spec.argument({ brackets = { '%b{}' } }),
      B = gen_spec.pair('(', ')', { type = 'balanced' }),
      A = gen_spec.pair('[', ']', { type = 'balanced' }),
      O = gen_spec.pair('{', '}', { type = 'balanced' }),
      Q = gen_spec.pair('`', '`', { type = 'balanced' }),
    },
    mappings = {
      around = 'a',
      inside = 'i',
      around_next = 'an',
      inside_next = 'in',
      around_last = 'al',
      inside_last = 'il',
      goto_left = 'g[',
      goto_right = 'g]',
    },
    n_lines = 50,
    search_method = 'cover_or_nearest',
  })
end

local function treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all",
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
    -- windwp/nvim-autopairs
    autopairs = {
      enable = true,
    },
    -- JoosepAlviste/nvim-ts-context-commentstring
    -- context_commentstring = {
    -- 	enable = true,
    -- },
    -- windwp/nvim-ts-autotag
    autotag = {
      enable = true,
    },
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
    -- andymass/vim-matchup
    -- matchup = {
    -- 	enable = true,
    -- },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
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

local function installer()
  require("nvim-lsp-installer").setup({
    ui = {
      keymaps = {
        toggle_server_expand = "<TAB>",
        install_server = "gi",
        update_server = "gu",
        check_server_version = "gv",
        update_all_servers = "gU",
        check_outdated_servers = "gO",
        uninstall_server = "gd",
      },
    }
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

-------------------- ghillb/cybu.nvim
local function cybu()
  cmd([[
    highlight currentBuffer guifg=white guibg=#1e2633
    highlight adjacentBuffers guifg=#7a7c9e
    highlight buffersWindow guibg=#0a172e
    ]])
  require("cybu").setup({
    position = {
      relative_to = "win",
      anchor = "bottomleft",
      horizontal_offset = 7,
      vertical_offset = -2,
      max_win_height = 20,
      max_win_width = 0.5,
    },
    style = {
      hide_buffer_id = true,
      -- path = "tail",
      border = "none",
      separator = " ",
      prefix = "…",
      padding = 1,
      devicons = {
        enabled = true,
        colored = true,
      },
      highlights = {
        current_buffer = "currentBuffer",
        adjacent_buffers = "adjacentBuffers",
        background = "buffersWindow",
      },
    },
    display_time = 1200,
    exclude = { "qf" },
    fallback = function() end,
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

-------------------- RRethy/nvim-base16
local function base16()
  require('base16-colorscheme').setup({
    base00 = "none",
    base01 = "#262626",
    base02 = "#353340",
    base03 = "#4B4761",
    base04 = "#6F6F6F",
    base05 = "#FAFAFA",
    base06 = "#FAFAFA",
    base07 = "#FAFAFA",
    -- base08 = "#DD25FF",
    -- base08 = "#00FFC8",
    -- base08 = "#86FFE5",
    -- base08 = "#00FFC8",
    base08 = "#BAB8FF",
    base09 = "#72FF00",
    -- base0A = "#9FC8FF",
    base0A = "#B2FFFC",
    -- base0A = "#FF0048",
    -- base0A = "#B800FF",
    -- base0A = "#FF0053",
    -- base0A = "#73FAFF",
    -- base0B = "#FF0053",
    base0B = "#BDFFBC",
    base0C = "#FF4100",
    -- base0C = "#FF2D4D",
    -- base0C = "#00FF92",
    base0D = "#9700FF",
    -- base0E = "#55FFE3",
    base0E = "#00FF92",
    base0F = "#FAFAFA",
  })
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
  cybu = cybu,
  base16 = base16,
  installer = installer,
  ai = ai,
  bettern = bettern
}
