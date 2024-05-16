vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.completeopt:remove('preview')

package.path = package.path .. '~/.config/nvim/lua/'-- Usar caminho absoluto 

require('keymap')
require('plugins')
