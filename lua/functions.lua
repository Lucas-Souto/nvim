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

M.build_cmd = function()
	vim.cmd('exe ":normal \\<C-w>s\\<CR>:terminal dotnet build ..\\<CR>"');
end

M.run_cmd = function()
	vim.cmd('exe ":normal \\<C-w>s\\<CR>:terminal dotnet run --project ..\\<CR>"');
end
return M
