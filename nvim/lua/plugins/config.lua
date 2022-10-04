local config = {}

function config.deoplete()
  vim.g['deoplete#enable_at_startup'] = 1
  vim.cmd([[

    " Use ALE and also some plugin 'foobar' as completion sources for all code.
    call deoplete#custom#option('sources', {
    \ '_': ['ale'],
    \})
  ]])
end

function config.telescope()
  require "telescope".setup {
    pickers = {
      colorscheme = {
        enable_preview = true
      }
    }
  }
end

function config.nvimtree()
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

function config.treesitter()
  require('nvim-treesitter.configs').setup {
    ensire_installed = {
      'lua',
      'ruby',
      'javascript',
      'json',
    },
    auto_install = true,
    highlight = {
      enable = true,
    },
  }
end

function config.lastplace()
  require'nvim-lastplace'.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
  }
end

return config

-- vim: set ts=2 sw=2 tw=0 et :
