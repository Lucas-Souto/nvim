local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('tanvirtin/monokai.nvim')-- Tema
Plug('lambdalisue/fern.vim')-- Explorador de arquivos
Plug('lambdalisue/vim-fern-git-status')-- Git Status
Plug('lambdalisue/vim-nerdfont')-- Nerdfont -----V
Plug('lambdalisue/vim-fern-renderer-nerdfont')-- Renderer para ícones
Plug('lambdalisue/vim-glyph-palette')-- Cores para os ícones
Plug('numToStr/Comment.nvim')-- Comentar linhas e seleção
Plug('mattn/emmet-vim')-- Emmet
Plug('nvim-lualine/lualine.nvim')-- Footer
Plug('norcalli/nvim-colorizer.lua')-- Preview de cores
Plug('tpope/vim-fugitive')-- Comandos git
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

vim.g['fern#renderer'] = 'nerdfont'

vim.g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css EmmetInstall')

require('lualine').setup()

require('colorizer').setup { css = { rgb_fn = true, hsl_fn = true }, html = { mode = 'foreground' } }
