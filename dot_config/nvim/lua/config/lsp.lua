local cmd = vim.cmd
local lsp = vim.lsp
local fn = vim.fn
local diagnostic = vim.diagnostic

return function()
  -------------------- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization
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

  -------------------- williamboman/mason.nvim
  require("mason").setup()

  -------------------- williamboman/mason-lspconfig.nvim
  require("mason-lspconfig").setup({
    ensure_installed = {
      'tsserver',
      'eslint',
      'sumneko_lua',
      'yamlls',
      -- 'volar',
      'vuels',
    },
    automatic_installation = true,
  })

  -------------------- neovim/nvim-lspconfig
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

  local function on_attach_sumneko_lua(client, buffer)
    client.server_capabilities.documentFormattingProvider = true
    on_attach(client, buffer)
  end

  local function on_attach_volar(client, buffer)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, buffer)
  end

  local function on_attach_vuels(client, buffer)
    client.server_capabilities.documentFormattingProvider = false
    on_attach(client, buffer)
  end

  -- local function on_attach_cssls(client, buffer)
  --   client.server_capabilities.documentFormattingProvider = true
  --   on_attach(client, buffer)
  -- end
  --
  -- local function on_attach_html(client, buffer)
  --   client.server_capabilities.documentFormattingProvider = true
  --   on_attach(client, buffer)
  -- end

  local lspconfig = require("lspconfig")
  local lsp_flags = { debounce_text_changes = 0 }

  lspconfig['tsserver'].setup({
    on_attach = on_attach_tsserver,
    settings = { format = { enable = false } },
    flags = lsp_flags,
  })
  lspconfig['eslint'].setup({
    on_attach = on_attach_eslint,
    settings = { format = { enable = true } },
    flags = lsp_flags,
  })
  lspconfig['sumneko_lua'].setup({
    on_attach = on_attach_sumneko_lua,
    settings = { format = { enable = true } },
    flags = lsp_flags,
  })
  lspconfig['yamlls'].setup({
    on_attach = on_attach_sumneko_lua,
    settings = { format = { enable = true } },
    flags = lsp_flags,
  })
  -- lspconfig['volar'].setup({
  --   on_attach = on_attach_volar,
  --   settings = { format = { enable = false } },
  --   flags = lsp_flags,
  -- })
  lspconfig['vuels'].setup({
    on_attach = on_attach_vuels,
    settings = { format = { enable = false } },
    flags = lsp_flags,
  })
  -- lspconfig['cssls'].setup {
  --   on_attach = on_attach_cssls,
  --   settings = { format = { enable = true } },
  --   flags = lsp_flags,
  -- }
  -- lspconfig['html'].setup {
  --   on_attach = on_attach_html,
  --   settings = { format = { enable = true } },
  --   flags = lsp_flags,
  -- }
end

-- require("nvim-lsp-installer").on_server_ready(function(server)
-- local opts = {}
-- opts.on_attach = on_attach
-- opts.flags = { debounce_text_changes = 0 }
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
