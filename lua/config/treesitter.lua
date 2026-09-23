vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"svelte",
		"javascript",
		"typescript",
		"html",
		"css",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
