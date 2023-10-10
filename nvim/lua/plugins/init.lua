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

  -- Autoclose paranthesis
  use {
    'windwp/nvim-autopairs',
    config = plugconf.autopairs,
  }

  -- Endwise
  use {
    'RRethy/nvim-treesitter-endwise',
    requires = {'nvim-treesitter/nvim-treesitter'},
    after = 'nvim-treesitter',
    config = plugconf.endwise,
    ft = {'ruby', 'lua', 'vim', 'bash', 'sh', 'elixir'}
  }

  -- Detect and autoset sw and et
  use 'tpope/vim-sleuth'

  -- Elixir integration
  use 'slashmili/alchemist.vim'


  -- Completion plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'quangnguyen30192/cmp-nvim-ultisnips',
    },
    config = plugconf.cmp,
  }

  -- Use local npm for eslint
  use { 'benjie/local-npm-bin.vim', ft = {'javascript'} }

  -- Scala integration
  use {
    'scalameta/nvim-metals',
    after = 'goto-preview',
  }

  -- Scratch buffer for lua
  use 'rafcamlet/nvim-luapad'

  -- Lsp config manager
  use {
    'neovim/nvim-lspconfig',
    after = 'goto-preview',
    config = plugconf.lspconfig
  }

  use {
    'rmagatti/goto-preview',
    after = { 'telescope.nvim'},
    opt = true
  }

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

  use {
    'molecule-man/telescope-menufacture',
    after = { 'telescope.nvim'},
    requires = {'nvim-telescope/telescope.nvim'},
    config = plugconf.menufacture,
  }

  -- Telescope tab switcher
  use {
    'LukasPietzschmann/telescope-tabs',
    after = { 'telescope.nvim'},
    requires = { 'nvim-telescope/telescope.nvim' },
    config = plugconf.telescopetabs
  }

  -- Use multiple cursors
  use 'terryma/vim-multiple-cursors'

  -- Extended motions
  use 'easymotion/vim-easymotion'

  -- Show indent lines
  use {
    "lukas-reineke/indent-blankline.nvim",
    config = plugconf.indentBlankline,
  }

  -- Expand regions after selection
  use 'terryma/vim-expand-region'

  -- Highlight jumps for f,F,t,T
  use 'unblevable/quick-scope'

  -- Open file at given line number eg: nvim init.lua:15
  use { 'bogado/file-line', branch="main" }

  -- Window chooser for switching
  use 't9md/vim-choosewin'

  -- Mappings for commonly used commands
  use 'tpope/vim-unimpaired'

  -- Smooth scrolling
  use {
    'declancm/cinnamon.nvim',
    config = plugconf.cinnamon,
  }

  -------------------------------------
  -- Accessories                     --
  -------------------------------------

  -- Support for patched fonts (nerdfonts.com)
  use 'kyazdani42/nvim-web-devicons'

  -- Status line and tab line plugin
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = plugconf.lualine,
  }

  use {
    'nanozuki/tabby.nvim',
    after = { 'material.nvim', 'lualine.nvim' },
    config = plugconf.tabby,
  }

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

  -- Show tags in sidebar (lsp only)
  use "stevearc/aerial.nvim"

  -- Show LSP process progress
  use {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = plugconf.fidget,
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
    config = plugconf.glow,
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
  use 'RRethy/nvim-base16'
  use 'KabbAmine/yowish.vim'
  use 'freeo/vim-kalisi'
  use 'marko-cerovac/material.nvim'


  -- Install packages if packer installed just now
  if packer_bootstrap then
    require('packer').sync()
  end
end)
