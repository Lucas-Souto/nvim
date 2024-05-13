local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local ie_opt = { expr = true, noremap = true }
local n_opt = { silent = true, noremap = true }

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
keymap('v', '{', ':lua require("functions").embrace_selection("{", "}")<cr>', n_opt)
keymap('v', '(', ':lua require("functions").embrace_selection("(", ")")<cr>', n_opt)
keymap('v', '[', ':lua require("functions").embrace_selection("[", "]")<cr>', n_opt)
keymap('v', '"', ':lua require("functions").embrace_selection(\'"\', \'"\')<cr>', n_opt)
keymap('v', "'", ":lua require('functions').embrace_selection(\"'\", \"'\")<cr>", n_opt)

-- Quebra automática de linha
keymap('i', '<CR>', 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Left><CR><Right><CR><CR><Up><Tab>" : (getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<Left><CR><Right><CR><CR><Up><Tab>" : "<CR>")', ie_opt)

-- init.lua
keymap('n', '<C-r>r', ':source $MYVIMRC<cr>:echo "Pronto!"<cr>', n_opt)
keymap('n', '<C-r>o', ':e $MYVIMRC<cr>', n_opt)

-- CTRL + S para salvar
keymap('n', '<C-s>', ':w<cr>', n_opt)

-- Atalhos para abrir o Fern
keymap('n', '<C-f>o', ':Fern . -drawer<cr>', n_opt)
keymap('n', '<C-f>p', ':Fern .<cr>', n_opt)

-- Navegação entre janelas
keymap('n', '<C-Right>', '<C-w>l', n_opt)
keymap('n', '<C-Left>', '<C-w>h', n_opt)
keymap('n', '<C-Down>', '<C-w>j', n_opt)
keymap('n', '<C-Up>', '<C-w>k', n_opt)

-- Modificação do tamanho das janelas
keymap('n', '<C-w><Left>', ':vertical resize -2<cr>', n_opt)
keymap('n', '<C-w><Right>', ':vertical resize +2<cr>', n_opt)
keymap('n', '<C-w><Up>', ':resize -2<cr>', n_opt)
keymap('n', '<C-w><Down>', ':resize +2<cr>', n_opt)

-- Manipulação de abas
keymap('n', '<C-t>n', ':tabnew<cr>', n_opt)
keymap('n', '<C-t>w', ':tabclose<cr>', n_opt)
keymap('n', '<C-t>W', ':tabonly<cr>', n_opt)
keymap('n', '<C-t><Left>', ':-tabnext<cr>', n_opt)
keymap('n', '<C-t><Right>', ':+tabnext<cr>', n_opt)
