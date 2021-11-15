local function setup()
	-------------------- neovim/nvim-lspconfig
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local function on_attach(client, buffer)
		require("mappings").lspconfig(buffer)

		vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			virtual_text = {
				source = "always",
				prefix = "",
			},
			-- 	update_in_insert = true,
		})

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local border = {
			{ "┌", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "┐", "FloatBorder" },
			{ "│", "FloatBorder" },
			{ "┘", "FloatBorder" },
			{ "─", "FloatBorder" },
			{ "└", "FloatBorder" },
			{ "│", "FloatBorder" },
		}

		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end
	end

	local function on_attach_eslint(client, buffer)
		client.resolved_capabilities.document_formatting = true
		on_attach(client, buffer)
	end

	local function on_attach_tsserver(client, buffer)
		client.resolved_capabilities.document_formatting = false
		on_attach(client, buffer)
	end

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

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(require("coq").lsp_ensure_capabilities(opts))
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
	vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.lsp.diagnostic.show_position_diagnostics({focusable=false})]])
end

return { setup = setup }
