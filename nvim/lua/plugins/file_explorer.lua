return {
  -- File tree explorer
  {
    'kyazdani42/nvim-tree.lua',
    config = function()
      -- empty setup using defaults
      require("nvim-tree").setup({
        view = {
          adaptive_size = true
        },
        renderer = {
          indent_width = 1
        }
      })
    end
  },
  -- Legacy File tree explorer
  {
    'scrooloose/nerdtree',
    lazy = true,
    cmd = {'NERDTreeToggle'}
  }
}
