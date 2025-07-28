-- Marks com números são salvas automaticamente ao sair do buffer
local saveMarks = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' }
local home = '/home/souto' 

vim.api.nvim_create_autocmd('BufLeave',
{
	callback = function()
		local buf = string.gsub(vim.api.nvim_buf_get_name(0), home, '~')
		local buf_id = vim.api.nvim_win_get_buf(0) 
		local cursor_pos = vim.api.nvim_win_get_cursor(0)

		for i = 1, #saveMarks do
			local file = vim.api.nvim_get_mark(saveMarks[i], {})[4]

			if file == buf then
				vim.api.nvim_buf_set_mark(buf_id, saveMarks[i], cursor_pos[1], cursor_pos[2], {})

				break
			end
		end
	end
})
