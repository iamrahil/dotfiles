local plugconf = require('plugins.config')

function plugins(use)
  -------------------------------------
  -- Syntax and autocomplete         --
  -------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = plugconf.treesitter,
  }

  -- Comment lines
  use 'scrooloose/nerdcommenter'

  -- Endwise
  use {
    'RRethy/nvim-treesitter-endwise',
    requires = {'nvim-treesitter/nvim-treesitter'},
    after = 'nvim-treesitter',
    config = plugconf.endwise,
    ft = {'ruby', 'lua', 'vim', 'bash', 'sh', 'elixir'}
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

  -- Open file at given line number eg: nvim init.lua:15
  use { 'bogado/file-line', branch="main" }


  -------------------------------------
  -- Accessories                     --
  -------------------------------------

  -- Support for patched fonts (nerdfonts.com)
  use 'nvim-tree/nvim-web-devicons'

  -- Status line and tab line plugin
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
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

  -- Zoom current buffer
  use {
    'markstory/vim-zoomwin',
    cmd = 'ZoomToggle',
    keys = { {'n', '<leader>z'} }
  }

  -- OSC52 support. (Clipboard from terminal escape codes)
  use { 'ojroques/nvim-osc52' }

  -- Open file on the line it was last used
  use {
    'ethanholz/nvim-lastplace',
    config = plugconf.lastplace,
  }

  -------------------------------------
  -- Color Schemes                   --
  -------------------------------------

  use 'RRethy/nvim-base16'
  use 'marko-cerovac/material.nvim'

end

return plugins
-- vim: set ts=2 sw=2 tw=0 et :
