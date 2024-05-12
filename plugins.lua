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
