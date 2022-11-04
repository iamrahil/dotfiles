local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set optionslocal cmd = vim.cmd

local HOME = os.getenv('HOME')

require('plugins')

cmd([[
  set rtp^=/usr/share/vim/vimfiles/
  set runtimepath+=$GOROOT/misc/vim
  syntax on
]])

opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.hlsearch = true
opt.magic = true
opt.smarttab = true
opt.autoindent = true
opt.autoread = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.termguicolors = true   -- True color support

opt.undofile = true
opt.undodir = HOME..'/.config/nvim/undodir'

-- set default split positions
opt.splitright = true
opt.splitbelow = true
opt.backspace = 'indent,eol,start'
opt.laststatus = 2

-- Display whitespace characters
opt.listchars = 'tab:│ ,trail:·'
opt.list = true

opt.foldmethod = 'indent' --Fold Methods
opt.foldenable = false    -- Stop from folding at load

opt.inccommand = 'nosplit' -- Live substitute preview
opt.incsearch = true

opt.wildignore:append {
  '*/tmp/*',
  '*.so',
  '*.swp',
  '*.zip',
  '*/vendor/*',
  '*/.git/*',
  '*/bower_components/*',
  '*/node_modules/*',
  '*/dist/*',
  '*/build/*'
}

if (fn.has('mouse') == 1) then
  opt.mouse = 'a'
end

-- Set colorscheme
cmd([[
  try
    let g:material_style = "darker"
    colorscheme material
    catch
  endtry
]])

opt.grepprg = 'grep -nH $*'

g.tex_flavor = "latex"

if (fn.executable('ag') == 1) then
    opt.grepprg = 'ag --nogroup --nocolor'
end

--signify: updte git markers when vim gains focus
g.signify_update_on_focusgained = 0

-- Not yet migrated code
cmd([[
  if filereadable(expand("~/.config/nvim/old.vim"))
    source ~/.config/nvim/old.vim
  endif
]])
require('configs')


local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach({})
    -- TODO: Move these keybindings elsewhere
    local norem = {noremap = true}
    vim.api.nvim_set_keymap('n', "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", {})
    vim.api.nvim_set_keymap('n', "K", "<cmd>lua vim.lsp.buf.hover()<CR>", norem)
    vim.api.nvim_set_keymap('n', "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", norem)
    vim.api.nvim_set_keymap('n', "gr", "<cmd>lua vim.lsp.buf.references()<CR>", norem)
    vim.api.nvim_set_keymap('n', "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", norem)
    vim.api.nvim_set_keymap('n', "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", norem)
    vim.api.nvim_set_keymap('n', "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]], norem)
    vim.api.nvim_set_keymap('n', "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], norem)
    vim.api.nvim_set_keymap('n', "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", norem)
    vim.api.nvim_set_keymap('n', "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", norem)
    vim.api.nvim_set_keymap('n', "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", norem)
    vim.api.nvim_set_keymap('n', "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>', norem)
    vim.api.nvim_set_keymap('n', "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]], norem) -- all workspace diagnostics
    vim.api.nvim_set_keymap('n', "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]], norem) -- all workspace errors
    vim.api.nvim_set_keymap('n', "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]], norem) -- all workspace warnings
    vim.api.nvim_set_keymap('n', "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", norem) -- buffer diagnostics only
    vim.api.nvim_set_keymap('n', "[l", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>", norem)
    vim.api.nvim_set_keymap('n', "]l", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>", norem)
    vim.api.nvim_set_keymap('n', "<c-k>", '<cmd>Telescope metals commands<CR>', norem)
  end,
  group = nvim_metals_group,
})
vim.opt_global.shortmess:remove("F")

cmd([[
  if filereadable(expand("~/.config/nvim/custom.vim"))
    source ~/.config/nvim/custom.vim
  endif
]])

pcall(function() require('custom') end)

-- vim: set ts=2 sw=2 tw=0 et :
