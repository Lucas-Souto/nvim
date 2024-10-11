local keymap = vim.api.nvim_set_keymap
local opt = { noremap = true }
local ie_opt = { expr = true, noremap = true }
local s_opt = { silent = true, noremap = true }

-- Fecha automaticamente {, (, [
keymap('i', '{', '{}<Left>', opt)
keymap('i', '(', '()<Left>', opt)
keymap('i', '[', '[]<Left>', opt)

-- Evita escrever }, ) e ] se já houver um do lado
keymap('i', '}', 'getline(".")[col(".") - 1] == "}" ? "<Right>" : "}"', ie_opt)
keymap('i', ')', 'getline(".")[col(".") - 1] == ")" ? "<Right>" : ")"', ie_opt)
keymap('i', ']', 'getline(".")[col(".") - 1] == "]" ? "<Right>" : "]"', ie_opt)

-- Insere {}, (), [], "" e '' no modo visual
keymap('v', '{', ':lua require("functions").embrace_selection("{ ", " }")<CR>', s_opt)
keymap('v', '(', ':lua require("functions").embrace_selection("(", ")")<CR>', s_opt)
keymap('v', '[', ':lua require("functions").embrace_selection("[", "]")<CR>', s_opt)
keymap('v', '"', ':lua require("functions").embrace_selection(\'"\', \'"\')<CR>', s_opt)
keymap('v', "'", ":lua require('functions').embrace_selection(\"'\", \"'\")<CR>", s_opt)

-- Quebra automática de linha
local brl = 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Left><CR><Right><CR><Tab><CR><BS><Up><Right>" : '
brl = brl .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<Left><CR><Right><CR><Tab><CR><BS><Up><Right>" : "<CR>")'

keymap('i', '<CR>', brl, ie_opt)

-- Remoção automática de {}, (), []
local atrm = 'getline(".")[col(".") - 2] == "{" && getline(".")[col(".") - 1] == "}" ? "<Right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "(" && getline(".")[col(".") - 1] == ")" ? "<right><BS><BS>" : '
atrm = atrm .. '(getline(".")[col(".") - 2] == "[" && getline(".")[col(".") - 1] == "]" ? "<right><BS><BS>" : '
atrm = atrm .. '"<BS>"))'

keymap('i', '<BS>', atrm, ie_opt)

-- CTRL + S para salvar
keymap('n', '<C-s>', ':w<CR>', s_opt)

-- Undotree
keymap('n', '<C-u>', ':UndotreeToggle<CR>', s_opt)

-- Atalhos do Telescope (Arquivos)
keymap('n', '<C-f>f', ':Telescope find_files<CR>', s_opt)
keymap('n', '<C-f>g', ':Telescope live_grep<CR>', s_opt)
keymap('n', '<C-f>b', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', s_opt)
-- Atalhos do Telescope (Git)
keymap('n', '<C-g>c', ':Telescope git_commits<CR>', s_opt)
keymap('n', '<C-g>s', ':Telescope git_status<CR>', s_opt)

-- Navegação entre janelas
keymap('n', '<C-Right>', '<C-w>l', s_opt)
keymap('n', '<C-Left>', '<C-w>h', s_opt)
keymap('n', '<C-Down>', '<C-w>j', s_opt)
keymap('n', '<C-Up>', '<C-w>k', s_opt)

-- Modificação do tamanho das janelas
keymap('n', '<C-w><Left>', ':vertical resize -2<CR>', s_opt)
keymap('n', '<C-w><Right>', ':vertical resize +2<CR>', s_opt)
keymap('n', '<C-w><Up>', ':resize -2<CR>', s_opt)
keymap('n', '<C-w><Down>', ':resize +2<CR>', s_opt)

-- Manipulação de abas
keymap('n', '<C-t>n', ':tabnew<CR>', s_opt)
keymap('n', '<C-t>c', ':tab split<CR>', s_opt)
keymap('n', '<C-t>w', ':tabclose<CR>', s_opt)
keymap('n', '<C-t>W', ':tabonly<CR>', s_opt)

-- Navegação entre abas
keymap('n', '<C-t><Left>', ':-tabnext<CR>', s_opt)
keymap('n', '<C-t><Right>', ':+tabnext<CR>', s_opt)
keymap('n', '<C-t>t', ':Tabby jump_to_tab<CR>', s_opt)

-- Movimentação de abas
keymap('n', '<C-t>m<Left>', ':-tabmove<CR>', s_opt)
keymap('n', '<C-t>m<Right>', ':+tabmove<CR>', s_opt)

-- Fold save e load
keymap('n', 'zs', ':mkview<CR>', s_opt)
keymap('n', 'zl', ':loadview<CR>', s_opt)

-- LSP
keymap('n', '<Space>d', ':lua vim.diagnostic.goto_next()<cr>', opt)

-- @ > |
keymap('n', '|', '@', opt)
