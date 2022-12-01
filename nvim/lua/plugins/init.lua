local plugconf = require('plugins.config')

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -------------------------------------
  -- Syntax and autocomplete         --
  -------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = plugconf.treesitter,
  }
  -- Syntax support for muliple languages
  use 'sheerun/vim-polyglot'

  -- Syntax check runnder
  use 'dense-analysis/ale'

  -- Comment lines
  use 'scrooloose/nerdcommenter'

  -- Snippet libraries
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'

  -- Surround shorcuts for paranthesis etc
  use 'tpope/vim-surround'

  -- Editorconfig plugin
  use 'editorconfig/editorconfig-vim'

  -- HTML abbreviation expansion
  use { 'mattn/emmet-vim', ft = { 'html' } }

  -- Autoclose paranthesis and endwise
  use 'cohama/lexima.vim'

  -- Detect and autoset sw and et
  use 'tpope/vim-sleuth'

  -- Elixir integration
  use 'slashmili/alchemist.vim'


  -- Completion plugin
  use {
    'Shougo/deoplete.nvim',
    run = ':UpdateRemotePlugins',
    config = plugconf.deoplete,
  }

  -- Use local npm for eslint
  use { 'benjie/local-npm-bin.vim', ft = {'javascript'} }

  -- Scala integration
  use 'scalameta/nvim-metals'

  -- Scratch buffer for lua
  use 'rafcamlet/nvim-luapad'

  -- Lsp config manager
  use { 'neovim/nvim-lspconfig', config = plugconf.lspconfig }


  -------------------------------------
  -- Navigation                      --
  -------------------------------------

  -- Popup fuzzy finder
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = plugconf.telescope,
    cmd = 'Telescope',
    module = 'telescope',
  }

  -- Use multiple cursors
  use 'terryma/vim-multiple-cursors'

  -- Extended motions
  use 'easymotion/vim-easymotion'

  -- Show indent lines
  use 'Yggdroot/indentLine'

  -- Expand regions after selection
  use 'terryma/vim-expand-region'

  -- Highlight jumps for f,F,t,T
  use 'unblevable/quick-scope'

  -- Open file at given line number eg: nvim init.lua:15
  use 'bogado/file-line'

  -- Window chooser for switching
  use 't9md/vim-choosewin'

  -- Mappings for commonly used commands
  use 'tpope/vim-unimpaired'

  -------------------------------------
  -- Accessories                     --
  -------------------------------------

  -- Support for patched fonts (nerdfonts.com)
  use 'kyazdani42/nvim-web-devicons'

  -- Status line and tab line plugin
  use 'bling/vim-airline'

  -- File tree explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = plugconf.nvimtree,
  }

  -- Show tags in sidebar (ctags only)
  use {
    'majutsushi/tagbar',
    opt = true,
    cmd = {'TagbarToggle', 'TagbarOpen'}
  }

  -- File tree explorer
  use {
    'scrooloose/nerdtree',
    opt = true,
    cmd = {'NERDTreeToggle'}
  }

  -- Wrapper for running tests from nvim
  use {
    'vim-test/vim-test',
    opt = true,
    cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'}
  }

  -- Silversearcher (ag) integration
  use { 'rking/ag.vim', opt = true, cmd = {'Ag'} }

  -- Underline word under the cursor
  use 'itchyny/vim-cursorword'

  -- Zoom current buffer
  use {
    'markstory/vim-zoomwin',
    cmd = 'ZoomToggle',
    keys = { {'n', '<leader>z'} }
  }

  -- OSC52 support. (Clipboard from terminal escape codes)
  use { 'ojroques/nvim-osc52' }

  -- Vim registers manager
  use {
    'tversteeg/registers.nvim',
    branch = 'main',
    keys = { { 'n', '"' }, { 'i', '<c-r>' } },
    cmd = {'Registers'},
    config = plugconf.registers
  }

  -- Open file on the line it was last used
  use {
    'ethanholz/nvim-lastplace',
    config = plugconf.lastplace,
  }

  -- Markdown preview
  use {
    "ellisonleao/glow.nvim",
    ft = {'markdown'},
    opt = true,
    cmd = 'Glow'
  }

  -- Cheatsheet for common commands
  use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }

  -------------------------------------
  -- VCS                             --
  -------------------------------------

  -- Git plugins from tpope
  use 'tpope/vim-fugitive'

  -- Git signs
  use 'mhinz/vim-signify'

  -- Magit implementation for nvim
  use 'jreybert/vimagit'

  -- Commit message helper
  use 'rhysd/committia.vim'

  -- Show blame commit in popup
  use { 'rhysd/git-messenger.vim', config = plugconf.gitmessenger }


  -------------------------------------
  -- Color Schemes                   --
  -------------------------------------
  use 'chriskempson/base16-vim'
  use 'KabbAmine/yowish.vim'
  use 'freeo/vim-kalisi'
  use 'marko-cerovac/material.nvim'


  -- Install packages if packer installed just now
  if packer_bootstrap then
    require('packer').sync()
  end
end)
