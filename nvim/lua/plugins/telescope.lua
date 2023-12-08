return {
  -- Popup fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    config = function()
      require "telescope".setup {
        pickers = {
          colorscheme = {
            enable_preview = true
          }
        }
      }
    end
  },
  -- extension to add filters in telescope finders
  {
    'molecule-man/telescope-menufacture',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
      require('telescope').load_extension 'menufacture'
    end
  },
  -- Telescope tab switcher
  {
    'LukasPietzschmann/telescope-tabs',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require'telescope-tabs'.setup{}
    end
  }
}
