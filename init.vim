:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
:set smartindent
:set number
:set clipboard=unnamedplus
:set nowrap
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
Plug 'zchee/deoplete-clang'

call plug#end()

syntax on
colorscheme monokai

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-18/lib/libclang-18.so.18'
let g:deoplete#sources#clang#clang_header = '/usr/lib/llvm-18/lib/clang/18/include/'
let g:deoplete#enable_at_startup = 1
