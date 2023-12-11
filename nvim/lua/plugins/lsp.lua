return {
  -- Lsp config manager
  {
    'neovim/nvim-lspconfig',
    after = 'goto-preview',
    config = function()
      -- Use a loop to conveniently call 'setup' on multiple servers and
      -- map buffer local keybindings when the language server attaches
      local nvim_lsp = require('lspconfig')
      local lspconf = require('configs.lsp')
      local servers = vim.g["custom#lspservers"]
      if servers == nil then servers = {} end
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
  },

  -- Show tags in sidebar (lsp only)
  "stevearc/aerial.nvim",

  -- LSP goto preview
  {
    'rmagatti/goto-preview',
    dependencies = {'nvim-telescope/telescope.nvim'},
    lazy = true
  },

  -- Show LSP process progress
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    config = true
  }
}
