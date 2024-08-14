local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Funcionalidade
Plug('lambdalisue/fern.vim')-- Explorador de arquivos
Plug('numToStr/Comment.nvim')-- Comentar linhas e seleção (gc, gb)
Plug('tpope/vim-fugitive')-- Comandos git
Plug('mattn/emmet-vim')-- Emmet
Plug('norcalli/nvim-colorizer.lua')-- Pré-visualizar cores (#000, rgba(...))
Plug('mbbill/undotree')-- Navegar entre o histórico de alterações
-- Aparência
Plug('tanvirtin/monokai.nvim')-- Tema
Plug('lambdalisue/vim-nerdfont')-- Nerdfont -----V 
Plug('lambdalisue/vim-fern-renderer-nerdfont')-- Renderizador para ícones 
Plug('nvim-lualine/lualine.nvim')-- Status
Plug('nanozuki/tabby.nvim')-- Abas
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

vim.g['fern#renderer'] = 'nerdfont'

require('colorizer').setup { css = { rgb_fn = true, hsl_fn = true }, html = { mode = 'foreground' } }

require('lualine').setup()

require('tabby.tabline').use_preset('tab_only',
{
	nerdfont = true,
	lualine_theme = 'auto',
	buf_name = { mode = "'unique'|'relative'|'tail'|'shorten'" }
})
