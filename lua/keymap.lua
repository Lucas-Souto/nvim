local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local ie_opt = { expr = true, noremap = true }
local s_opt = { silent = true, noremap = true }

-- Fecha automaticamente {, (, [, ", e '
keymap('i', '{', '{}<Left>', opt)
keymap('i', '(', '()<Left>', opt)
keymap('i', '[', '[]<Left>', opt)
keymap('i', '"', '""<Left>', opt)
keymap('i', "'", "''<Left>", opt)

-- Evita escrever ) e ] se já houver um do lado
keymap('i', ')', 'getline(".")[col(".") - 1] == ")" ? "<Right>" : ")"', ie_opt)
keymap('i', ']', 'getline(".")[col(".") - 1] == "]" ? "<Right>" : "]"', ie_opt)

-- Insere {}, (), [], "" e '' no modo visual
keymap('v', '{', ':lua require("functions").embrace_selection("{ ", " }")<CR>', s_opt)
keymap('v', '(', ':lua require("functions").embrace_selection("(", ")")<CR>', s_opt)
keymap('v', '[', ':lua require("functions").embrace_selection("[ ", " ]")<CR>', s_opt)
keymap('v', '"', ':lua require("functions").embrace_selection(\'"\', \'"\')<CR>', s_opt)
keymap('v', "'", ":lua require('functions').embrace_selection(\"'\", \"'\")<CR>", s_opt)

-- Tab e Shift Tab
keymap('v', '<Tab>', '1 >', s_opt)
keymap('v', '<S-Tab>', '1 <', s_opt)
keymap('n', '<Tab>', 'v 1 >', s_opt)
keymap('n', '<S-Tab>', 'v 1 <', s_opt)

-- Quebra automática de linha
local brl = 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Left><CR><Right><CR><Up><Right>" : '
brl = brl .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<Left><CR><Right><CR><Up><Right>" : "<CR>")'

keymap('i', '<CR>', brl, ie_opt)

-- Remoção automática de {}, (), [], "" e ''
local atrm = 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "(" && getline(".")[col(".") - 1] == ")" ? "<right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "\'" && getline(".")[col(".") - 1] == "\'" ? "<right><BS><BS>" : '
atrm = atrm .. "(getline('.')[col('.') - 2] == '\"' && getline('.')[col('.') - 1] == '\"' ? '<right><BS><BS>' : "
atrm = atrm .. '"<BS>"))))'

keymap('i', '<BS>', atrm, ie_opt)

-- CTRL + S para salvar
keymap('n', '<C-s>', ':w<cr>', s_opt)

-- Atalho para abrir o Fern
keymap('n', '<C-f>o', ':Fern . -drawer<cr>', s_opt)
keymap('n', '<C-f>p', ':Fern .<cr>', s_opt)

-- Navegação entre janelas
keymap('n', '<C-Right>', '<C-w>l', s_opt)
keymap('n', '<C-Left>', '<C-w>h', s_opt)
keymap('n', '<C-Down>', '<C-w>j', s_opt)
keymap('n', '<C-Up>', '<C-w>k', s_opt)

-- Modificação do tamanho das janelas
keymap('n', '<C-w><Left>', ':vertical resize -2<cr>', s_opt)
keymap('n', '<C-w><Right>', ':vertical resize +2<cr>', s_opt)
keymap('n', '<C-w><Up>', ':resize -2<cr>', s_opt)
keymap('n', '<C-w><Down>', ':resize +2<cr>', s_opt)

-- Manipulação de abas
keymap('n', '<C-t>n', ':tabnew<cr>', s_opt)
keymap('n', '<C-t>w', ':tabclose<cr>', s_opt)
keymap('n', '<C-t>W', ':tabonly<cr>', s_opt)

-- Navegação entre abas
keymap('n', '<C-t><Left>', ':-tabnext<cr>', s_opt)
keymap('n', '<C-t><Right>', ':+tabnext<cr>', s_opt)

-- Movimentação de abas
keymap('n', '<C-t>m<Left>', ':-tabmove<cr>', s_opt)
keymap('n', '<C-t>m<Right>', ':+tabmove<cr>', s_opt)

-- Fold save e load
keymap('n', 'zs', ':mkview<cr>', s_opt)
keymap('n', 'zl', ':loadview<cr>', s_opt)
