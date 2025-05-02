vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.completeopt:remove('preview')
vim.opt.foldmethod = 'indent'
vim.opt.winborder = 'rounded'

package.path = package.path .. '~/.config/nvim/lua/'-- Usar caminho absoluto 

require('keymap')
require('plugins')
require('lsp')

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType",
{
	callback = function()
		vim.schedule(function()
			vim.opt.indentexpr = "nil"
		end)
	end
})
