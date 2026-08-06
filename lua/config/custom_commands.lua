local function insert_header()
	vim.ui.input({ prompt = "Header: " }, function(title)
		if not title or title == "" then
			return
		end

		local comment = vim.bo.commentstring
		if comment == "" then
			comment = "// %s"
		end

		local prefix = comment:gsub("%%s", ""):gsub("%s+$", "")

		local width = 50
		local text = " " .. title .. " "
		local fill = "─"

		local remaining = math.max(2, width - #text)
		local left = math.floor(remaining / 2)
		local right = remaining - left

		local row = vim.api.nvim_win_get_cursor(0)[1]
		local line = vim.api.nvim_get_current_line()
		local indent = line:match("^%s*") or ""

		local header = indent .. prefix .. string.rep(fill, left) .. text .. string.rep(fill, right)

		local buf = vim.api.nvim_get_current_buf()

		vim.api.nvim_buf_set_lines(
			buf,
			row - 1, -- insert ABOVE current line
			row - 1,
			false,
			{ header, "" }
		)
	end)
end

vim.keymap.set("n", "<leader>hh", insert_header, {
	desc = "Insert section header above line",
})
