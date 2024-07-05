local status, mason = pcall(require, 'mason')
if (not status) then return end
local lsp_status, lspconfig = pcall(require, 'mason-lspconfig')
if (not lsp_status) then return end

mason.setup {}
lspconfig.setup {
  ensure_installed = { 'tailwindcss' }
}

require 'lspconfig'.tailwindcss.setup {}
