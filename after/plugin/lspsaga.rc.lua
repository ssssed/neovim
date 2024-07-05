local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup {}

local opts = { noremap = true, silent = true }

vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga diagnostic_jump_next<cr>', opts)
vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<cr>', opts)

vim.keymap.set('n', 'gd', '<cmd>Lspsaga goto_definition<cr>', opts)
vim.keymap.set('n', '<F12>', '<cmd>Lspsaga goto_definition<cr>', opts)
vim.keymap.set('n', 'gpd', '<cmd>Lspsaga peek_definition<cr>', opts)

vim.keymap.set('n', 'gtd', '<cmd>Lspsaga goto_type_definition<cr>', opts)
vim.keymap.set('n', 'gtpd', '<cmd>Lspsaga peek_type_definition<cr>', opts)

vim.keymap.set('n', '<C-h>', '<cmd>Lspsaga signature_help<cr>', opts)
vim.keymap.set('i', '<C-h>', '<cmd>Lspsaga signature_help<cr>', opts)

vim.keymap.set('n', 'gp', '<cmd>Lspsaga preview_definition<cr>', opts)

vim.keymap.set('n', '<F2>', '<cmd>Lspsaga rename<cr>', opts)
vim.keymap.set('n', 'gr', '<cmd>Lspsaga rename<cr>', opts)
