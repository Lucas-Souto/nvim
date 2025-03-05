local Plug = vim.fn['plug#']

vim.call('plug#begin')
-- Funcionalidade
Plug('nvim-lua/plenary.nvim')-- Dependência de outros plugins
Plug('numToStr/Comment.nvim')-- Comentar linhas e seleção (gc, gb)
Plug('tpope/vim-fugitive')-- Comandos git
Plug('mattn/emmet-vim')-- Emmet
Plug('norcalli/nvim-colorizer.lua')-- Pré-visualizar cores (#000, rgba(...))
Plug('mbbill/undotree')-- Navegar entre o histórico de alterações
Plug('nvim-telescope/telescope.nvim', { tag = '0.1.8' })-- Buscador de arquivos (Depende de BurntSushi/ripgrep)
Plug('nvim-telescope/telescope-file-browser.nvim')-- Explorador de arquivos
-- Linguagem
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('VonHeikemen/lsp-zero.nvim', { branch = 'v4.x' })
-- Aparência
Plug('tanvirtin/monokai.nvim')-- Tema
Plug('nvim-lualine/lualine.nvim')-- Status
Plug('nanozuki/tabby.nvim')-- Abas
Plug('nvim-tree/nvim-web-devicons')-- Ícones do Nerdfont
vim.call('plug#end')

require('monokai').setup()

require('Comment').setup()

require('colorizer').setup { css = { rgb_fn = true, hsl_fn = true }, html = { mode = 'foreground' } }

require('lualine').setup()

require('tabby.tabline').use_preset('tab_only',
{
	nerdfont = true,
	lualine_theme = 'auto',
	buf_name = { mode = "'unique'|'relative'|'tail'|'shorten'" }
})
