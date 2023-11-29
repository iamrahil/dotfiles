local plugconf = require('plugins.config')
local barePlugins = require('plugins.bare')

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

  barePlugins(use)

  if(vim.env.NVIM_BARE_CONFIG=="1") then
    return
  end

  -------------------------------------
  -- Syntax and autocomplete         --
  -------------------------------------
  -- Syntax check runnder
  use 'dense-analysis/ale'

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

  -- LSP goto preview
  use {
    'rmagatti/goto-preview',
    after = { 'telescope.nvim'},
    opt = true
  }

  -------------------------------------
  -- Navigation                      --
  -------------------------------------

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

  -- Vim registers manager
  use {
    'tversteeg/registers.nvim',
    branch = 'main',
    keys = { { 'n', '"' }, { 'i', '<c-r>' } },
    cmd = {'Registers'},
    config = plugconf.registers
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

  -- Github CLI Integration
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    opt = true,
    cmd = 'Octo',
    after = { 'telescope.nvim' },
    config = plugconf.octo,
  }


  -------------------------------------
  -- Color Schemes                   --
  -------------------------------------
  use 'KabbAmine/yowish.vim'
  use 'freeo/vim-kalisi'

  -- Install packages if packer installed just now
  if packer_bootstrap then
    require('packer').sync()
  end
end)
-- vim: set ts=2 sw=2 tw=0 et :
