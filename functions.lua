local M = {}

M.embrace_selection = function(startChar, endChar)
	if vim.fn.visualmode() == 'v' then
		local s_start = vim.fn.getpos("'<")
		local s_end = vim.fn.getpos("'>")

		vim.fn.setpos('.', s_end)
		vim.api.nvim_put({ endChar }, 'c', true, true)

		vim.fn.setpos('.', s_start)
		vim.api.nvim_put({ startChar }, 'c', false, true)

		vim.fn.setpos('.', s_end)
	end
end

return M
