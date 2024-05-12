vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.completeopt:remove("preview")

require('keymap')
require('plugins')
