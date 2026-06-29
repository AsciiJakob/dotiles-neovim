local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.lsp.config("pyright", {
	capabilities = capabilities,
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
			},
		},
	},
})

vim.lsp.config("clangd", {
	cmd = { "clangd", "--header-insertion=never" },
	--filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda', 'proto' },
	capabilities = capabilities,
})

--  This function gets run when an LSP attaches to a particular buffer.
--  That is to say, every time a new file is opened that is associated with an lsp.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<space>rr", vim.lsp.buf.rename, opts)
		vim.keymap.set("", "<leader>fm", function() -- not just in normal mode so we can also visual mode format things
			require("conform").format({ async = true, lsp_fallback = true })
		end, { desc = "Format buffer" })
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.diagnostic.open_float()
		end, opts)
	end,
})

