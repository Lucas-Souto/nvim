local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local ie_opt = { expr = true, noremap = true }
local s_opt = { silent = true, noremap = true }

-- Fecha automaticamente {, (, [
keymap('i', '{', '{}<Left>', opt)
keymap('i', '(', '()<Left>', opt)
keymap('i', '[', '[]<Left>', opt)

-- Evita escrever }, ), ] e ; se já houver um do lado
keymap('i', '}', 'getline(".")[col(".") - 1] == "}" ? "<Right>" : "}"', ie_opt)
keymap('i', ')', 'getline(".")[col(".") - 1] == ")" ? "<Right>" : ")"', ie_opt)
keymap('i', ']', 'getline(".")[col(".") - 1] == "]" ? "<Right>" : "]"', ie_opt)
keymap('i', ';', 'getline(".")[col(".") - 1] == ";" ? "<Right>" : ";"', ie_opt)

-- Insere {}, (), [], "" e '' no modo visual
keymap('v', '{', ':lua require("functions").embrace_selection("{ ", " }")<CR>', s_opt)
keymap('v', '(', ':lua require("functions").embrace_selection("(", ")")<CR>', s_opt)
keymap('v', '[', ':lua require("functions").embrace_selection("[", "]")<CR>', s_opt)
keymap('v', '"', ':lua require("functions").embrace_selection(\'"\', \'"\')<CR>', s_opt)
keymap('v', "'", ":lua require('functions').embrace_selection(\"'\", \"'\")<CR>", s_opt)

-- Quebra automática de linha
local brl = 'getline(".")[col(".") - 3] == " " && getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<CR><Tab><CR><BS><Up><Right>" : '
brl = brl .. '(getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Left><CR><Right><CR><Tab><CR><BS><Up><Right>" :'
brl = brl .. '(getline(".")[col(".") - 3] == " " && getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<CR><Tab><CR><BS><Up><Right>" :'
brl = brl .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<Left><CR><Right><CR><Tab><CR><BS><Up><Right>" : "<CR>")))'

keymap('i', '<CR>', brl, ie_opt)

-- Remoção automática de {}, (), []
local atrm = 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "(" && getline(".")[col(".") - 1] == ")" ? "<right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<right><BS><BS>" : '
atrm = atrm .. '"<BS>"))'

keymap('i', '<BS>', atrm, ie_opt)

-- CTRL + S para salvar
keymap('n', '<C-s>', ':w<CR>', s_opt)

-- Saída rápida
keymap('n', '<C-c>', ':q<CR>', s_opt)

-- Undotree
keymap('n', '<C-w>u', ':UndotreeToggle<CR>', s_opt)

-- Atalhos do Telescope (Arquivos)
keymap('n', '<C-f>f', ':Telescope find_files<CR>', s_opt)
keymap('n', '<C-f>g', ':Telescope live_grep<CR>', s_opt)
keymap('n', '<C-f>b', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', s_opt)
-- Atalhos do Telescope (Git)
keymap('n', '<C-g>c', ':Telescope git_commits<CR>', s_opt)
keymap('n', '<C-g>s', ':Telescope git_status<CR>', s_opt)

-- Modificação do tamanho das janelas
keymap('n', '<C-w><Left>', ':vertical resize -2<CR>', s_opt)
keymap('n', '<C-w><Right>', ':vertical resize +2<CR>', s_opt)
keymap('n', '<C-w><Up>', ':resize -2<CR>', s_opt)
keymap('n', '<C-w><Down>', ':resize +2<CR>', s_opt)

-- Manipulação de abas
keymap('n', '<C-t>n', ':tabnew<CR>', s_opt)
keymap('n', '<C-t>c', ':tab split<CR>', s_opt)
keymap('n', '<C-t>w', ':tabonly<CR>', s_opt)

-- Navegação entre abas
keymap('n', ',', ':-tabnext<CR>', s_opt)
keymap('n', '.', ':+tabnext<CR>', s_opt)
keymap('n', '<C-t>t', ':Tabby jump_to_tab<CR>', s_opt)

-- Movimentação de abas
keymap('n', 'H', ':-tabmove<CR>', s_opt)
keymap('n', 'L', ':+tabmove<CR>', s_opt)

-- Fold save e load
keymap('n', 'zs', ':mkview<CR>', s_opt)
keymap('n', 'zl', ':loadview<CR>', s_opt)

-- LSP
keymap('n', '<Space>d', ':lua vim.diagnostic.goto_next()<cr>', opt)

-- @ > |
keymap('n', '|', '@', opt)

-- Abrir todos os os arquivos do quickfix
keymap('n', '<C-q>', ':silent q | cfdo! tabedit<cr>', s_opt)

-- Rodar dotnet
keymap('n', '<C-d>r', '<C-w>s:terminal dotnet run<cr>', s_opt)
