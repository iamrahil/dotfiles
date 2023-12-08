return {
  -- Use multiple cursors
  'terryma/vim-multiple-cursors',

  -- Extended motions
  'easymotion/vim-easymotion',


  -- Expand regions after selection
  'terryma/vim-expand-region',

  -- Highlight jumps for f,F,t,T
  {
    'unblevable/quick-scope',
    lazy = true,
    keys = { 'f', 'F', 't', 'T' },
    init = function()
      -- Trigger a highlight in the appropriate direction when pressing these keys:
       vim.g["qs_highlight_on_keys"] = { 'f', 'F', 't', 'T' }
    end
  },
}
