local cmd = vim.cmd
local lsp = vim.lsp
local fn = vim.fn
local diagnostic = vim.diagnostic

-------------------- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization

return function()
	diagnostic.config({
		-- virtual_text = false,
		-- virtual_lines = { prefix = "" },
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
				-- return dump(diagnostic)
			end,
		},
	})

	-- function dump(o)
	-- 	if type(o) == "table" then
	-- 		local s = "{ "
	-- 		for k, v in pairs(o) do
	-- 			if type(k) ~= "number" then
	-- 				k = '"' .. k .. '"'
	-- 			end
	-- 			s = s .. "[" .. k .. "] = " .. dump(v) .. ","
	-- 		end
	-- 		return s .. "} "
	-- 	else
	-- 		return tostring(o)
	-- 	end
	-- end

	-- local signs = { Error = "e", Warn = "w", Hint = "h", Info = "i" }
	-- for type, sign in pairs(signs) do
	-- 	local hl = "DiagnosticSign" .. type
	-- 	fn.sign_define(hl, { text = sign, texthl = hl })
	-- end

	-------------------- neovim/nvim-lspconfig
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local function on_attach(client, buffer)
		require("mappings").lspconfig(buffer)
	end

	local function on_attach_eslint(client, buffer)
		client.resolved_capabilities.document_formatting = true
		on_attach(client, buffer)
	end

	local function on_attach_tsserver(client, buffer)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, buffer)
	end

	local function on_attach_volar(client, buffer)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, buffer)
	end

	-- local function on_attach_sumneko_lua(client, buffer)
	-- 	client.resolved_capabilities.document_formatting = true
	-- 	on_attach(client, buffer)
	-- end
	-------------------- williamboman/nvim-lsp-installer
	require("nvim-lsp-installer").on_server_ready(function(server)
		local opts = {}
		opts.on_attach = on_attach
		opts.flags = { debounce_text_changes = 0 }

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		if server.name == "eslint" then
			opts.on_attach = on_attach_eslint
			opts.settings = { format = { enable = true } }
		end

		if server.name == "tsserver" then
			opts.on_attach = on_attach_tsserver
			opts.settings = { format = { enable = false } }
		end

		if server.name == "volar" then
			opts.on_attach = on_attach_volar
			opts.settings = { format = { enable = false } }
		end

		-- if server.name == "sumneko_lua" then
		-- 	opts.on_attach = on_attach_sumneko_lua
		-- 	opts.settings = { format = { enable = true } }
		-- end

		if server.name == "sumneko_lua" then
	 	  local sumneko_opts = require("lsp.settings.sumneko_lua")
	 	  opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    end

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(require("coq").lsp_ensure_capabilities(opts))
		cmd([[ do User LspAttachBuffers ]])
	end)
end
