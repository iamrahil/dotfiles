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

function config.registers()
  require("registers").setup()
end

function config.lastplace()
  require'nvim-lastplace'.setup {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
  }
end

function config.lspconfig()
  -- Use a loop to conveniently call 'setup' on multiple servers and
  -- map buffer local keybindings when the language server attaches
  local nvim_lsp = require('lspconfig')
  local lspconf = require('configs.lsp')
  local servers = vim.g["custom#lspservers"]
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      capabilities = capabilities,
      on_attach = lspconf.loadlspconfig,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

function config.gitmessenger()
  vim.g.git_messenger_floating_win_opts = { border = 'single' }
end

function config.fidget()
  require('fidget').setup{}
end

function config.cinnamon()
  require('cinnamon').setup({
      default_delay = 2
    })
end

function config.cmp()
  local cmp = require('cmp')
  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    window = {
      --completion = cmp.config.window.bordered(),
      --documentation = cmp.config.window.bordered(),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }, {
        { name = 'buffer' },
      })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
end

function config.indentBlankline()
  require('ibl').setup {
    indent = {
      char = "¦",
      smart_indent_cap = true,
    }
  }
end

function config.autopairs()
  require("nvim-autopairs").setup {}
end

function config.endwise()
  require('nvim-treesitter.configs').setup {
    endwise = {
        enable = true,
    },
  }
end

function config.lualine()
  require('lualine').setup {
    extensions = {'nvim-tree', 'quickfix', 'aerial'},
    winbar = {
      lualine_c = {'filename'},
    },
    inactive_winbar = {
      lualine_c = {'filename'},
    }
  }
end

function config.tabby()
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

function config.glow()
  require('glow').setup()
end

function config.menufacture()
  require('telescope').load_extension 'menufacture'
end

function config.telescopetabs()
  require'telescope-tabs'.setup{}
end

function config.octo()
  require'octo'.setup{}
end

function config.luasnip()
  require("luasnip.loaders.from_vscode").lazy_load()
  require'luasnip'.filetype_extend("ruby", {"rails"})
end

return config

-- vim: set ts=2 sw=2 tw=0 et :
