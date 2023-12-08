-- Plugins that fit nowhere else
return {
  -- Zoom current buffer
  {
    'markstory/vim-zoomwin',
    cmd = 'ZoomToggle',
    keys = { {'n', '<leader>z'} }
  },

  -- OSC52 support. (Clipboard from terminal escape codes)
  'ojroques/nvim-osc52',

  -- Open file on the line it was last used
  {
    'ethanholz/nvim-lastplace',
    config = function()
      require'nvim-lastplace'.setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      }
    end
  },
  -- Open file at given line number eg: nvim init.lua:15
  {
    'bogado/file-line',
    branch = "main"
  },
  -- Markdown preview
  {
    "ellisonleao/glow.nvim",
    ft = {'markdown'},
    lazy = true,
    cmd = 'Glow',
    config = function()
      require('glow').setup()
    end
  },
  -- Vim registers manager
  {
    'tversteeg/registers.nvim',
    branch = 'main',
    keys = { { 'n', '"' }, { 'i', '<c-r>' } },
    cmd = {'Registers'},
    config = function()
      require("registers").setup()
    end
  },
  -- Cheatsheet for common commands
  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  },
  -- Scratch buffer for lua
  'rafcamlet/nvim-luapad',

  -- Window chooser for switching
  't9md/vim-choosewin',

  -- Mappings for commonly used commands
  'tpope/vim-unimpaired',

  -- Show tags in sidebar (ctags only)
  {
    'majutsushi/tagbar',
    lazy = true,
    cmd = {'TagbarToggle', 'TagbarOpen'}
  },

  -- Wrapper for running tests from nvim
  {
    'vim-test/vim-test',
    lazy = true,
    cmd = {'TestFile', 'TestLast', 'TestNearest', 'TestSuite', 'TestVisit'}
  },
}
