require("autocmd").core()
require("options").core()
require("mappings").core()

return require("packer").startup({
  function(use)
    use("lewis6991/impatient.nvim")
    use({
      "wbthomason/packer.nvim",
      config = function()
        require("autocmd").packer()
        require("mappings").packer()
      end,
    })
    use("nvim-lua/plenary.nvim")
    use("kyazdani42/nvim-web-devicons")
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
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use({ "williamboman/mason-lspconfig.nvim",
      config = require("config.lsp")()
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
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
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
    use("skywind3000/asyncrun.vim")
    use({
      "woosaaahh/sj.nvim",
      config = function()
        require("setup").sj()
        require("mappings").sj()
      end,
    })
    -- use({
    --   "ggandor/leap.nvim",
    --   config = function()
    --     require("setup").leap()
    --     require("mappings").leap()
    --   end
    -- })
    use({
      "numToStr/Comment.nvim",
      config = function()
        require("setup").comment()
      end,
    })
    use("tommcdo/vim-exchange")
    use({
      "smjonas/inc-rename.nvim",
      config = function()
        require("inc_rename").setup()
      end,
    })
    use("p00f/nvim-ts-rainbow")
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
    use("rktjmp/lush.nvim")
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
    -- use({
    --   "jonatan-branting/nvim-better-n",
    --   config = function()
    --     require("setup").bettern()
    --     require("mappings").bettern()
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
    use("nvim-treesitter/playground")
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
    use({
      "machakann/vim-highlightedyank",
      config = function()
        require("setup").highlightedyank()
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
    use({
      "chaoren/vim-wordmotion",
      config = function()
        require("setup").wordmotion()
      end,
    })
    -- use("Julian/vim-textobj-variable-segment")
    use({
      "kana/vim-textobj-user",
      -- config = function()
      -- require("options").textobjuser()
      -- end,
    })
    use({
      "kylechui/nvim-surround",
      config = function()
        require("nvim-surround").setup({})
      end
    })
    use({
      "/home/charles/Documents/dev/plugins/booster.nvim",
      -- "Runeword/booster.nvim",
      -- config = require("booster").setup(),
    })
    use("ryvnf/readline.vim")
    use("tpope/vim-abolish")
    -- use("/home/charles/Documents/dev/plugins/blaster")
    -- use("m-demare/hlargs.nvim")
    -- use({
    --   "jinh0/eyeliner.nvim",
    --   config = function()
    --     require("autocmd").eyeliner()
    --   end,
    -- })
  end,
  config = {
    display = {
      open_fn = function()
        return require("packer.util").float({
          border = "",
          width = 999,
          height = 999,
        })
      end,
    },
    -- lewis6991/impatient.nvim
    -- compile_path = fn.stdpath("config") .. "/lua/packer_compiled.lua",
    -- profile = {
    -- 	enable = true,
    -- },
  },
})

-- use({
--   "sbdchd/neoformat",
--   config = function()
--     require("options").neoformat()
--     require("autocmd").neoformat()
--   end,
-- })
-- use("tpope/vim-repeat")
-- use("tpope/vim-commentary")
-- use("JoosepAlviste/nvim-ts-context-commentstring")
-- use("kana/vim-textobj-user")
-- use("PeterRincker/vim-argumentative")
-- use({
-- 	"inside/vim-search-pulse",
-- 	config = function()
-- 		require("setup").pulse()
-- 		require("mappings").pulse()
-- 	end,
-- use({
-- 	"nvim-telescope/telescope.nvim",
-- 	-- config = require("config.telescope").setup(),
-- })
-- use("bfredl/nvim-incnormal")
-------------------- AndrewRadev/sideways.vim
-- api.nvim_set_keymap("n", "<s-h>", ":SidewaysLeft<cr>", opts)
-- api.nvim_set_keymap("n", "<s-l>", ":SidewaysRight<cr>", opts)
