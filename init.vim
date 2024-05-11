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
Plug 'Shougo/deoplete.nvim'

call plug#end()

syntax on
colorscheme monokai
