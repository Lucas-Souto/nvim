local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Funcionalidade
Plug('lambdalisue/fern.vim')-- Explorador de arquivos
Plug('lambdalisue/vim-fern-git-status')-- Git Status
Plug('mattn/emmet-vim')-- Emmet
Plug('numToStr/Comment.nvim')-- Comentar linhas e seleção (gc, gb)
Plug('anuvyklack/keymap-amend.nvim')-- Dependência --V
Plug('anuvyklack/fold-preview.nvim')-- Pré-visualizar blocos colapsados
Plug('tpope/vim-fugitive')-- Comandos git
Plug('norcalli/nvim-colorizer.lua')-- Pré-visualizar cores (#000, rgba(...))
-- Aparência
Plug('tanvirtin/monokai.nvim')-- Tema
Plug('lambdalisue/vim-nerdfont')-- Nerdfont -----V
Plug('lambdalisue/vim-fern-renderer-nerdfont')-- Renderizador para ícones
Plug('lambdalisue/vim-glyph-palette')-- Cores para os ícones --^
Plug('nvim-lualine/lualine.nvim')-- Status
Plug('nanozuki/tabby.nvim')-- Abas
-- Code complete
Plug('Shougo/deoplete.nvim') 
Plug('zchee/deoplete-clang')
Plug('carlitux/deoplete-ternjs', { ['do'] = 'npm install -g tern' })
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

vim.g['fern#renderer'] = 'nerdfont'

vim.g.user_emmet_install_global = 0
vim.cmd('autocmd FileType html,css EmmetInstall')

require('lualine').setup()

require('colorizer').setup { css = { rgb_fn = true, hsl_fn = true }, html = { mode = 'foreground' } }

vim.g['deoplete#sources#clang#libclang_path'] = '/usr/lib/llvm-18/lib/libclang-18.so.18'
vim.g['deoplete#sources#clang#clang_header'] = '/usr/lib/llvm-18/lib/clang/18/include/'
vim.g['deoplete#enable_at_startup'] = 1
vim.cmd('call deoplete#custom#option("num_processes", 4)')
vim.g["deoplete#source#ternjs#docs"] = 1

require('fold-preview').setup { auto = 400 }

require('tabby.tabline').use_preset('tab_only',
{
	nerdfont = true,
	lualine_theme = 'auto',
	buf_name = { mode = "'unique'|'relative'|'tail'|'shorten'" }
})
