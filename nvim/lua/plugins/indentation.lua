return {
  -- Show indent lines
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('ibl').setup {
        indent = {
          char = "¦",
          smart_indent_cap = true,
        }
      }
    end
  }
}
