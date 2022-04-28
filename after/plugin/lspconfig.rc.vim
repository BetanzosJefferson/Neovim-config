lua << EOF
local nvim_lsp = require('lspconfig');
local protocol = require'vim.lsp.protocol';
-- Use an on_attach function to only map the following keys 
local on_attach = function(client, bufnr)

-- after the language server attaches to the current buffer
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
-- Mappings.
local opts = { noremap=true, silent=true }
-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
end


--TSSERVER
local coq = require "coq" -- add this
local capabilities = coq.lsp_ensure_capabilities()
nvim_lsp.tsserver.setup{
  on_attach = on_attach,
  capabilities= capabilities,
  filetypes={"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
}
EOF
