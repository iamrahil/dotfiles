-- SETUP
local norem = { noremap = true }

function map(shortcut, command, options)
  vim.api.nvim_set_keymap('', shortcut, command, options)
end

function nmap(shortcut, command, options)
  vim.api.nvim_set_keymap('n', shortcut, command, options)
end

function imap(shortcut, command, options)
  vim.api.nvim_set_keymap('i', shortcut, command, options)
end

function vmap(shortcut, command, options)
  vim.api.nvim_set_keymap('v', shortcut, command, options)
end

function tmap(shortcut, command, options)
  vim.api.nvim_set_keymap('t', shortcut, command, options)
end

-- KEYBINDINGS

map('<F8>', ':NvimTreeToggle<cr>', {})
map('<F9>', ':TagbarToggle<cr>', {})

nmap('gp', '`[v`]', norem)

-- Move lines
nmap('<C-Down>', ':m .+1<CR>==', norem)
nmap('<C-Up>', ':m .-2<CR>==', norem)
imap('<C-Down>', '<Esc>:m .+1<CR>==gi', norem)
imap('<C-Up>', '<Esc>:m .-2<CR>==gi', norem)
vmap('<C-Down>', ':m \'>+1<CR>gv=gv', norem)
vmap('<C-Up>', ':m \'<-2<CR>gv=gv', norem)

-- Buffer Mappings
nmap('<C-e>', ':b#<CR>', {})
nmap('<C-PageUp>', ':bnext<CR>', {})
nmap('<C-PageDown>', ':bprev<CR>', {})

-- Tabs Navigation
nmap('<leader>]', ':tabnext<CR>', {})
nmap('<leader>[', ':tabprev<CR>', {})

-- Toggle Highlights
map('<leader>q', ':noh<CR>', {})

-- Error mnemonic (Neomake uses location list)
nmap(']e', ':lnext<CR>', norem)
nmap('[e', ':lprevious<CR>', norem)

-- Telescope
nmap('<c-P>', '<cmd>Telescope find_files<CR>', norem)
nmap('<c-Y>', '<cmd>Telescope tags<CR>', norem)
nmap('<leader>b', '<cmd>Telescope buffers<CR>', norem)
nmap('<c-L>', '<cmd>Telescope<CR>', norem)
nmap('<c-;>', '<cmd>Telescope commands<CR>', norem)

-- Terminal Shortcuts
nmap('<leader>tt', ':tabnew | term<CR>', norem)
nmap('<leader>tv', ':vsplit | term<CR>', norem)
nmap('<leader>tx', ':split | term<CR>', norem)

-- Vim-Test Shortcuts
nmap('<leader>ss', ':TestLast<CR>', norem)
nmap('<leader>sn', ':TestNearest<CR>', norem)
nmap('<leader>sf', ':TestFile<CR>', norem)
nmap('<leader>sg', ':TestVisit<CR>', norem)
