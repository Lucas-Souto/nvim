local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Funcionalidade
Plug('lambdalisue/fern.vim')-- Explorador de arquivos
Plug('numToStr/Comment.nvim')-- Comentar linhas e seleção (gc, gb)
Plug('tpope/vim-fugitive')-- Comandos git
-- Aparência
Plug('tanvirtin/monokai.nvim')-- Tema
Plug('lambdalisue/vim-nerdfont')-- Nerdfont -----V 
Plug('lambdalisue/vim-fern-renderer-nerdfont')-- Renderizador para ícones 
Plug('nvim-lualine/lualine.nvim')-- Status
Plug('nanozuki/tabby.nvim')-- Abas
-- Code complete
Plug('Shougo/deoplete.nvim')
Plug('zchee/deoplete-clang')
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

vim.g['fern#renderer'] = 'nerdfont'

require('lualine').setup()

vim.g['deoplete#enable_at_startup'] = 1
vim.cmd('call deoplete#custom#option("num_processes", 4)')
vim.g['deoplete#sources#clang#libclang_path'] = '/usr/lib/llvm-18/lib/libclang-18.so.18'
vim.g['deoplete#sources#clang#clang_header'] = '/usr/lib/llvm-18/lib/clang/18/include/'

require('tabby.tabline').use_preset('tab_only',
{
	nerdfont = true,
	lualine_theme = 'auto',
	buf_name = { mode = "'unique'|'relative'|'tail'|'shorten'" }
})
