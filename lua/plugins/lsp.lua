
-- Setup language servers.
local lspconfig = require('lspconfig')

lspconfig.tsserver.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
