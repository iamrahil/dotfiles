-- Plugins that fit nowhere else
return {
  -- Zoom current buffer
  {
    'markstory/vim-zoomwin',
    cmd = 'ZoomToggle',
    keys = { '<leader>z' }
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
    config = true
  },
  -- Vim registers manager
  {
    'tversteeg/registers.nvim',
    branch = 'main',
    keys = { { '"', mode = 'n' }, { '<c-r>', mode = 'i' } },
    cmd = {'Registers'},
    config = true
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
  {
    'rafcamlet/nvim-luapad',
    lazy = true,
    cmd = { 'Luapad' }
  },

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

  {
    'ruifm/gitlinker.nvim',
    dependencies = {'nvim-lua/plenary.nvim'},
    config = true
  },

  -- Wrapper for running tests from nvim
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "olimorris/neotest-rspec",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-rspec"),
        }
      })
    end
  }
}
