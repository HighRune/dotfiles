require("autocmd").core()
require("options").core()
require("mappings").core()

return require("packer").startup({
  function(use)
    use({
      'https://gitlab.com/madyanov/svart.nvim',
      config = function()
        -- require('autocmd').svart()
        -- require('setup').svart()
        require('mappings').svart()
        local svart = require("svart")

        svart.configure({
          key_cancel = "<Esc>", -- cancel search
          key_delete_char = "", -- delete query char
          key_delete_word = "<C-W>", -- delete query word
          key_delete_query = "<C-U>", -- delete whole query
          key_best_match = "<BS>", -- jump to the best match
          key_next_match = "<Tab>", -- select next match
          key_prev_match = "<C-P>", -- select prev match

          label_atoms = "jfkdlsahgnuvrbytmiceoxwpqz", -- allowed label chars
          label_location = -1, -- label location relative to the match
          -- positive: relative to the start of the match
          -- 0 or negative: relative to the end of the match
          label_max_len = 2, -- max label length
          label_min_query_len = 1, -- min query length required to show labels
          label_hide_irrelevant = true, -- hide irrelevant labels after start typing label to go to
          label_conflict_foresight = 2, -- number of chars from the start of the match to discard from labels pool

          search_update_register = true, -- update search (/) register with last used query after accepting match
          search_wrap_around = true, -- wrap around when navigating to next/prev match
          search_multi_window = true, -- search in multiple windows

          ui_dim_content = true, -- dim buffer content during search
        })
      end,
    })
    -- use("lewis6991/impatient.nvim")
    use({
      "wbthomason/packer.nvim",
      config = function()
        require("autocmd").packer()
        require("mappings").packer()
      end,
    })
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
    use("kana/vim-arpeggio")
    use({
      'gelguy/wilder.nvim',
      requires = { "romgrk/fzy-lua-native", opt = true },
      rocks = 'pcre2',
      config = function()
        require("setup").wilder()
      end,
    })
    use({
      'michaelb/sniprun',
      run = 'bash ./install.sh',
      config = function()
        require("setup").sniprun()
        require("mappings").sniprun()
      end
    })
    use({
      "mfussenegger/nvim-dap",
      config = function()
        require('mappings').dap()
        require('config.dap')
      end
    })
    use({
      'akinsho/bufferline.nvim',
      config = function()
        require('mappings').bufferline()
        require('setup').bufferline()
      end
    })
    use({
      "inside/vim-search-pulse",
      config = function()
        require("mappings").pulse()
      end,
    })
    use({
      "folke/tokyonight.nvim",
      setup = function()
        -- autocommand will have no effect on previously sourced colorschemes so it must be added before any colorscheme is sourced
        require('autocmd').bufferline()
        -- require('autocmd').sj()
        -- require('autocmd').leap()
      end,
      config = function()
        require('setup').tokyonight()
      end,
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("setup").treesitter()
      end,
      run = ":TSUpdate",
    })
    use({
      "neovim/nvim-lspconfig",
      config = require("config.lsp")()
    })
    use({
      "williamboman/mason.nvim",
      config = function()
        require('setup').mason()
        require('mappings').mason()
      end,
    })
    use({
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("setup").masonlspconfig()
      end
    })
    use({
      'anuvyklack/hydra.nvim',
      requires = 'anuvyklack/keymap-layer.nvim',
      config = function()
        require("mappings").hydra()
      end,
    })
    use({
      "smjonas/live-command.nvim",
      config = function()
        require("setup").livecommand()
      end,
    })
    use({
      "ms-jpq/coq_nvim",
      branch = "coq",
      config = function()
        require("autocmd").coq()
        require("setup").coq()
      end,
    })
    use({
      "is0n/fm-nvim",
      config = function()
        require("mappings").fm()
        require("setup").fm()
      end,
    })
    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("setup").gitsigns()
      end,
    })
    use({
      "gbprod/stay-in-place.nvim",
      config = function()
        require("setup").stayinplace()
      end
    })
    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("setup").colorizer()
      end,
    })
    use({
      'weilbith/nvim-code-action-menu',
      config = function()
        require("mappings").codeactionmenu()
        require("setup").codeactionmenu()
      end,
      cmd = 'CodeActionMenu',
    })
    use({
      "nacro90/numb.nvim",
      config = function()
        require("setup").numb()
      end,
    })
    use({
      "echasnovski/mini.nvim",
      config = function()
        require("autocmd").indentscope()
        require("setup").indentscope()
        require("setup").ai()
      end,
    })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("windwp/nvim-ts-autotag")
    use("itchyny/vim-cursorword")
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("setup").comment()
        require("mappings").comment()
      end,
    })
    use("tommcdo/vim-exchange")
    use({
      "smjonas/inc-rename.nvim",
      config = function()
        require("inc_rename").setup()
      end,
    })
    use({
      "AndrewRadev/splitjoin.vim",
      config = function()
        require("mappings").splitjoin()
      end,
    })
    use({
      "windwp/nvim-autopairs",
      config = function()
        require("setup").autopairs()
      end,
    })
    use({
      "ahmedkhalf/project.nvim",
      config = function()
        require("setup").project()
      end,
    })
    use({
      "kosayoda/nvim-lightbulb",
      config = function()
        require('setup').lightbulb()
        require('autocmd').lightbulb()
      end
    })
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = "require('config.lualine')()",
    })
    use({
      "ibhagwan/fzf-lua",
      config = function()
        require("mappings").fzf()
        require("setup").fzf()
      end,
    })
    use({
      "monaqa/dial.nvim",
      config = function()
        require("mappings").dial()
        require("setup").dial()
      end,
    })
    use("svban/YankAssassin.vim")
    use("glts/vim-textobj-comment")
    use({
      "D4KU/vim-textobj-chainmember",
      config = function()
        require("mappings").textobjchainmember()
      end,
    })
    use({ "AndrewRadev/sideways.vim",
      config = function()
        require("mappings").sideways()
      end,
    })
    use({
      "chaoren/vim-wordmotion",
      config = function()
        require("setup").wordmotion()
      end,
    })
    use({
      "kana/vim-textobj-user",
    })
    use({
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({})
      end
    })
    use("tpope/vim-abolish")
    use({
      "Runeword/putter.nvim",
      -- "/home/charles/Documents/dev/plugins/putter.nvim",
      -- config = require("putter").setup(),
    })
    -- use("p00f/nvim-ts-rainbow")
    -- use("rktjmp/lush.nvim")
    -- use("nvim-treesitter/playground")
    -- use("m-demare/hlargs.nvim")
    -- use("/home/charles/Documents/dev/plugins/blaster")
    -- use("ryvnf/readline.vim")
    -- use("Julian/vim-textobj-variable-segment")
    -- use("skywind3000/asyncrun.vim")
    -- use({
    --   'sindrets/diffview.nvim',
    --   requires = 'nvim-lua/plenary.nvim',
    -- })
    -- use({
    --   "jonatan-branting/nvim-better-n",
    --   config = function()
    --     require("setup").bettern()
    --     require("mappings").bettern()
    --   end
    -- })
    -- use({
    --   "woosaaahh/sj.nvim",
    --   branch = '0.6',
    --   config = function()
    -- require("setup").sj()
    -- require("mappings").sj()
    --   end,
    -- })
    -- use({
    --   "ggandor/leap.nvim",
    --   config = function()
    --     require("setup").leap()
    --     require("mappings").leap()
    --   end
    -- })
    -- use({
    --   "justinmk/vim-sneak",
    --   config = function()
    --     require("autocmd").sneak()
    --     require("options").sneak()
    --     require("mappings").sneak()
    --   end,
    -- })
    -- use({
    --   "cshuaimin/ssr.nvim",
    --   module = "ssr",
    --   config = function()
    --     require('setup').ssr()
    --     require('mappings').ssr()
    --   end
    -- })
  end,
  config = require("setup").packer()
})
