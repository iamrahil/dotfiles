local nvim_lsp = require('lspconfig')
local conf = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
function conf.keymaps(client, bufnr)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', "gds", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
  buf_set_keymap('n', "gws", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
  buf_set_keymap('n', "<leader>cl", [[<cmd>lua vim.lsp.codelens.run()<CR>]], opts)
  buf_set_keymap('n', "<leader>sh", [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', "<leader>ws", '<cmd>lua require"metals".hover_worksheet()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', "<leader>aa", [[<cmd>lua vim.diagnostic.setqflist()<CR>]], opts) -- all workspace diagnostics
  buf_set_keymap('n', "<leader>ae", [[<cmd>lua vim.diagnostic.setqflist({severity = "E"})<CR>]], opts) -- all workspace errors
  buf_set_keymap('n', "<leader>aw", [[<cmd>lua vim.diagnostic.setqflist({severity = "W"})<CR>]], opts) -- all workspace warnings
  buf_set_keymap('n', "<leader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts) -- buffer diagnostics only
  buf_set_keymap('n', '<leader>gD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  --buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--local servers = { "solargraph" }
--for _, lsp in ipairs(servers) do
  --nvim_lsp[lsp].setup {
    --on_attach = on_attach,
    --flags = {
      --debounce_text_changes = 150,
    --}
  --}
--end

return conf
--  vim: set ts=4 sw=2 tw=0 et :
