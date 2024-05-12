vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.completeopt:remove("preview")

local keymap = vim.api.nvim_set_keymap
local i_opt = { noremap = true }
local ie_opt = { expr = true, noremap = true }
local n_opt = { silent = true, noremap = true }

-- Fecha automaticamente {, (, [, ", e '
keymap('i', '{', '{}<Left>', i_opt)
keymap('i', '(', '()<Left>', i_opt)
keymap('i', '[', '[]<Left>', i_opt)
keymap('i', '"', '""<Left>', i_opt)
keymap('i', "'", "''<Left>", i_opt)

-- Evita escrever ) e ] se já houver um do lado
keymap('i', ')', 'getline(".")[col(".") - 1] == ")" ? "<Right>" : ")"', ie_opt)
keymap('i', ']', 'getline(".")[col(".") - 1] == "]" ? "<Right>" : "]"', ie_opt)

-- Quebra automática de linha
keymap('i', '<CR>', 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Left><CR><Right><CR><CR><Up><Tab>" : (getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<Left><CR><Right><CR><CR><Up><Tab>" : "<CR>")', ie_opt)

-- init.lua
keymap('n', '<C-r>r', ':source $MYVIMRC<cr>', n_opt)
keymap('n', '<C-r>o', ':e $MYVIMRC<cr>', n_opt)

-- CTRL + S para salvar
keymap('n', '<C-s>', ':w<cr>', n_opt)

-- Navegação entre janelas
keymap('n', '<C-Right>', '<C-w>l', n_opt)
keymap('n', '<C-Left>', '<C-w>h', n_opt)
keymap('n', '<C-Down>', '<C-w>j', n_opt)
keymap('n', '<C-Up>', '<C-w>k', n_opt)

-- Modificação do tamanho das janelas
keymap('n', '<C-w><Left>', ':vertical resize -2<cr>', n_opt)
keymap('n', '<C-w><Right>', ':vertical resize +2<cr>', n_opt)
keymap('n', '<C-w><Up>', ':resize -2<cr>', n_opt)
keymap('n', '<C-w><Down>', ':resize +2<cr>', n_opt)

local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('tanvirtin/monokai.nvim')
Plug('lambdalisue/fern.vim')
Plug('lambdalisue/vim-fern-git-status')
Plug('lambdalisue/vim-nerdfont')
Plug('lambdalisue/vim-fern-renderer-nerdfont')
Plug('numToStr/Comment.nvim')
Plug('mattn/emmet-vim')
Plug('nvim-lualine/lualine.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('tpope/vim-fugitive')
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

vim.g.fern_renderer = 'nerdfont'

vim.g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css EmmetInstall')

require('lualine').setup()

require('colorizer').setup { css = { rgb_fn = true, hsl_fn = true }, html = { mode = 'foreground' } }
