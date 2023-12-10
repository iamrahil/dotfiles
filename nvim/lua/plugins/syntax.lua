return {
  -- Syntax check runnder
  'dense-analysis/ale',

  -- Surround shorcuts for paranthesis etc
  'tpope/vim-surround',

  -- Editorconfig plugin
  'editorconfig/editorconfig-vim',


  -- Detect and autoset sw and et
  'tpope/vim-sleuth',

  -- Format code
  {
    'stevearc/conform.nvim',
    ft = { 'ruby' },
    config = function()
      local opts = {
        formatters_by_ft = {
          ruby = { "rubocop" },
        },
      }

      require('conform').setup(opts)
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
      vim.api.nvim_create_user_command("Format", function(args)
        local range = nil
        if args.count ~= -1 then
          local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
          range = {
            start = { args.line1, 0 },
            ["end"] = { args.line2, end_line:len() },
          }
        end
        require("conform").format({ async = true, lsp_fallback = true, range = range })
      end, { range = true })
      vim.api.nvim_set_keymap('', '<leader>fs', ':Format<CR>', { noremap = true })
    end,
  },
}
