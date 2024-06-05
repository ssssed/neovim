require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})


-- Setup language servers.
local lspconfig = require('lspconfig')

local opts =  { noremap=true, silent=true }

lspconfig.tsserver.setup({})
lspconfig.html.setup({})
lspconfig.cssls.setup({})

lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}


-- vim.api.nvim_set_keymap('n', 'r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
vim.api.nvim_set_keymap('n', 'td', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', opts)

--vim.keymap.set('i', '<leader>lr', '<Esc>vim.lsp.buf.rename')
--vim.keymap.set('n', '<leader>lr', 'vim.lsp.buf.rename')
--vim.keymap.set('i', '<leader>lr', 'vim.lsp.buf.rename')
--vim.keymap.set('n', '<leader>lr', 'vim.lsp.buf.rename')
