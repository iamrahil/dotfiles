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

map('<F8>', ':NvimTreeFindFileToggle<cr>', {})
map('<F20>', ':NvimTreeToggle<cr>', {}) -- Shitf+<F8>
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
nmap('<leader>lt', ':Telescope telescope-tabs list_tabs<CR>', {})
nmap('<leader><tab>', '<cmd>lua require("telescope-tabs").go_to_previous()<CR>', norem)

-- Toggle Highlights
map('<leader>q', ':noh<CR>', {})

-- Error mnemonic (Neomake uses location list)
nmap(']e', ':lnext<CR>', norem)
nmap('[e', ':lprevious<CR>', norem)

-- Telescope
nmap('<c-P>', '<cmd>Telescope menufacture find_files<CR>', norem)
nmap('<c-Y>', '<cmd>Telescope tags<CR>', norem)
nmap('<leader>b', '<cmd>echo <leader>lb instead<CR>', norem) -- deprecated; to be removed
nmap('<leader>lb', '<cmd>Telescope buffers<CR>', norem)
nmap('<c-L>', '<cmd>Telescope<CR>', norem)
nmap('<c-;>', '<cmd>Telescope commands<CR>', norem)

-- Search
nmap('<leader>lf', '<cmd>Telescope menufacture find_files<CR>', norem)
nmap('<leader>lg', '<cmd>Telescope menufacture grep_string<CR>', norem)
nmap('<leader>ll', '<cmd>Telescope menufacture live_grep<CR>', norem)

-- Terminal Shortcuts
nmap('<leader>tt', ':tabnew | term<CR>', norem)
nmap('<leader>tv', ':vsplit | term<CR>', norem)
nmap('<leader>tx', ':split | term<CR>', norem)

-- Vim-Test Shortcuts
vim.keymap.set('n', '<leader>sn', function()
  local neotest = require('neotest')
  neotest.run.run()
end, norem)

vim.keymap.set('n', '<leader>sa', function()
  local neotest = require('neotest')
  neotest.run.attach()
end, norem)

vim.keymap.set('n', '<leader>ss', function()
  local neotest = require('neotest')
  neotest.run.run_last()
end, norem)

vim.keymap.set('n', '<leader>sf', function()
  local neotest = require('neotest')
  neotest.run.run(vim.fn.expand("%"))
  neotest.summary.open()
end, norem)

vim.keymap.set('n', '<leader>sg', function()
  require('neotest').summary.toggle()
end, norem)

-- Copy filename to system clipboard
nmap('<leader>cff', ':let @+=expand("%")<CR>', norem)
-- Copy filename:linenumber to system clipboard
nmap('<leader>cfl', ':let @+=expand("%").":".line(".")<CR>', norem)
-- Copy filename:linenumber:column to system clipbaord
nmap('<leader>cfc', ':let @+=expand("%").":".line(".").":".col(".")<CR>', norem)
nmap('<leader>cfn', '<cmd>echo <leader>cfc instead<CR>', norem) -- deprecated; to be removed

-- Git commands
nmap('<leader>gb', '<cmd>Git blame<CR>', norem)
