return {
  -- Support for patched fonts (nerdfonts.com)
  'nvim-tree/nvim-web-devicons',

  -- Underline word under the cursor
  'itchyny/vim-cursorword',

  -- Status line and tab line plugin
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup {
        extensions = {'nvim-tree', 'quickfix', 'aerial'},
      }
    end
  },
  {
    'nanozuki/tabby.nvim',
    dependencies = { 'lualine.nvim' },
    config = function()
      local util = require('tabby.util')
      local ltheme = {
        fill = util.extract_nvim_hl('lualine_b_normal'),
        tabline = util.extract_nvim_hl('lualine_c_normal'),
        tabline_sel = util.extract_nvim_hl('lualine_a_normal'),
      }
      require('tabby.tabline').use_preset('tab_only', {
        theme = {
          fill = ltheme.fill, -- tabline background
          head = ltheme.tabline, -- head element highlight
          current_tab = ltheme.tabline_sel, -- current tab label highlight
          tab = ltheme.tabline, -- other tab label highlight
          win = ltheme.tabline, -- window highlight
          tail = ltheme.tabline, -- tail element highlight
        },
        nerdfont = true, -- whether use nerdfont
      })
    end
  },
  -- Smooth scrolling
  {
    'declancm/cinnamon.nvim',
    config = function()
      require('cinnamon').setup({
        default_delay = 2
      })
    end
  },

  -- Breadcrumbs LSP path in winbar
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "neovim/nvim-lspconfig",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_basename = false,
      show_dirname = false
    }
  }
}
