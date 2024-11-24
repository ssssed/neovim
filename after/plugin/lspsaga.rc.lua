local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup {
  lightbulb = {
    enable = false,
    sign = true,
    virtual_text = false,
    debounce = 10,
    sign_priority = 20,
  },
  ui = {
    code_action = "",
  }
}

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
