return {
  -- Git plugins from tpope
  'tpope/vim-fugitive',

  -- Git signs
  'mhinz/vim-signify',

  -- Magit implementation for nvim
  'jreybert/vimagit',

  -- Commit message helper
  'rhysd/committia.vim',

  -- Show blame commit in popup
  {
    'rhysd/git-messenger.vim',
    config = function()
      vim.g.git_messenger_floating_win_opts = { border = 'single' }
    end
  },

  -- Github CLI Integration
  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = true,
    cmd = 'Octo',
    config = function()
      require'octo'.setup{}
    end
  }
}
