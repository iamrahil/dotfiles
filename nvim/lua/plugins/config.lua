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
  local servers = { "solargraph" }
  for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
      on_attach = lspconf.keymaps,
      flags = {
        debounce_text_changes = 150,
      }
    }
  end
end

function config.gitmessenger()
  vim.g.git_messenger_floating_win_opts = { border = 'single' }
end
return config

-- vim: set ts=2 sw=2 tw=0 et :
