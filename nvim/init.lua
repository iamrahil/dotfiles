local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set optionslocal cmd = vim.cmd

local HOME = os.getenv('HOME')

pcall(function() require('custom.variables') end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

opt.number = true         -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.hlsearch = true
opt.magic = true
opt.smarttab = true
opt.autoindent = true
opt.autoread = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.scrolloff = 4
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

opt.laststatus = 3 -- Common statusbas for all window buffers

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
    colorscheme base16-ayu-mirage
    catch
  endtry
]])

g.tex_flavor = "latex"

if (fn.executable('ag') == 1) then
    opt.grepprg = 'ag --nogroup --nocolor'
  else
    opt.grepprg = 'grep -nH $*'
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
    local lsp = require('configs.lsp')
    lsp.keymaps()

    vim.api.nvim_set_keymap('n', "<c-k>", '<cmd>Telescope metals commands<CR>', {noremap = true})
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
