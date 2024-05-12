:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set smartindent
:set number
:set clipboard=unnamedplus
:set nowrap
:set completeopt-=preview
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

inoremap <expr> ) getline('.')[col('.') - 1] == ')' ? '<Right>' : ')'
inoremap <expr> ] getline('.')[col('.') - 1] == ']' ? '<Right>' : ']'

inoremap <expr> <Enter> getline('.')[col('.') - 2] == '{' && getline('.')[col('.') - 1] == '}' ? '<Left><Enter><Right><Enter><Enter><Up><Tab>' : (getline('.')[col('.') - 2] == '[' && getline('.')[col('.') - 1] == ']' ? '<Left><Enter><Right><Enter><Enter><Up><Tab>' : '<Enter>')

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tanvirtin/monokai.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/vim-fern-git-status'
Plug 'lambdalisue/vim-nerdfont'
Plug 'lambdalisue/vim-fern-renderer-nerdfont'
Plug 'numToStr/Comment.nvim'
Plug 'mattn/emmet-vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

syntax on
colorscheme monokai

lua require('Comment').setup()

let g:fern#renderer = 'nerdfont'

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

lua require('lualine').setup()

lua require('colorizer').setup { css = { rgb_fn = true; hsl_fn = true }; html = { mode = 'foreground' }; }
