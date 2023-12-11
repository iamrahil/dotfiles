return {
  -- Use local npm for eslint
  {
    'benjie/local-npm-bin.vim',
    ft = { 'javascript', 'typescript' }
  },

  -- Scala integration
  {
    'scalameta/nvim-metals',
    dependencies = { 'goto-preview' },
  }
}
