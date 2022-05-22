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
  -- local actions = require("fzf-lua.actions")
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
    -- quickfix = {
    -- 	file_icons = true,
    -- 	git_icons = true,
    -- },
    keymap = {
      builtin = {},
      fzf = {
        -- 	-- ["tab"] = "down",
        -- 	-- ["btab"] = "up",
        ["ctrl-e"] = "preview-page-down",
        ["ctrl-u"] = "preview-page-up",
      },
      -- },
      -- actions = {
      -- 	files = {
      -- 		-- ["default"] = actions.file_edit,
      -- 		-- ["alt-q"] = actions.file_sel_to_qf,
      -- 	},
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
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    -- andymass/vim-matchup
    -- matchup = {
    -- 	enable = true,
    -- },
    -- nvim-treesitter/nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["aF"] = "@call.outer",
          ["iF"] = "@call.inner",
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
  require("bufferline").setup({
    options = {
      indicator_icon = " ",
      separator_style = { "", "" },
      tab_size = 0,
      close_icon = "",
    },
    highlights = {
      buffer_selected = {
        gui = "bold",
      },
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

-------------------- ghillb/cybu.nvim
local function cybu()
  require("cybu").setup({
    position = {
      relative_to = "win",
      anchor = "centerleft",
      horizontal_offset = 12,
      max_win_height = 20,
      max_win_width = 0.5,
    },
    style = {
      path = "relative",
      border = "rounded",
      separator = " ",
      prefix = "…",
      padding = 1,
      devicons = {
        enabled = true,
        colored = true,
      },
      highlights = {
        current_buffer = "Normal",
        adjacent_buffers = "Comment",
        background = "Normal",
      },
    },
    display_time = 1000,
    exclude = { "qf" },
    fallback = function() end,
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
  cybu = cybu
}
