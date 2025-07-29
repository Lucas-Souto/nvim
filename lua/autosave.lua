local saveMarks = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' }
local home = '/home/souto' 

vim.api.nvim_create_autocmd('BufLeave',
{
	callback = function()
		local buf = string.gsub(vim.api.nvim_buf_get_name(0), home, '~')
		local buf_id = vim.api.nvim_win_get_buf(0) 
		local cursor_pos = vim.api.nvim_win_get_cursor(0)

		for i = 1, #saveMarks do
			local file = vim.api.nvim_get_mark(saveMarks[i], {})

			if file[1] ~= 0 and file[2] ~= 0 and file[4] == buf then
				vim.api.nvim_buf_set_mark(file[3], saveMarks[i], cursor_pos[1], cursor_pos[2], {})
			end
		end
	end
})
