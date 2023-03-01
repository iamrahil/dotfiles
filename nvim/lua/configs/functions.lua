-- This file defines list of global functions

-- TODO: Fix this for v3
-- https://github.com/lukas-reineke/indent-blankline.nvim/wiki/Migrate-to-version-3#configuration-variables
function togglecontext()
  bool = vim.g.indent_blankline_show_current_context
  require('indent_blankline').setup {
    show_current_context = not bool,
    show_current_context_start = not bool,
    context_char = '┆'
  }
end

function popmenu(prepend)
  vim.cmd([[aunmenu PopUp]])
  vim.cmd(prepend)
  vim.cmd([[
    vnoremenu PopUp.Cut                         "+x
    vnoremenu PopUp.Copy                        "+y
    anoremenu PopUp.Paste                       "+gP
    vnoremenu PopUp.Paste                       "+P
    vnoremenu PopUp.Delete                      "_x
    nnoremenu PopUp.Select\ All                 ggVG
    vnoremenu PopUp.Select\ All                 gg0oG$
    inoremenu PopUp.Select\ All                 <C-Home><C-O>VG
  ]])
end
