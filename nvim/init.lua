local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set optionslocal cmd = vim.cmd

local HOME = os.getenv('HOME')

cmd([[
  if filereadable(expand("~/.config/nvim/nvimrc.bundles"))
    source ~/.config/nvim/nvimrc.bundles
  endif

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
    colorscheme yowish
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

g['deoplete#enable_at_startup'] = 1  -- enable deoplete at startup

-- Not yet migrated code
require('vimscript')
require('configs')

require "telescope".setup {
  pickers = {
    colorscheme = {
      enable_preview = true
    }
  }
}
-- vim: set ts=2 sw=2 tw=0 et :
