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
return config

-- vim: set ts=2 sw=2 tw=0 et :
