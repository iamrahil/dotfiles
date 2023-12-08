return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          "lua",
          "ruby",
          "javascript",
        },
        ignore_install = { "json" },
        auto_install = true,
        highlight = {
          enable = true,
          disable = { "json" }
        },
      }
    end
  }
}
