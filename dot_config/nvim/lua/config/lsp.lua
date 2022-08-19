local cmd = vim.cmd
local lsp = vim.lsp
local fn = vim.fn
local diagnostic = vim.diagnostic

-------------------- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization

return function()
  diagnostic.config({
    virtual_text = {
      prefix = "",
      spacing = 2,
    },
    signs = false,
    float = {
      header = "",
      prefix = "",
      format = function(diagnostic)
        return string.format(
          " %s %s\n%s",
          diagnostic.source,
          diagnostic.user_data.lsp.code,
          diagnostic.message
        )
      end,
    },
  })

  -------------------- neovim/nvim-lspconfig
  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local function on_attach(client, buffer)
    require("mappings").lspconfig(buffer)
  end

  local function on_attach_eslint(client, buffer)
    client.server_capabilities.documentFormattingProvider = true
    on_attach(client, buffer)
  end

  local function on_attach_tsserver(client, buffer)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, buffer)
  end

  -- local function on_attach_volar(client, buffer)
  --   client.server_capabilities.documentFormattingProvider = false
  --   on_attach(client, buffer)
  -- end

  local function on_attach_sumneko_lua(client, buffer)
    client.server_capabilities.documentFormattingProvider = true
    on_attach(client, buffer)
  end


-------------------- williamboman/mason.nvim
     require("mason").setup()

-------------------- williamboman/mason-lspconfig.nvim
     local lspconfig = require("mason-lspconfig")

     lspconfig.tsserver.setup {
       on_attach = on_attach_tsserver
       settings = { format = { enable = false } }
     }
     lspconfig.eslint.setup {
       on_attach = on_attach_eslint
       settings = { format = { enable = true } }
     }
     lspconfig.sumneko_lua.setup {
       on_attach = on_attach_sumneko_lua
       settings = { format = { enable = true } }
     }
     lspconfig.yamlls.setup {
       on_attach = on_attach_sumneko_lua
       settings = { format = { enable = true } }
     }
  end

  -- require("nvim-lsp-installer").on_server_ready(function(server)
    -- local opts = {}
    -- opts.on_attach = on_attach
    -- opts.flags = { debounce_text_changes = 0 }
    --
    -- -- (optional) Customize the options passed to the server
    -- -- if server.name == "tsserver" then
    -- --     opts.root_dir = function() ... end
    -- -- end
    --
    -- if server.name == "eslint" then
    --   opts.on_attach = on_attach_eslint
    --   opts.settings = { format = { enable = true } }
    -- end
    --
    -- if server.name == "tsserver" then
    --   opts.on_attach = on_attach_tsserver
    --   opts.settings = { format = { enable = false } }
    -- end
    --
    -- if server.name == "volar" then
    --   opts.on_attach = on_attach_volar
    --   opts.settings = { format = { enable = false } }
    --   opts.init_options = {
    --     documentFeatures = {
    --       documentColor = false,
    --       documentFormatting = {
    --         defaultPrintWidth = 100
    --       },
    --       documentSymbol = true,
    --       foldingRange = true,
    --       linkedEditingRange = true,
    --       selectionRange = true
    --     },
    --     languageFeatures = {
    --       callHierarchy = true,
    --       codeAction = false,
    --       codeLens = true,
    --       completion = {
    --         defaultAttrNameCase = "kebabCase",
    --         defaultTagNameCase = "both"
    --       },
    --       definition = true,
    --       diagnostics = true,
    --       documentHighlight = true,
    --       documentLink = true,
    --       hover = true,
    --       implementation = true,
    --       references = true,
    --       rename = true,
    --       renameFileRefactoring = true,
    --       schemaRequestService = true,
    --       semanticTokens = false,
    --       signatureHelp = true,
    --       typeDefinition = true
    --     },
    --     typescript = {
    --       serverPath = ""
    --     }
    --   }
    -- end

    -- if server.name == "sumneko_lua" then
    --   opts.on_attach = on_attach_sumneko_lua
    --   opts.settings = { format = { enable = true } }
    -- end
    --
    -- if server.name == "yamlls" then
    --   opts.on_attach = on_attach_sumneko_lua
    --   opts.settings = { format = { enable = true } }
    -- end
    --
    -- -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    -- server:setup(require("coq").lsp_ensure_capabilities(opts))
    -- cmd([[ do User LspAttachBuffers ]])
  -- end)
