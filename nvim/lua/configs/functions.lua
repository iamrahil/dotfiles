-- This file defines list of global functions

function togglecontext()
  bool = vim.g.indent_blankline_show_current_context
  require('indent_blankline').setup {
    show_current_context = not bool,
    show_current_context_start = not bool,
    context_char = '┆'
  }
end
