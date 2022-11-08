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

  -- Syntax and autocomplete
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = plugconf.treesitter,
  }
  use 'sheerun/vim-polyglot'
  use 'dense-analysis/ale'
  use 'scrooloose/nerdcommenter'
  use 'SirVer/ultisnips'
  use 'honza/vim-snippets'
  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use { 'mattn/emmet-vim', ft = { 'html' } }
  use 'cohama/lexima.vim'
  use 'tpope/vim-sleuth'
  use 'slashmili/alchemist.vim'
  use {
    'Shougo/deoplete.nvim',
    run = ':UpdateRemotePlugins',
    config = plugconf.deoplete,
  }
  use { 'benjie/local-npm-bin.vim', ft = {'javascript'} }
  use 'scalameta/nvim-metals'
  use 'rafcamlet/nvim-luapad'
  use { 'neovim/nvim-lspconfig', config = plugconf.lspconfig }

  -- Navigation
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = plugconf.telescope,
    cmd = 'Telescope',
    module = 'telescope',
  }
  use 'terryma/vim-multiple-cursors'
  use 'easymotion/vim-easymotion'
  use 'Yggdroot/indentLine'
  use 'terryma/vim-expand-region'
  use 'unblevable/quick-scope'
  use 'bogado/file-line' -- Open file at given line number eg: nvim init.lua:15
  use 't9md/vim-choosewin'
  use 'tpope/vim-unimpaired'

  -- Accessories
  use 'kyazdani42/nvim-web-devicons'
  use 'bling/vim-airline'
  use {
    'kyazdani42/nvim-tree.lua',
    config = plugconf.nvimtree,
  }
  use {
    'majutsushi/tagbar',
    opt = true,
    cmd = {'TagbarToggle', 'TagbarOpen'}
  }

  use {
    'scrooloose/nerdtree',
    opt = true,
    cmd = {'NERDTreeToggle'}
  }

  use {
    'vim-test/vim-test',
    opt = true,
    cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'}
  }

  use { 'rking/ag.vim', opt = true, cmd = {'Ag'} }
  use 'itchyny/vim-cursorword'  -- Underline word under the cursor
  use 'markstory/vim-zoomwin'
  use {
    'tversteeg/registers.nvim',
    branch = 'main',
    keys = { { 'n', '"' }, { 'i', '<c-r>' } }
  }

  use {
    'ethanholz/nvim-lastplace',
    config = plugconf.lastplace,
  }

  use {
    "ellisonleao/glow.nvim",
    ft = {'markdown'},
    opt = true,
    cmd = 'Glow'
  }

  use {
    'sudormrfbin/cheatsheet.nvim',

    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }

  -- VCS
  use 'tpope/vim-fugitive'
  use 'mhinz/vim-signify'
  use 'jreybert/vimagit'
  use 'rhysd/committia.vim'

  -- Color Schemes
  use 'chriskempson/base16-vim'
  use 'KabbAmine/yowish.vim'
  use 'freeo/vim-kalisi'
  use 'marko-cerovac/material.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
