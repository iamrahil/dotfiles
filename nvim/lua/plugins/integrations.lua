return {
  -- Elixir integration
  'slashmili/alchemist.vim',

  -- Use local npm for eslint
  {
    'benjie/local-npm-bin.vim',
    ft = {'javascript'}
  },

  -- Scala integration
  {
    'scalameta/nvim-metals',
    after = 'goto-preview',
  }
}
