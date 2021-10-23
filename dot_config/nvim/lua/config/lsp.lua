-------------------- neovim/nvim-lspconfig
local function setup()
	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local function on_attach(client, bufnr)
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end

		local opts = { noremap = true, silent = true }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<leader>r", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<leader>wd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
		buf_set_keymap("n", "<C-up>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("n", "<C-down>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		-- buf_set_keymap("n", "<s-k>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		-- buf_set_keymap("n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		-- buf_set_keymap("n", "<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		-- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
	end

	-------------------- williamboman/nvim-lsp-installer
	require("nvim-lsp-installer").on_server_ready(function(server)
		local opts = {
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 0,
			},
		}

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		if server.name == "eslint" then
			opts.on_attach = function(client, bufnr)
				-- neovim's LSP client does not currently support dynamic capabilities registration, so we need to set
				-- the resolved capabilities of the eslint server ourselves!
				client.resolved_capabilities.document_formatting = true
				on_attach(client, bufnr)
			end
			opts.settings = {
				format = { enable = true }, -- this will enable formatting
			}
		end

		-- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
		server:setup(opts)
		vim.cmd([[ do User LspAttachBuffers ]])
	end)
end

return { setup = setup }
